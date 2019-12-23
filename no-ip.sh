#!/bin/sh

if [ -z "$USERNAME" ]
then
	echo "No user was set. Use -e USERNAME=username"
	exit 10
fi

if [ -z "$PASSWORD" ]
then
	echo "No password was set. Use -e PASSWORD=password"
	exit 20
fi

if [ -z "$HOSTNAME" ]
then
	echo "No host name was set. Use -e HOSTNAME=host.example.com"
	exit 30
fi

if [ -z "$INTERVAL" ]
then
	echo "No interval was set. Use -e INTERVAL=5"
	exit 35
fi

NOIPURL="https://dynupdate.no-ip.com/nic/update?hostname=$HOSTNAME"

while :
do
    echo "Updating IP address..."

	RESULT=$(curl -sS -u "$USERNAME":"$PASSWORD" "$NOIPURL")

	echo "Result: $RESULT"

	if [ "$INTERVAL" -eq 0 ]
	then
		break
	else
        echo "Waiting for ${INTERVAL} minutes..."
		sleep "${INTERVAL}m" & wait $!
	fi
done

exit 0
