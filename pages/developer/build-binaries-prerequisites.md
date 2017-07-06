---
layout: page
title: Prerequisites for building binaries
permalink: /developer/build-binaries-prerequisites/

date: 2017-07-06 20:55:00 +0300

---

The main trick that makes the multi-platform build possible is [Docker](https://www.docker.com).

Containers based on two Debian 9 Docker images are used (separate 32/64-bits containers). The more conservative Debian was preferred to generate the GNU/Linux versions, to avoid problems when attempting to run the executables on older versions.

The Windows binaries are also generated on GNU/Linux, using [mingw-w64](http://mingw-w64.org).

### macOS

#### Install the Command Line Tools

The macOS compiler and other development tools are packed in a separate Xcode add-on. The best place to get it is from the [Developer](https://developer.apple.com/xcode/downloads/) site, although this might require enrolling to the developer program (free of charge).

To test if the compiler is available, use:

```bash
$ gcc --version
Configured with: --prefix=/Applications/Xcode.app/Contents/Developer/usr --with-gxx-include-dir=/usr/include/c++/4.2.1
Apple LLVM version 8.1.0 (clang-802.0.42)
Target: x86_64-apple-darwin16.6.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
```

#### Install a custom instance of Homebrew

The build process is quite complex, and requires tools not available in the standard Apple macOS distribution. These tools can be installed with Homebrew. To keep these tools separate, a custom instance of Homebrew is installed in `${HOME}/opt/homebrew-gme`. 

In a separate run, the **[MacTex](http://www.tug.org/mactex/)** tools are also installed in `${HOME}/opt/texlive`. Alternatively you can install MacTex in `/usr/local` using the official distribution, but this will add lots of programs to the system path, and this is a bad thing.

The entire process can be automated with two scripts, available from GitHub:

```bash
$ mkdir -p ${HOME}/opt
$ git clone https://github.com/ilg-ul/opt-install-scripts \
    ${HOME}/opt/install-scripts.git
$ bash ${HOME}/opt/install-scripts.git/install-homebrew-gme.sh
$ bash ${HOME}/opt/install-scripts.git/install-texlive.sh
```

The scripts run with user credentials, no `sudo` access is required.

#### Install Docker

On macOS, Docker can be installed by following the official [Install Docker on macOS](https://docs.docker.com/docker-for-mac/install/) instructions.

Due to the specifics of macOS, Docker cannot run native; instead, it uses a GNU/Linux virtual machine running in Apple HyperKit (Apple's virtualisation framework).

For better results, dedicate 2 cores and at least 2 GB of RAM to the Docker.

Warning: The current Docker version (17.x) has a memory leak in `com.docker.osxfs`, which makes its use questionable for long builds. As a workaround, install an Ubuntu 16.04 LTS virtual machine and use the GNU/Linux Docker.


### GNU/Linux

Any GNU/Linux distribution may be ok, but we only tested the procedure on Ubuntu 16.04 LTS, running as a virtual machine in Paralells Desktop on macOS 10.12.

#### Install Docker

For any GNU/Linux distribution, follow the [specific instructions](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#install-using-the-repository).

The steps are basically:

```bash
$ sudo apt-get update

$ sudo apt-get install apt-transport-https ca-certificates  curl software-properties-common

$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

$ sudo add-apt-repository  "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable"

$ sudo apt-get update
$ sudo apt-get -y install docker-ce
```

To check if the install is functional, run the _Hello World_ image, for the moment as `sudo`:

```bash
$ sudo docker run hello-world
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
b04784fba78d: Pull complete 
Digest: sha256:f3b3b28a45160805bb16542c9531888519430e9e6d6ffc09d72261b0d26ff74f
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
...
```

#### Configure Docker to run as a regular user

To allow Docker to run as a regular user, you need to be a member of the `docker` group.

```bash
$ sudo groupadd docker
$ sudo gpasswd -a ${USER} docker
$ sudo service docker restart
```

The above spets are for Ubuntu and the Debian family. For other distributions, the last line may differ, for example for Arch Linux use:

```bash
$ systemctl restart docker
```

To make these changes effective, logout and login.

To check if the configuration change is functional, run the same _Hello World_ image without sudo:

```bash
$ docker run hello-world

Hello from Docker!
...
```

#### Install required packages

Since most of the build is performed inside the Docker containers, there are not many requirements for the host, and most of the time these programs are in the standard distribution (`curl`, `git`, `automake`, `patch`, `tar`, `unzip`).

The script checks for them; if the script fails, install them and re-run.

### Docker images

The Docker images are available from [Docker Hub](https://hub.docker.com/u/ilegeul/). They were build using the Dockerfiles available from [ilg-ul/docker on GitHub](https://github.com/ilg-ul/docker).

If not already loaded, Docker will load the images at first usage. The images are relatively large, around 3 GB.

It is possible to separately load the Docker images, using the script `preload-images` command of each script.

If the download speed is limited, probably it is faster to rebuild the images locally. For this see the `build-images` command of each script.

More details in each script documentation page.
