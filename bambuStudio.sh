#!/bin/sh
HASS_TOKEN=`security find-generic-password -a ${USER} -s "homeassistant_auth_token" -w`

# turn on printer with configured HomeAssistant switch
curl -s \
  -H "Authorization: Bearer ${HASS_TOKEN}" \
  -H "Content-Type: application/json" \
  -d "{\"entity_id\": \"${HASS_SWITCH_ENTITY_ID}\"}" \
  "${HASS_BASE_URL}/api/services/switch/turn_on"

# open BambuStudio app
open -a "BambuStudio"
