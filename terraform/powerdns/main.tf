
# Add a zone
resource "powerdns_zone" "foobar" {
  name        = "example.com."
  kind        = "Native"
  nameservers = ["ns1.example.com.", "ns2.example.com."]
}

# Add two A records for www.example.com
resource "powerdns_record" "foobar" {
  zone    = "example.com."
  name    = "www.example.com."
  type    = "A"
  ttl     = 300
  records = ["192.168.0.11", "192.126.0.12"]
}

