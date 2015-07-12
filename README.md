# MkDocs docker image

Docker image to use mkdocs. This image uses Fedora:latest.

It includes a patch that fix livereload websocket connection and some option to change user and group id if yours are not 1000:1000.

# Create a project

Go to a directory where you want to generate documentation and type:

```
docker run -it --rm -v $PWD:/mkdocs metal3d/mkdocs new .
```

That will generate `docs` directory and `mkdocs.yml` file.

# Launch server

"Serve" is the default command

```
docker run -it --rm -v $PWD:/mkdocs -p 8000:8000 metal3d/mkdocs
```

Then open http://127.0.0.1:8000 

The `entrypoint` will change IP address to use "0.0.0.0" inside container. Patched livereload will be available, so when you change a documentation file, your browser will refresh the page.


# Change user and group id

If your user and/or group id are not "1000", you can pass environment variable to change them:

```
docker run -it --rm -e UID=$(id -u) -e GID=$(id -g) -v $PWD:/mkdocs metal3d/mkdocs new .
``` 

That way, both `docs` directory and `mkdocs.yml` file have the good uid/gid attributes.
