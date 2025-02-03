# Opens common http/https ports. 
# No args.
# Use with care.


# IPs
$HOST_IP = "192.168.0.2"
$WSL_IP = "172.28.140.74"

# Ports
$HTTPPORTS = @(80, 1080, 2080, 3080, 4080, 5080, 6080, 7080, 8000, 8080, 9080)
$HTTPSPORTS = @(443, 1443, 2443, 3443, 4443, 5443, 6443, 7443, 8443, 9443)


foreach ($PORT in $HTTPPORTS + $HTTPSPORTS) {
  # Remove this port binding if it's already present
  netsh interface portproxy delete v4tov4 listenaddress=$HOST_IP listenport=$PORT 
  # Port forward
  netsh interface portproxy add v4tov4 listenaddress=$HOST_IP listenport=$PORT connectaddress=$WSL_IP connectport=$PORT
  # Firewall exception
  New-NetFirewallRule -DisplayName "WSL: $PORT" -Direction Inbound -Protocol TCP -LocalPort $PORT -Action Allow
}

netsh interface portproxy show v4tov4
