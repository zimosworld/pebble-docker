Dockerfile and example for [zimosworld/pebble](https://github.com/zimosworld/pebble) a fork of [letsencrypt/pebble](https://github.com/letsencrypt/pebble) 

The goal of this fork is to provide a internal certificate authority (that skips verification) for a team of developers, where you have one self signed root certificate that all your team's computers trust.

## !!! WARNING !!!

This fork of Pebble is **NOT INTENDED FOR PRODUCTION USE** and assumes you have at a minimum a basic understanding of how SSL works. 

# Setup

To get setup you will need to complete the below setup before firing up a new container using one of the examples further down this readme.

1. Grab a copy data structure
2. Generate a Root Certificates
3. Generate a SSL Certificate for the server
4. Update the pebble-config.json
5. Run docker using one of the below examples

# Example usage 

### Docker

Using the ``docker`` command run:

```
docker run -d -p 14000:14000 -p 5001:5001 -p 5002:5002 -v ./data:/var/pebble --name pebble_app zimosworld/pebble:latest
```

### Docker Compose

Create a ``docker-compose.yml`` file and add in:

```
version: '2'
services:
  pebble_app:
    image: zimosworld/pebble:latest
    container_name: pebble_app
    volumes:
      - ./data:/var/pebble
    ports:
      - 14000:14000
      - 5002:5002
      - 5001:5001
    network_mode: "bridge"
```