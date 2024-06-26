output "internal_jenkins" {
  value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}

output "external_jenkins" {
  value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
}

output "internal_agent" {
  value = yandex_compute_instance.vm-2.network_interface.0.ip_address
}

output "external_agent" {
  value = yandex_compute_instance.vm-2.network_interface.0.nat_ip_address
}

output "internal_prometheus" {
  value = yandex_compute_instance.vm-3.network_interface.0.ip_address
}

output "external_prometheus" {
  value = yandex_compute_instance.vm-3.network_interface.0.nat_ip_address
}

output "internal_elastic" {
  value = yandex_compute_instance.vm-4.network_interface.0.ip_address
}

output "external_elastic" {
  value = yandex_compute_instance.vm-4.network_interface.0.nat_ip_address
}

