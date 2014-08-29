wifi_cycle() {
  CURRENT_DEVICE=$(networksetup -listallhardwareports | awk '$3=="Wi-Fi" {getline; print $2}')
  echo "Power-cycling: '$CURRENT_DEVICE'"

  networksetup -setairportpower $CURRENT_DEVICE off
  networksetup -setairportpower $CURRENT_DEVICE on
}
