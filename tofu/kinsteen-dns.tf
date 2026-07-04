resource "cloudflare_dns_record" "kinsteen_mx" {
  zone_id  = "1c1029fb7c3be285c0bb280473141e4a"
  name     = "staging.kinsteen.fr"
  ttl      = 1
  type     = "MX"
  content  = "mail.staging.kinsteen.fr"
  priority = 10
}
