#!/bin/sh
set -e
. ./.env.production
aws s3 sync . "s3://$SITE_BUCKET" --exclude ".git/*" --exclude ".env*" --delete
aws cloudfront create-invalidation --distribution-id "$CDN_DISTRIBUTION" --paths '/*'
