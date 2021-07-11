# Generated, do not edit
FROM catthehacker/ubuntu:act-20.04-20210608
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
