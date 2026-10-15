resource "layout" "with_instructions" {
  column {
    tab "terminal" {
      target = resource.terminal.terminal
      title  = "terminal"
    }

    tab "gcp-creds" {
      target = resource.cloud_credentials.gcp-creds
      title  = "GCP Credentials"
    }

    tab "gcp-console" {
      target = resource.virtual_browser.gcp-console
      title  = "GCP Console"
    }

    width = "50"
  }

  column {
    instructions {
      title = "Instructions"
    }

    width = "50"
  }
}

resource "layout" "shell_only" {
  column {
    tab "terminal" {
      target = resource.terminal.terminal
      title  = "terminal"
    }

    width = "100"
  }
}
