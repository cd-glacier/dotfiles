#!/bin/bash

NOTIFICATIONS_URL=$(envchain GHE bash -c 'echo $GHE_NOTIFICATION_URL')

open "$NOTIFICATIONS_URL"

