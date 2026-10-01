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
