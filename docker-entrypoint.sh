#!/bin/bash

# Security defaults
: "${ADMIN_PASSWORD:=admin}"
: "${LIST_DB:=True}"

# Server configuration defaults
: "${HTTP_PORT:=8069}"
: "${PROXY_MODE:=True}"
: "${LOG_LEVEL:=info}"
: "${LOG_FILE:=False}"

# Performance tuning defaults
: "${MAX_CRON_THREADS:=0}"
: "${WORKERS:=0}"
: "${LIMIT_MEMORY_HARD:=2684354560}"
: "${LIMIT_MEMORY_SOFT:=2147483648}"
: "${LIMIT_REQUEST:=8192}"
: "${LIMIT_TIME_CPU:=60}"
: "${LIMIT_TIME_REAL:=120}"
: "${LIMIT_TIME_REAL_CRON:=120}"

# Email defaults (optional)
: "${SMTP_SERVER:=False}"
: "${SMTP_PORT:=25}"
: "${SMTP_USER:=False}"
: "${SMTP_PASSWORD:=False}"
: "${SMTP_SSL:=False}"
: "${EMAIL_FROM:=False}"

# Generate Odoo configuration file from template
envsubst < /etc/odoo/odoo.conf.template > /etc/odoo/odoo.conf

# Execute Odoo with the config file
exec python3 /usr/bin/odoo --config=/etc/odoo/odoo.conf -i base,web
