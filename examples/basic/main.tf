module "endpoint" {
  source = "../../"

  name     = "example"
  hostname = "www.example.com"
  service  = "example-service"
}
