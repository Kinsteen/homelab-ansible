locals {
  zone_id = "09446ae5bf3d653d3203b967d68982d7"
  content = "home.francon.eu"

  dns_records = {
    authentik   = { name = "auth.francon.eu",         proxied = true  }
    bookstack   = { name = "docs.francon.eu",         proxied = true  }
    drive       = { name = "drive.francon.eu",        proxied = false }
    immich      = { name = "immich.francon.eu",       proxied = false }
    jellyfin    = { name = "media.francon.eu",        proxied = true  }
    mealie      = { name = "mealie.francon.eu",       proxied = true  }
    nas         = { name = "nas.francon.eu",          proxied = false }
    pelican     = { name = "panel.francon.eu",        proxied = true  }
    prowlarr    = { name = "prowlarr.francon.eu",     proxied = true  }
    radarr      = { name = "radarr.francon.eu",       proxied = true  }
    sonarr      = { name = "sonarr.francon.eu",       proxied = true  }
    vaultwarden = { name = "vault.francon.eu",        proxied = true  }
    wing2       = { name = "wing2.francon.eu",        proxied = false }
  }
}

resource "cloudflare_dns_record" "dns" {
  for_each = local.dns_records

  name     = each.value.name
  ttl      = 1
  type     = "CNAME"
  zone_id  = local.zone_id
  content  = local.content
  proxied  = each.value.proxied
}
