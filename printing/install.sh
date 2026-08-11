#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing CUPS printing config..."

sudo cp "$SCRIPT_DIR/EPSON_ET_4550_Series.ppd" /etc/cups/ppd/EPSON_ET_4550_Series.ppd
sudo cp "$SCRIPT_DIR/printers.conf" /etc/cups/printers.conf
sudo chown root:lp /etc/cups/ppd/EPSON_ET_4550_Series.ppd
sudo chown root:lp /etc/cups/printers.conf
sudo chmod 644 /etc/cups/ppd/EPSON_ET_4550_Series.ppd
sudo chmod 600 /etc/cups/printers.conf

sudo systemctl restart cups

echo "Done. Printer status:"
lpstat -p EPSON_ET_4550_Series
