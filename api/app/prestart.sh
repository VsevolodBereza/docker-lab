#! /usr/bin/env sh

# Wait for database connection
while ! nc -z "$POSTGRES_HOST" "$POSTGRES_PORT"; do
  sleep 10
  printf "Database %s:%s not ready" "$POSTGRES_HOST" "$POSTGRES_PORT"
done
# Make sure database is ready to accept connections
sleep 10

alembic upgrade head

exec "$@"