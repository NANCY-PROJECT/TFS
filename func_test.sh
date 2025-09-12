#!/bin/bash

# ****************************
# *** Run Functional tests ***
# ****************************

HOST_URL=$1
echo $HOST_URL

# *** Test #1: Check the simple API call
responseCode=$(curl -s -o /dev/null -I -w "%{http_code}"  ${HOST_URL})
if [[ ${responseCode} != 200 ]]; then
    echo "Response code: $responseCode"
    echo "*** Dummyrest API is not running"
    exit 1
fi

# *** Test #2: Check the authors and books API
responseCode=$(curl -s -o /dev/null -I -w "%{http_code}"  ${HOST_URL}/authors)
if [[ ${responseCode} != 200 ]]; then
    echo "Response code: $responseCode"
    echo "*** Authors API was not found"
    exit 1
fi

responseCode=$(curl -s -o /dev/null -I -w "%{http_code}"  ${HOST_URL}/books)
if [[ ${responseCode} != 200 ]]; then
    echo "Response code: $responseCode"
    echo "*** Books API was not found"
    exit 1
fi

# *** Test #3: Check the dummy POST API
INPUT_DATA='{"project": "NANCY", "wp": 6}'
RECIEVED_DATA=$(curl -XPOST -H "Content-type:Application/json" -d "${INPUT_DATA}"  ${HOST_URL}/dummy)
if [[ ${RECIEVED_DATA} != ${INPUT_DATA} ]]; then
    echo "*** Dummy POST API is not working properly"
    exit 1
fi

echo "*** Functional tests were successful ***"
