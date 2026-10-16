resource "lab" "main" {
  title       = "praneeth-lab-test"
  description = "Test lab for repo sync (updated 2026-10-16 from CLI).\n"
  title       = "Deploy a Web App on Google Cloud"
  description = "Build a Python Flask app, containerize it, push it to Artifact Registry, and deploy it to Cloud Run — all from the command line."

  # timelimit and idle are both required on every lab.
  settings {
    theme = "modern-dark"

    timelimit {
      duration = "1h"
    }

    idle {
      enabled = true
      timeout = "15m"
    }
  }

  layout = resource.layout.with_instructions

  content {
    chapter "set-up" {
      title = "Set Up Your Environment"

      page "setup-environment" {
        reference = resource.page.setup-environment
      }
    }

    chapter "build" {
      title = "Build the App"

      page "build-app" {
        reference = resource.page.build-app
      }
    }

    chapter "deploy" {
      title = "Deploy to Cloud Run"

      page "deploy-app" {
        reference = resource.page.deploy-app
      }
    }

    chapter "wrap-up" {
      title = "Wrap Up"

      page "wrap-up" {
        reference = resource.page.wrap-up
      }
    }
  }
}
