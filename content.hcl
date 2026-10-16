resource "page" "shell" {
  file  = "instructions/__default/shell.md"
  title = "shell only"
}

resource "page" "intro" {
  file  = "instructions/__default/intro.md"
  title = "intro"
}

resource "page" "wrap" {
  file  = "instructions/__default/wrap.md"
  title = "wrap up"
}

resource "page" "deploy-app" {
  activities = {
    "deploy-cloud-run" = resource.task.deploy-cloud-run
    "verify-app"       = resource.task.verify-app
  }
  file  = "instructions/deploy-app.md"
  title = "Deploy to Cloud Run"
}

resource "page" "setup-environment" {
  activities = {
    "enable-apis"   = resource.task.enable-apis
    "verify-gcloud" = resource.task.verify-gcloud
  }
  file  = "instructions/setup-environment.md"
  title = "Set Up Your Environment"
}

resource "page" "build-app" {
  activities = {
    "build-image" = resource.task.build-image
    "create-repo" = resource.task.create-repo
  }
  file  = "instructions/build-app.md"
  title = "Build the App"
}

resource "page" "wrap-up" {
  file  = "instructions/wrap-up.md"
  title = "Wrap Up"
}
