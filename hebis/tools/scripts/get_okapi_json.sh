#!/bin/bash

while getopts t:p: arg
do
  case "$arg" in
    p)
      OKAPI_PATH=${OPTARG}
      ;;
    t)
      TENANT_ID=${OPTARG}
      ;;
    *)
      echo "Usage: -p <okapi path>, -t <tenant id>"
  esac
done

OKAPI_URL=https://folioplus.hebis-services.de:8443
DATA_FILE=${OKAPI_PATH}.json

read -r user password

OKAPI_TOKEN=$(curl -s -S -D - \
               -H "X-Okapi-Tenant: ${TENANT_ID}" \
               -H "Content-type: application/json" \
               -H "Accept: application/json" \
               -d '{ "tenant" : "'${TENANT_ID}'", "username" : "'${user}'", "password" : "'${password}'" }' \
               ${OKAPI_URL}/authn/login | grep -i "^x-okapi-token: "
            )

# tail is necessary because curl silent parameter doesn't work here (?)
curl -s -S -w '\n' -D - -X GET -H "${OKAPI_TOKEN}" \
     -H "X-Okapi-Tenant: ${TENANT_ID}" "${OKAPI_URL}/${OKAPI_PATH}" | tail -n +8 > "${DATA_FILE}"
