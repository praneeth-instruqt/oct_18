resource "terminal" "terminal" {
  target = resource.container.shell
}

resource "cloud_credentials" "gcp-creds" {
  google_project {
    target = resource.google_project.gcp-project
    users  = ["student"]
  }
}

resource "virtual_browser" "gcp-console" {
  url = "https://console.cloud.google.com"
}
