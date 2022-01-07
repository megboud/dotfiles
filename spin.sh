status() {
  systemctl status proc-shopify--shopify@server.service
}

logs() {
  journalctl -fu proc-shopify--shopify@server.service
}

stop() {
  systemctl stop proc-shopify--shopify@server.service
}

restart() {
  systemctl restart proc-shopify--shopify@server.service
}

update_bundle() {
  bundle config --global PKGS__SHOPIFY__IO "token:$(gsutil cat gs://dev-tokens/cloudsmith/shopify/gems/latest)"
}
