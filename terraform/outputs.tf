# Внешний ip виртуалки
output "external_ip_address_vm" {
  value = [for ip in yandex_compute_instance.vm : ip.network_interface[0].nat_ip_address]
}

output "test" {
  value = templatefile("${path.module}/templates/hosts.tpl", {
    adresses = { for vm, ip in yandex_compute_instance.vm : vm => ip.network_interface[0].nat_ip_address }
  })
}