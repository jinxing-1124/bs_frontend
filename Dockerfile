# The purpose of this image is to serve the frontend app content separately.
# By default the Backstage backend uses the app-backend plugin to serve the
# app from the backend itself, but it may be desirable to move the frontend
# content serving to a separate deployment, in which case this image can be
# used.

# This dockerfile also performs the build first inside docker. This may come
# with a build time impact, but is sometimes desirable. If you want to run the
# build on the host instead, use the file simply named Dockerfile in this folder
# instead.

# USAGE:
#       yarn backstage-cli package build 
#
#       docker image build -t backstage_frontend .



FROM nginx:mainline

RUN apt-get update && apt-get -y install jq && rm -rf /var/lib/apt/lists/* 

COPY packages/app/dist /usr/share/nginx/html
COPY default.conf /etc/nginx/conf.d/default.conf


