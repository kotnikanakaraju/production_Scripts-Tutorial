#!/bin/bash

# Variables
APP_DIR="/var/www/myapp"      # Application directory
GIT_REPO="git@github.com:user/repo.git"  # Git repository
BRANCH="main"                # Branch to pull from
SERVICE="myapp"              # Name of the service to restart

# Pull the latest code from Git
cd $APP_DIR
git checkout $BRANCH
git pull origin $BRANCH

# Install dependencies (Node.js example)
npm install --production

# Restart the web server
systemctl restart $SERVICE

# Print success message
echo "Deployment completed successfully."
