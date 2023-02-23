# Для теста использовать: terraform plan -var-file=../.secure_files/terraform.tfvars
# Для разворачивания:     terraform apply -var-file=../.secure_files/terraform.tfvars

# Create VM
resource "yandex_compute_instance" "vm" {
  for_each    = var.image_family
  name        = "${var.numpw}-${each.key}"
  platform_id = var.platform_id
  zone        = var.zone

  resources {
    core_fraction = 100
    cores         = 4
    memory        = 8
  }

  # Прерываемый
  scheduling_policy {
    preemptible = true
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.image[each.key].id
      type     = "network-hdd"
      size     = 50
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }

  metadata = {
    user-data = file(var.ya_cloud_init)
  }
}

# Получение image id, для получения списка образов: yc compute image list --folder-id standard-images
data "yandex_compute_image" "image" {
  for_each = var.image_family
  family   = each.value
}

# Создание сети
resource "yandex_vpc_network" "network" {
  name = "${var.numpw}-network"
}

# Подсеть
resource "yandex_vpc_subnet" "subnet" {
  name           = "${var.numpw}-subnet-1"
  v4_cidr_blocks = ["192.168.10.0/24"]
  zone           = var.zone
  network_id     = yandex_vpc_network.network.id
}

resource "cloudflare_record" "ssh" {
  for_each = var.image_family
  zone_id  = var.cloudflare_zone_id
  name     = length(var.image_family) == 1 ? "ssh" : "ssh-${each.key}"
  value    = yandex_compute_instance.vm[each.key].network_interface[0].nat_ip_address
  type     = "A"
  proxied  = false
}

resource "cloudflare_record" "vm" {
  for_each = var.image_family
  zone_id  = var.cloudflare_zone_id
  name     = length(var.image_family) == 1 ? "*" : each.key
  value    = yandex_compute_instance.vm[each.key].network_interface[0].nat_ip_address
  type     = "A"
  proxied  = true
}

# Генерация ansible inventory https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file
locals {
  hosts = templatefile("${path.module}/templates/hosts.tpl", {
    adresses = { for vm, ip in yandex_compute_instance.vm : vm => ip.network_interface[0].nat_ip_address }
  })
}

resource "local_file" "inventory" {
  content         = local.hosts
  filename        = "${path.module}/../hosts"
  file_permission = "0600"
}
