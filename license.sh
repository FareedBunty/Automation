#!/bin/bash
# JSON data with the new email address
DATA='{
    "useremail": "fareed.ahmad@ebryx.com"
}'

# API endpoint URL
URL="https://44.202.37.81:8443/api/users/email/1"

# Create the auth.json file with authentication credentials
cat > auth.json <<END
{"username":"admin@invisily.com","password":"Invisily123!"}
END

# Authentication token
AUTH_TOKEN=$(curl -v https://44.202.37.81:8443/api/authentication -H 'Connection: keep-alive' -H 'sec-ch-ua: "Chromium";v="92", " Not A;Brand";v="99", "Google Chrome";v="92"' -H 'Accept: application/json, text/plain, */*' -H 'sec-ch-ua-mobile: ?0' -H "User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36" -H 'Content-Type: application/json' -H 'Origin: https://44.202.37.81:8443' -H 'Sec-Fetch-Site: same-origin' -H 'Sec-Fetch-Mode: cors' -H 'Sec-Fetch-Dest: empty' -H 'Referer: https://44.202.37.81:8443/web/login' -H 'Accept-Language: en-US,en;q=0.9' -d @auth.json --compressed --insecure | awk -F ":" '{print $4}' | awk -F "," '{print $1}' | tr -d '"')
echo "$AUTH_TOKEN"

# Send the HTTP request using curl
curl -v -k -X PUT "$URL" -H "Authorization: Bearer $AUTH_TOKEN" -H "Content-Type: application/json" -d "$DATA"

