#!/bin/ash
pkg add docker
rc-service docker start
rc-update add docker

mkdir -p data/bitping

read -rp "Do you want to set up the configuration now? (y/n) " setup_now

if [ "$setup_now" = "y" ]; then
    # Get the hostname for the default DEVICE_NAME
    DEVICE_NAME=$(hostname)

    # Generate a random EARNAPP_DEVICE_ID
    EARNAPP_DEVICE_ID="sdk-node-$(echo "$RANDOM$RANDOM" | md5sum | cut -c 1-32)"

    # Generate a random Proxyrack UUID
    PROXYRACK_HOST_UUID=$(cat /dev/urandom | LC_ALL=C tr -dc 'A-F0-9' | dd bs=1 count=64 2>/dev/null)

    read -rp "Device name [${DEVICE_NAME}]: " input
    DEVICE_NAME="${input:-$DEVICE_NAME}"

    read -rp "Are all the email addresses the same? (y/n) " same_emails
    if [ "$same_emails" = "y" ]; then
        read -rp "Email: " email
        HONEYGAIN_EMAIL=$email
        IPROYALPAWNS_EMAIL=$email
        PEER2PROFIT_EMAIL=$email
        RP_EMAIL=$email
    else
        read -rp "Honeygain email: " HONEYGAIN_EMAIL
        read -rp "IproyalPawns email: " IPROYALPAWNS_EMAIL
        read -rp "Peer2profit email: " PEER2PROFIT_EMAIL
        read -rp "Repocket email: " RP_EMAIL
    fi

    read -rsp "Honeygain password: " HONEYGAIN_PASSWD
    echo
    read -rsp "IproyalPawns password: " IPROYALPAWNS_PASSWD
    echo

    read -rp "Earnapp device ID [${EARNAPP_DEVICE_ID}]: " input
    EARNAPP_DEVICE_ID="${input:-$EARNAPP_DEVICE_ID}"

    read -rp "Device name [${DEVICE_NAME}]: " input
    DEVICE_NAME="${input:-$DEVICE_NAME}"

    read -rp "Packetstream CID: " PACKETSTREAM_CID
    read -rp "Traffmonetizer token: " TRAFFMONETIZER_TOKEN
    read -rp "Repocket API key: " RP_API_KEY
    read -rp "Proxylite user ID: " PROXYLITE_USER_ID
    read -rp "Proxyrack host UUID [${PROXYRACK_HOST_UUID}]: " input
    PROXYRACK_HOST_UUID="${input:-$PROXYRACK_HOST_UUID}"
    read -rp "EarnFm API key: " EARNFM_APIKEY

    cat > .env << EOF
# Computer name (for display in app dashboard)
DEVICE_NAME=$DEVICE_NAME

# Your Earnapp device id : ! must start with sdk-node-<md5sum>
EARNAPP_DEVICE_ID=$EARNAPP_DEVICE_ID

# Your Honeygain account email
# Your Honeygain account password
HONEYGAIN_EMAIL=$HONEYGAIN_EMAIL
HONEYGAIN_PASSWD=$HONEYGAIN_PASSWD

# Your IproyalPawns account email
# Your IproyalPawns account password
IPROYALPAWNS_EMAIL=$IPROYALPAWNS_EMAIL
IPROYALPAWNS_PASSWD=$IPROYALPAWNS_PASSWD

# Your Peer2profit account email
PEER2PROFIT_EMAIL=$PEER2PROFIT_EMAIL

# Your packetstream CID (to retrieve in your packetstream dashboard : Section : download -> Looking for linux app -> docker command : -e CID=xxxx)
PACKETSTREAM_CID=$PACKETSTREAM_CID

# Your traffmonetizer token (to retrieve in your traffmonetizer dashboard : Section : dashboard -> Your application token
TRAFFMONETIZER_TOKEN=$TRAFFMONETIZER_TOKEN

# Your Repocket account email
# Your Repocket API KEY (to retrieve in your repocket dashboard)
RP_EMAIL=$RP_EMAIL
RP_API_KEY=$RP_API_KEY

# Your Proxylite USER ID (to retrieve in your proxylite dashboard)
PROXYLITE_USER_ID=$PROXYLITE_USER_ID

# Your Proxyrack UUID (random string : use for instance : cat /dev/urandom | LC_ALL=C tr -dc 'A-F0-9' | dd bs=1 count=64 2>/dev/null )
#   Don't forget to add this UUID in your dashboard (wait 5 minutes after starting container)
PROXYRACK_HOST_UUID=$PROXYRACK_HOST_UUID

# Your EarnFm api key (to retrieve in your earnfm dashboard, section more)
EARNFM_APIKEY=$EARNFM_APIKEY

_COMPOSE_PROJECT_NAME=cashfactory
_COMPOSE_PROJECT_STACK_ID=1
EOF

    echo "Configuration saved to .env"
else
    echo "Please set up the configuration manually."
fi