# Generated, do not edit
FROM catthehacker/ubuntu:act-latest
ENV AGENT_TOOLSDIRECTORY=/opt/hostedtoolcache
ENV RUNNER_TOOL_CACHE=/opt/hostedtoolcache

# Go (1.17.0)
RUN GO_VERSION=1.17.0 \ 
 && URL=https://github.com/actions/go-versions/releases/download/1.17.0-1138146562/go-1.17.0-linux-x64.tar.gz \ 
 && echo "Install Go ${GO_VERSION}" \
 && curl -L $URL > $(basename $URL) \
 && mkdir -p install \
 && tar -xf $(basename $URL) -C install \
 && chmod +x ./install/setup.sh \
 && cd ./install/ \
 && ./setup.sh \
 && cd .. && rm -rf install && unlink $(basename $URL)

# Go (1.16.7)
RUN GO_VERSION=1.16.7 \ 
 && URL=https://github.com/actions/go-versions/releases/download/1.16.7-1104053924/go-1.16.7-linux-x64.tar.gz \ 
 && echo "Install Go ${GO_VERSION}" \
 && curl -L $URL > $(basename $URL) \
 && mkdir -p install \
 && tar -xf $(basename $URL) -C install \
 && chmod +x ./install/setup.sh \
 && cd ./install/ \
 && ./setup.sh \
 && cd .. && rm -rf install && unlink $(basename $URL)

# Go (1.15.15)
RUN GO_VERSION=1.15.15 \ 
 && URL=https://github.com/actions/go-versions/releases/download/1.15.15-1104054180/go-1.15.15-linux-x64.tar.gz \ 
 && echo "Install Go ${GO_VERSION}" \
 && curl -L $URL > $(basename $URL) \
 && mkdir -p install \
 && tar -xf $(basename $URL) -C install \
 && chmod +x ./install/setup.sh \
 && cd ./install/ \
 && ./setup.sh \
 && cd .. && rm -rf install && unlink $(basename $URL)

# Go (1.14.15)
RUN GO_VERSION=1.14.15 \ 
 && URL=https://github.com/actions/go-versions/releases/download/1.14.15-539663618/go-1.14.15-linux-x64.tar.gz \ 
 && echo "Install Go ${GO_VERSION}" \
 && curl -L $URL > $(basename $URL) \
 && mkdir -p install \
 && tar -xf $(basename $URL) -C install \
 && chmod +x ./install/setup.sh \
 && cd ./install/ \
 && ./setup.sh \
 && cd .. && rm -rf install && unlink $(basename $URL)

# Go (1.13.15)
RUN GO_VERSION=1.13.15 \ 
 && URL=https://github.com/actions/go-versions/releases/download/1.13.15-20200806.4/go-1.13.15-linux-x64.tar.gz \ 
 && echo "Install Go ${GO_VERSION}" \
 && curl -L $URL > $(basename $URL) \
 && mkdir -p install \
 && tar -xf $(basename $URL) -C install \
 && chmod +x ./install/setup.sh \
 && cd ./install/ \
 && ./setup.sh \
 && cd .. && rm -rf install && unlink $(basename $URL)

# Go (1.12.17)
RUN GO_VERSION=1.12.17 \ 
 && URL=https://github.com/actions/go-versions/releases/download/1.12.17-20200616.21/go-1.12.17-linux-x64.tar.gz \ 
 && echo "Install Go ${GO_VERSION}" \
 && curl -L $URL > $(basename $URL) \
 && mkdir -p install \
 && tar -xf $(basename $URL) -C install \
 && chmod +x ./install/setup.sh \
 && cd ./install/ \
 && ./setup.sh \
 && cd .. && rm -rf install && unlink $(basename $URL)
