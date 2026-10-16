resource "lab" "main" {
  title       = "praneeth-lab-test"
  description = "Test lab for repo sync (updated 2026-10-16 from CLI).\n"

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
    chapter "__default" {
      page "intro" {
        reference = resource.page.intro
        title     = "intro"
      }

      page "shell" {
        reference = resource.page.shell
        title     = "shell only"
        layout    = resource.layout.shell_only
      }

      page "wrap" {
        reference = resource.page.wrap
        title     = "wrap up"
      }

      title = "Default"
    }
  }
}
