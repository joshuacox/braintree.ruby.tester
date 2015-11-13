#!/bin/bash

  # Check for a passed in DOCKER_UID environment variable. If it's there
  # then ensure that the yeoman user is set to this UID. That way we can
  # easily edit files from the host.
  if [ -n "$DOCKER_UID" ]; then
    printf "Updating UID...\n"
    # First see if it's already set.
    current_uid=$(getent passwd yeoman | cut -d: -f3)
    if [ "$current_uid" -eq "$DOCKER_UID" ]; then
      printf "UIDs already match.\n"
    else
      printf "Updating UID from %s to %s.\n" "$current_uid" "$DOCKER_UID"
      usermod -u "$DOCKER_UID" yeoman
    fi
  fi


echo -n "whoami? "
whoami
chown -R yeoman. /home/yeoman
chown -R yeoman. /srv/www
time sync

sudo -u yeoman /bin/bash -c "/srv/www/run.sh"
