resource "network" "main" {
  subnet = "10.0.5.0/24"
}

resource "container" "shell" {
  network {
    id = resource.network.main.meta.id
  }

  image {
    name = "ubuntu:22.04"
  }

  resources {
    cpu    = 1000
    memory = 256
  }
}
