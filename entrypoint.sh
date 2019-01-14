#!/bin/sh

cat >/isso.conf <<EOF
[general]
dbpath = /data/isso.db
name = ${ISSO_NAME:-comments.example.com}
host = ${ISSO_HOST:-http://example.com}
max-age = ${ISSO_MAX_AGE:-30m}
admin_password = ${ISSO_ADMIN_PASSWORD:-secret}
notify = ${ISSO_NOTIFY:-stdout}

[server]
listen = http://0.0.0.0:80

[guard]
enabled = true
ratelimit = 2
direct-reply = 3
reply-to-self = ${ISSO_REPLY_TO_SELF:-false}
require-email = ${ISSO_REQUIRE_EMAIL:-false}
require-author = ${ISSO_REQUIRE_AUTHOR:-false}

[smtp]
username = ${ISSO_SMTP_USERNAME}
password = ${ISSO_SMTP_PASSWORD}
host = ${ISSO_SMTP_HOST:-localhost}
port = ${ISSO_SMTP_PORT:-587}
security = ${ISSO_SMTP_SECURITY:-starttls}
to = ${ISSO_SMTP_TO}
from = ${ISSO_SMTP_FROM}
timeout = 10

EOF

exec isso -c /isso.conf "$@"
