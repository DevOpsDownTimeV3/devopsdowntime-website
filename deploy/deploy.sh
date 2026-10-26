#!/bin/sh
set -e
# Settings now come from the CI secret store, never from the repo.
: "${SITE_BUCKET:?}" "${CDN_DISTRIBUTION:?}"
aws s3 sync . "s3://$SITE_BUCKET" --exclude ".git/*" --exclude ".env*" --delete
aws cloudfront create-invalidation --distribution-id "$CDN_DISTRIBUTION" --paths '/*'
echo "deployed $(git rev-parse --short HEAD)"
