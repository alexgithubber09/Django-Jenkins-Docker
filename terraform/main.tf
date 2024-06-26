terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone      = "ru-central1-a"
  folder_id = "b1gs9jgeem3h51v6d944"
  cloud_id = "b1gs8eojfi8f00fptsd1"
  token = "y0_AgAAAAB1ZWDpAATuwQAAAAEHyvnJAAAECCvCQTlNWbSMUrq6CBiqYGZRjw"
}

resource "yandex_compute_disk" "boot-disk-1" {
  name     = "boot-disk-1"
  type     = "network-hdd"
  zone     = "ru-central1-a"
  size     = "30"
  image_id = "fd88ccvugii4hak0ubss"
}

resource "yandex_compute_instance" "vm-1" {
  name = "jenkins"

  scheduling_policy {
    preemptible = "true"
  }

  resources {
    cores         = 2
    memory        = 4
  }

  boot_disk {
    disk_id = yandex_compute_disk.boot-disk-1.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    user-data = "${file("/home/test/metadata.yml")}"
  }
}

resource "yandex_compute_disk" "boot-disk-2" {
  name     = "boot-disk-2"
  type     = "network-hdd"
  zone     = "ru-central1-a"
  size     = "30"
  image_id = "fd88ccvugii4hak0ubss"
}

resource "yandex_compute_instance" "vm-2" {
  name = "agent"

  scheduling_policy {
    preemptible = "true"
  }

  resources {
    cores         = 2
    memory        = 4
  }

  boot_disk {
    disk_id = yandex_compute_disk.boot-disk-2.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    user-data = "${file("/home/test/metadata.yml")}"
  }
}


resource "yandex_compute_disk" "boot-disk-3" {
  name     = "boot-disk-3"
  type     = "network-hdd"
  zone     = "ru-central1-a"
  size     = "30"
  image_id = "fd88ccvugii4hak0ubss"
}

resource "yandex_compute_instance" "vm-3" {
  name = "prometheus"

  scheduling_policy {
    preemptible = "true"
  }

  resources {
    cores         = 2
    memory        = 4
  }

  boot_disk {
    disk_id = yandex_compute_disk.boot-disk-3.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    user-data = "${file("/home/test/metadata.yml")}"
  }
}


resource "yandex_compute_disk" "boot-disk-4" {
  name     = "boot-disk-4"
  type     = "network-hdd"
  zone     = "ru-central1-a"
  size     = "30"
  image_id = "fd88ccvugii4hak0ubss"
}

resource "yandex_compute_instance" "vm-4" {
  name = "elastic"

  scheduling_policy {
    preemptible = "true"
  }

  resources {
    cores         = 2
    memory        = 6
  }

  boot_disk {
    disk_id = yandex_compute_disk.boot-disk-4.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    user-data = "${file("/home/test/metadata.yml")}"
  }
}



resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.100.0/24"]
}

