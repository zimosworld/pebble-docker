FROM golang:1.10-stretch

# Download copy of forked version of pebble
RUN go get -u github.com/zimosworld/pebble/...

# Install
RUN cd $GOPATH/src/github.com/zimosworld/pebble && go install ./...

# Set environment variables
ENV PEBBLE_VA_ALWAYS_VALID 1
ENV PEBBLE_WFE_NONCEREJECT 0
ENV PEBBLE_VA_NOSLEEP 1

ENTRYPOINT ["pebble","-config","/var/pebble/config/pebble-config.json"]