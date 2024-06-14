FROM node:14.16.0

RUN apk add --no-cache \
    git \
    util-linux openssl sudo \
    python3 g++ \
    autoconf automake libtool gcc make musl-dev file pkgconfig nasm \
    vips vips-dev \
    && rm -fR /var/cache/apk/*

# Also exposing VSCode debug ports
# 8000      : For HTTP access for development
# 9000      : For HTTP access for audit
# see: https://www.gatsbyjs.com/tutorial/part-eight/
EXPOSE 8000 9000

RUN yarn global add gatsby-cli@4.25.0 && yarn cache clean

WORKDIR /public
CMD ["gatsby", "develop", "-H", "0.0.0.0" ]