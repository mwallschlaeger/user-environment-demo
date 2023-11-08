#!/bin/bash

# removes docker image artifacts from hard drive. Does not
# remove used images
#
# authors: mwallschlaeger

docker rmi $(docker images -f "dangling=true" -q)
