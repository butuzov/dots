# Generated, do not edit
FROM catthehacker/ubuntu:act-latest
ENV AGENT_TOOLSDIRECTORY=/opt/hostedtoolcache
ENV RUNNER_TOOL_CACHE=/opt/hostedtoolcache

# Go (1.17.6)
RUN GO_VERSION=1.17.6 \ 
 && URL=https://github.com/actions/go-versions/releases/download/1.17.6-1668090892/go-1.17.6-linux-x64.tar.gz \ 
 && echo "Install Go ${GO_VERSION}" \
 && curl -L $URL > $(basename $URL) \
 && mkdir -p install \
 && tar -xf $(basename $URL) -C install \
 && chmod +x ./install/setup.sh \
 && cd ./install/ \
 && ./setup.sh \
 && cd .. && rm -rf install && unlink $(basename $URL)

# Go (1.16.13)
RUN GO_VERSION=1.16.13 \ 
 && URL=https://github.com/actions/go-versions/releases/download/1.16.13-1668091716/go-1.16.13-linux-x64.tar.gz \ 
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
