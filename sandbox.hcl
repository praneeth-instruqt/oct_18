resource "network" "main" {
  subnet = "10.0.5.0/24"
}

resource "container" "shell" {
  network {
    target = resource.network.main
  }

  image {
    name = "google/cloud-sdk:latest"
  }

  resources {
    cpu    = 2000
    memory = 2048
  }

  command    = ["infinity"]
  entrypoint = ["sleep"]
  environment = {
    "GOOGLE_APPLICATION_CREDENTIALS"                         = "/root/.config/gcloud/credentials.json"
    "INSTRUQT_GCP_PROJECT_GCP_PROJECT_PROJECT_ID"            = resource.google_project.gcp-project.project_id
    "INSTRUQT_GCP_PROJECT_GCP_PROJECT_USER_EMAIL_STUDENT"    = resource.google_project.gcp-project.user.student.email
    "INSTRUQT_GCP_PROJECT_GCP_PROJECT_USER_PASSWORD_STUDENT" = resource.google_project.gcp-project.user.student.password
    "TERM"                                                   = "xterm-256color"
  }

  volume {
    destination = "/tmp/app"
    source      = "files/app"
  }
}

resource "google_project" "gcp-project" {
  regions = ["us-east1"]
  services = [
    "run.googleapis.com",
    "artifactregistry.googleapis.com",
    "cloudbuild.googleapis.com",
    "containerregistry.googleapis.com"
  ]

  user "student" {
    roles = ["roles/owner"]
  }
}

resource "exec" "setup-env" {
  script  = "scripts/exec/setup-env/script.sh"
  target  = resource.container.shell
  timeout = "60s"
}

resource "copy" "copy-app" {
  destination = "/tmp/app"
  source      = "files/app"
}
