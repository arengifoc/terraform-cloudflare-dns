module "dns" {
  source = "../../"

  account_id = "7e60b0f31a709ce29a0260220ecf5267"
  zone       = "sfinetworks.net"

  records = {
    "beta" = {
      name  = "beta"
      value = "191.98.177.169"
      type  = "A"
    }
  }
}
