#!/bin/bash

# Variables
APP_DIR="/var/www/myapp"      # Directory where the application is deployed
BRANCH="main"                # Branch to deploy

# Navigate to application directory and pull latest changes
cd $APP_DIR
git checkout $BRANCH
git pull origin $BRANCH

# Restart the web service
systemctl restart myapp

# Notify the team
echo "Deployment of $BRANCH completed" | mail -s "Deployment Notification" team@company.com
