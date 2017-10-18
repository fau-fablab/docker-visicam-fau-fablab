#/bin/bash
set -e
DEVICE=/dev/video0
SCRIPTDIR=$(dirname "${0}")
OUTPUT="/tmp/visicam.jpg"
mkdir -p "$(dirname "${OUTPUT}")"
rm -f "${OUTPUT}"
# disable "backlight compensation" damit belichtung nicht hart kaputt geht
v4l2ctrl -d ${DEVICE} -l "${SCRIPTDIR}/v4l2ctrl-settings"
touch "${OUTPUT}"
fswebcam -d ${DEVICE} -r 1600x1200 --flip h,v --no-banner --set "Brightness=128" --set "Contrast=32" --set "Gain=200" --jpeg 100 "${OUTPUT}" > "/var/log/visicam.log"
# fswebcam ist zu blöd saubere ausgabe zu liefern
test -s "${OUTPUT}" || { >&2 cat "/var/log/visicam.log"; exit 1; }
