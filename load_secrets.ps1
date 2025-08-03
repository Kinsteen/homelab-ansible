$Folder = "b497c8c9-8fe7-4dbd-8de9-9f15cb2ba825" # "Homelab" on bitwarden

$SessionKey = bw unlock --raw

$env:AWS_ACCESS_KEY_ID = bw list items --folderid $Folder --search AWS_ACCESS_KEY_ID --session $SessionKey | jq -r '.[0].login.password'
$env:AWS_SECRET_ACCESS_KEY = bw list items --folderid $Folder --search AWS_SECRET_ACCESS_KEY --session $SessionKey | jq -r '.[0].login.password'
$env:CLOUDFLARE_API_TOKEN = bw list items --folderid $Folder --search CLOUDFLARE_API_TOKEN --session $SessionKey | jq -r '.[0].login.password'
$env:TF_VAR_proxmox_root_password = bw list items --folderid $Folder --search PROXMOX_ROOT_PASSWORD --session $SessionKey | jq -r '.[0].login.password'

bw lock
