if [[ $EUID -ne 0 ]]; then
  echo "Please run as root or use sudo"
  exit 1
fi
 

INTERFACE=$(ip -o link show up | awk -F': ' '{print $2}' | grep -v lo | head -n 1)

if [[ -z "$INTERFACE" ]]; then
  echo "No suitable network interface found."
  exit 1
fi

echo "Selected interface: $INTERFACE"


tcpdump -i "$INTERFACE" -n -v 
