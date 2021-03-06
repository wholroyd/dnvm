FROM wholroyd/centos:latest

MAINTAINER William Holroyd <wholroyd@gmail.com>

RUN yum install -y curl ruby-devel gcc libffi-devel make rpm-build
RUN gem install fpm
RUN mkdir -p /usr/bin/dnx/dnvm && \
    mkdir -p /usr/bin/dnx/runtimes

COPY dnvm.sh /usr/bin/dnx/dnvm/
COPY dnx.sh /etc/profile.d/

RUN fpm -s dir \
    -t rpm \
    -n dnvm \
    -d "curl > 0" \
    -d "unzip > 0" \
    -v 1.0.0_beta8_15502 \
    --vendor "Microsoft Corporation" \
    --license "Apache License, Version 2.0" \
    --description "Provides tooling to manage DNX runtime verisons" \
    --url "https://github.com/aspnet/Home" \
    /usr/bin/dnx \
    /etc/profile.d/dnx.sh

RUN fpm -s dir \
    -t deb \
    -n dnvm \
    -d "curl > 0" \
    -d "unzip > 0" \
    -v 1.0.0_beta8_15502 \
    --vendor "Microsoft Corporation" \
    --license "Apache License, Version 2.0" \
    --description "Provides tooling to manage DNX runtime verisons" \
    --url "https://github.com/aspnet/Home" \
    /usr/bin/dnx \
    /etc/profile.d/dnx.sh

## Just need to use something to post a release to GitHub here, 
## otherwise the .rpm & .deb files are stuck in the docker image.

CMD ["bash"]
