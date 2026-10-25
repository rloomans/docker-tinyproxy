# rloomans/tinyproxy

Forked from [kalaksi/docker-tinyproxy](https://github.com/kalaksi/docker-tinyproxy)

## Repositories

Source:

- [GitHub](https://github.com/kalaksi/docker-tinyproxy)

Images:
- [Docker Hub](https://hub.docker.com/r/rloomans/tinyproxy/) (image: `docker.io/rloomans/tinyproxy`)
- [GitHub](https://github.com/rloomans/docker-tinyproxy/pkgs/container/tinyproxy) (image: `ghcr.io/rloomans/tinyproxy`)

## Why use this container?

**Simply put, this container has been written with simplicity and security in mind.**

Many community containers run unnecessarily with root privileges by default and don't provide help for dropping unneeded CAPabilities either.
On top of that, overly complex shell scripts, monolithic designs and unofficial base images make it harder to verify the source among other issues.  

To remedy the situation, these images have been written with security, simplicity and overall quality in mind.

|Requirement               |Status|Details|
|--------------------------|:----:|-------|
|Don't run as root         |✅    | Never run as root unless necessary.|
|Transparent build process |✅    | For verifying that the container matches the code. See GitLab CI. |
|Official base image       |✅    | |
|Drop extra CAPabilities   |✅    | See ```docker-compose.yml``` |
|No default passwords      |✅    | No static default passwords. That would make the container insecure by default. |
|Support secrets-files     |✅    | Support providing e.g. passwords via files instead of environment variables. |
|Handle signals properly   |✅    | |
|Simple Dockerfile         |✅    | No overextending the container's responsibilities. And keep everything in the Dockerfile if reasonable. |
|Versioned tags            |✅    | Offer versioned tags for stability.|

## Supported tags

See the ```Tags``` tab on Docker Hub for specifics. Basically you have:

- The default ```latest``` tag that always has the latest changes.

## Configuration

See ```Dockerfile``` and ```docker-compose.yml``` (<https://github.com/rloomans/docker-tinyproxy>) for usable environment variables. Variables that are left empty will use default values.  
If you need more customization, mount your own tinyproxy.conf to ```/etc/tinyproxy/tinyproxy.conf```,
otherwise, the default tinyproxy configuration file will be used and customized according to the environment variables.
  
## Development

### Contributing

See the repository on <https://github.com/rloomans/docker-tinyproxy>.

## License

Copyright (c) 2018 kalaksi@users.noreply.github.com and Copyright (c) 2026 rloomans@users.noreply.github.com. See [LICENSE](https://github.com/rloomans/docker-tinyproxy/blob/main/LICENSE) for license information.  

As with all Docker images, the built image likely also contains other software which may be under other licenses (such as software from the base distribution, along with any direct or indirect dependencies of the primary software being contained).  
  
As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.
