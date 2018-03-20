#!/bin/bash

### Google Domains provides an API to update a DNS "Synthetic record". This script
### updates a record with the script-runner's public IP, as resolved using a DNS
### lookup.
###
### Google Dynamic DNS: https://support.google.com/domains/answer/6147083
### Synthetic Records: https://support.google.com/domains/answer/6069273

### Jesse Buffington (bassmastry101@gmail.com)
### Github: https://github.com/bassmastry101/GoogleDDNS

if [ "$1" == "-h" ] || [ "$1" == "--help" ];
  then
    echo "
      Usage: $0 [USERNAME PASSWORD FQDN]
      ------

      -h | --help
        Shows this help menu!

      **Please review the Google help page to get credentials for DDNS**
              https://support.google.com/domains/answer/6147083


"
    exit
fi

# Resolve current public IP
IP=$(curl http://ipv4.icanhazip.com/)

# Update Google DNS Record
URL="https://$1:$2@domains.google.com/nic/update?hostname=$3&myip=${IP}"

curl -s $URL
