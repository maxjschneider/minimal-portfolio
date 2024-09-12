# Minimal Portfolio

This is my personal portfolio website. It is intended to be minimalistic and no-frills, while (hopefully) not looking too bad. It is build with [Tailwind CSS](https://github.com/tailwindlabs/tailwindcss) and [Daisy UI](https://github.com/saadeghi/daisyui). It is hosted using Docker and Apache.

### [Live Preview](https://maxschneider.dev)

## Setup

Prerequisites:

- Node.js
- Docker

Apache Configuration: 

The Dockerfile is currently setup to expect an httpd.conf and http-ssl.conf, as well as SSL certificate and key. It is indended for end-to-end HTTPS using Cloudflare Origin Certificates. The Dockerfile could be modified to use HTTP instead. See the documentation for [httpd](https://hub.docker.com/_/httpd).

How to run:

```
npm run build-docker
npm run start-docker
```
