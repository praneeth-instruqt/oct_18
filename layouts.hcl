resource "layout" "with_instructions" {
  column {
    tab "terminal" {
      target = resource.terminal.terminal
      title  = "terminal"
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
