#!/bin/bash

# This script switches nginx over to a temporary site which serves the
# letsencrypt resources, runs the letsencrypt renew script, and switches
# nginx back. It can be run manually, or as a regular cron job.

set -e

swap() {
  mv /etc/nginx/sites-enabled/default /tmp/nginx-backup
  mv /etc/nginx/sites-available/default-letsencrypt /etc/nginx/sites-enabled/default
  mv /tmp/nginx-backup /etc/nginx/sites-available/default-letsencrypt
  nginx -s stop
  nginx
}

swap

/opt/letsencrypt/letsencrypt-auto renew --agree-tos

swap
