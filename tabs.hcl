resource "terminal" "terminal" {
  target = resource.container.shell
}
