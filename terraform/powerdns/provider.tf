terraform {
  required_providers {
    powerdns = {
      source = "pan-net/powerdns"
    }
  }
}

provider "powerdns" {
  server_url = "https://host:port/" 
  api_key    = "secret"              
}
