# FROM node:alpine

# ENV METEOR_ALLOW_SUPERUSER=true

# ENV ROOT_URL="http://localhost:3000"

# RUN npm install -g meteor

# COPY . /sam/meteorapp
# WORKDIR /sam/meteorapp

# RUN meteor npm install

# EXPOSE 3000
# CMD ["meteor"]

FROM node:14.17.1-alpine



ENV BUILD_PACKAGES="python make gcc g++ git libuv bash curl tar bzip2" \
NODE_ENV=production \
ROOT_URL=http://localhost:3000 \
PORT=3000

WORKDIR /user/meteorapp/bundle

# COPY ./bundle /user/meteorapp

ADD docker-create-new.tar.gz /user/meteorapp

RUN (cd programs/server/ && npm install --unsafe-perm)
# apk --update add ${​​BUILD_PACKAGES}​​ \
# && (cd programs/server/ && npm install --unsafe-perm) \
# && apk --update del ${​​BUILD_PACKAGES}


EXPOSE 3000

CMD [ "node", "main.js" ]

# FROM node:14.17.1-alpine
# # MAINTAINER Gary Ascuy <gary.ascuy@gmail.com>

# ENV BUILD_PACKAGES="python make gcc g++ git libuv bash curl tar bzip2" \
# NODE_ENV=production \
# ROOT_URL=http://localhost:3000 \
# PORT=3000

# WORKDIR /root/app/bundle 

# ADD app.tar.gz /root/app
# RUN apk --update add ${​​BUILD_PACKAGES}​​ \
# && (cd programs/server/ && npm install --unsafe-perm) \
# && apk --update del ${​​BUILD_PACKAGES}


# EXPOSE 3000
# CMD node main.js

