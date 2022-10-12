#!/bin/bash

OKAPI_URL=https://folioplus.hebis-services.de:8443
LIMIT_RESULTS=100

if [ $# -eq 0 ]; then
  echo "Usage: -p <okapi path>, -t <tenant id>, -l <result limit>"
  exit 1
fi

while getopts t:p:l: arg
do
  case "$arg" in
    p)
      OKAPI_PATH=${OPTARG}
      DATA_FILE=${OKAPI_PATH}.json
      ;;
    t)
      TENANT_ID=${OPTARG}
      ;;
    l)
      LIMIT_RESULTS=${OPTARG}
      ;;
    *)
      echo "Usage: -p <okapi path>, -t <tenant id>, -l <result limit>"
  esac
done

read -r user password

OKAPI_TOKEN=$(curl -s -S -D - \
               -H "X-Okapi-Tenant: ${TENANT_ID}" \
               -H "Content-type: application/json" \
               -H "Accept: application/json" \
               -d '{ "tenant" : "'${TENANT_ID}'", "username" : "'${user}'", "password" : "'${password}'" }' \
               ${OKAPI_URL}/authn/login | grep -i "^x-okapi-token: "
            )

# tail is necessary because curl silent parameter doesn't work here (?)
# Default limit for number of results = 100
curl -s -S -w '\n' -D - -X GET -H "${OKAPI_TOKEN}" \
     -H "X-Okapi-Tenant: ${TENANT_ID}" "${OKAPI_URL}/${OKAPI_PATH}?limit=${LIMIT_RESULTS}" \
     | tail -n +8 > "${DATA_FILE}"
