%{for vm, ip in adresses ~}
%{if "popa" == "popa"}[${vm}]
ansible@${ip} ansible_ssh_private_key_file=~/.ssh/ansible%{ endif }
%{ endfor ~}