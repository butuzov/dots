# Generated, do not edit
FROM catthehacker/ubuntu:act-latest
ENV AGENT_TOOLSDIRECTORY=/opt/hostedtoolcache
ENV RUNNER_TOOL_CACHE=/opt/hostedtoolcache

# Go (1.16.5)
RUN GO_VERSION=1.16.5 \ 
 && URL=https://github.com/actions/go-versions/releases/download/1.16.5-905270799/go-1.16.5-linux-x64.tar.gz \ 
 && echo "Install Go ${GO_VERSION}" \
 && curl -L $URL > $(basename $URL) \
 && mkdir -p install \
 && tar -xf $(basename $URL) -C install \
 && chmod +x ./install/setup.sh \
 && cd ./install/ \
 && ./setup.sh \
 && cd .. && rm -rf install && unlink $(basename $URL)

# Go (1.15.13)
RUN GO_VERSION=1.15.13 \ 
 && URL=https://github.com/actions/go-versions/releases/download/1.15.13-905271220/go-1.15.13-linux-x64.tar.gz \ 
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

# Go (1.11.13)
RUN GO_VERSION=1.11.13 \ 
 && URL=https://github.com/actions/go-versions/releases/download/1.11.13-20200616.3/go-1.11.13-linux-x64.tar.gz \ 
 && echo "Install Go ${GO_VERSION}" \
 && curl -L $URL > $(basename $URL) \
 && mkdir -p install \
 && tar -xf $(basename $URL) -C install \
 && chmod +x ./install/setup.sh \
 && cd ./install/ \
 && ./setup.sh \
 && cd .. && rm -rf install && unlink $(basename $URL)

# Go (1.10.8)
RUN GO_VERSION=1.10.8 \ 
 && URL=https://github.com/actions/go-versions/releases/download/1.10.8-20200616.2/go-1.10.8-linux-x64.tar.gz \ 
 && echo "Install Go ${GO_VERSION}" \
 && curl -L $URL > $(basename $URL) \
 && mkdir -p install \
 && tar -xf $(basename $URL) -C install \
 && chmod +x ./install/setup.sh \
 && cd ./install/ \
 && ./setup.sh \
 && cd .. && rm -rf install && unlink $(basename $URL)

# Go (1.9.7)
RUN GO_VERSION=1.9.7 \ 
 && URL=https://github.com/actions/go-versions/releases/download/1.9.7-20200616.1/go-1.9.7-linux-x64.tar.gz \ 
 && echo "Install Go ${GO_VERSION}" \
 && curl -L $URL > $(basename $URL) \
 && mkdir -p install \
 && tar -xf $(basename $URL) -C install \
 && chmod +x ./install/setup.sh \
 && cd ./install/ \
 && ./setup.sh \
 && cd .. && rm -rf install && unlink $(basename $URL)
