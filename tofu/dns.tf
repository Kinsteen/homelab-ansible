locals {
  zone_id = "09446ae5bf3d653d3203b967d68982d7"
  content = "home.francon.eu"

  dns_records = {
    authentik   = { name = "auth.francon.eu",         proxied = false  }
    bookstack   = { name = "docs.francon.eu",         proxied = false  }
    drive       = { name = "drive.francon.eu",        proxied = false }
    immich      = { name = "immich.francon.eu",       proxied = false }
    jellyfin    = { name = "media.francon.eu",        proxied = false  }
    mealie      = { name = "mealie.francon.eu",       proxied = false  }
    nas         = { name = "nas.francon.eu",          proxied = false }
    pelican     = { name = "panel.francon.eu",        proxied = false  }
    prowlarr    = { name = "prowlarr.francon.eu",     proxied = false  }
    radarr      = { name = "radarr.francon.eu",       proxied = false  }
    sonarr      = { name = "sonarr.francon.eu",       proxied = false  }
    vaultwarden = { name = "vault.francon.eu",        proxied = false  }
    wing2       = { name = "wing2.francon.eu",        proxied = false }
    giftcrossing = { name = "gift-crossing.francon.eu", proxied = false }
    torrent      = { name = "torrent.francon.eu",     proxied = false }
    timeline      = { name = "timeline.francon.eu",     proxied = false }
    cloud      = { name = "cloud.francon.eu",     proxied = false }
    collabora      = { name = "collabora.francon.eu",     proxied = false }
    wopiserver      = { name = "wopiserver.francon.eu",     proxied = false }
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
