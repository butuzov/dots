FROM catthehacker/ubuntu:act-latest

ENV AGENT_TOOLSDIRECTORY=/opt/hostedtoolcache
ENV RUNNER_TOOL_CACHE=/opt/hostedtoolcache
WORKDIR /opt/hostedtoolcache

ENV MANIFEST=https://raw.githubusercontent.com/actions/go-versions/main/versions-manifest.json
ENV BASE_URL=https://github.com/actions/go-versions/releases/download

RUN GO_VERSION=1.16.4 \
    URL=${BASE_URL}/1.16.4-820698457/go-1.16.4-linux-x64.tar.gz \
    && echo "Install Go ${GO_VERSION}" \
    && curl -L $URL > $(basename $URL) \
    && mkdir -p install \
    && tar -xf $(basename $URL) -C install \
    && chmod +x ./install/setup.sh \
    && cd ./install/ \
    && ./setup.sh \
    && cd .. && rm -rf install && unlink $(basename $URL)


RUN echo PATH="${AGENT_TOOLSDIRECTORY}/go/1.16.4/x64/bin:${PATH}" >> /etc/environment \
    && cat /etc/environment
