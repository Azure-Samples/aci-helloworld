# Azure Container Instances Hello World

This sample is a very simple NodeJS application used to demonstrate [Azure Container Instances](https://azure.microsoft.com/services/container-instances/).

The packaged version of the application is [available on Docker Hub](https://hub.docker.com/r/microsoft/aci-helloworld/).

# Note

Most, if not all, Dockerfiles contain commands that copy your source code to the container. It is helpful to note that when copying files from your application into the container, you can use wildcard characters such as `*` and `?`. The `*` character will add all files to the destination directory that match it's pattern. The `?` character will do the same but can only be replaced by a single character.

```Dockerfile
COPY *.jpg /myDir/        # adds all jpg files to /myDir/
COPY pic-?.jpg /myDir/    # adds all files that match the pattern, e.g. pic-1.jpg, pic-2.jpg
```

When copying entire directories, avoid using the wildcard `*` after the source directory path (e.g. `./dir/*`). This will copy all files in all subdirectories, but **will not maintain the original directory structure when moved to the destination folder**. Instead you can just leave it out as `COPY ./dir/ /myDir/`. This will maintain the directory structure of your application inside the container.

# Debugging Docker Containers
Application not running? Take a look inside your container to see why. First list containers. Using the `-l` argument with `docker ps` will show all containers whether or not they are running. This is particularly useful if your application is crashing.

```bash
docker ps -l

CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS                             NAMES
d73e9071a2d0        aci-hello-world     "npm start"         10 seconds ago      Up 10 seconds       8080/tcp, 0.0.0.0:8080->80/tcp    keen_jepsen
```

If your container has a statys of `Exited(1)` you know something has gone wrong. Take a look at your application logs using the `docker logs` command to debug. If there are any application errors, they will be shown here.

```bash
docker logs d73e9071a2d0

app@0.0.0 start /usr/src/app
node index.js
```


# Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.microsoft.com.

When you submit a pull request, a CLA-bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., label, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.
