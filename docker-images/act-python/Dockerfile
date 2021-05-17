FROM catthehacker/ubuntu:act-latest

ENV AGENT_TOOLSDIRECTORY=/opt/hostedtoolcache
ENV RUNNER_TOOL_CACHE=/opt/hostedtoolcache
WORKDIR /opt/hostedtoolcache

ENV MANIFEST=https://raw.githubusercontent.com/actions/python-versions/main/versions-manifest.json
ENV BASE_URL=https://github.com/actions/python-versions/releases/download

RUN PYTHON_VERSION=3.5.10 \
    URL=${BASE_URL}/3.5.10-90026/python-3.5.10-linux-20.04-x64.tar.gz \
    && echo "Install Python ${PYTHON_VERSION}" \
    && curl -L $URL > $(basename $URL) \
    && mkdir -p install \
    && tar -xf $(basename $URL) -C install \
    && chmod +x ./install/setup.sh \
    && cd ./install/ \
    && ./setup.sh \
    && cd .. && rm -rf install && unlink $(basename $URL)

RUN PYTHON_VERSION=3.6.13 \
    URL=${BASE_URL}/3.6.13-99136/python-3.6.13-linux-20.04-x64.tar.gz \
    && echo "Install Python ${PYTHON_VERSION}" \
    && curl -L $URL > $(basename $URL) \
    && mkdir -p install \
    && tar -xf $(basename $URL) -C install \
    && chmod +x ./install/setup.sh \
    && cd ./install/ \
    && ./setup.sh \
    && cd .. && rm -rf install && unlink $(basename $URL)

RUN PYTHON_VERSION=3.7.10 \
    URL=${BASE_URL}/3.7.10-99135/python-3.7.10-linux-20.04-x64.tar.gz \
    && echo "Install Python ${PYTHON_VERSION}" \
    && curl -L $URL > $(basename $URL) \
    && mkdir -p install \
    && tar -xf $(basename $URL) -C install \
    && chmod +x ./install/setup.sh \
    && cd ./install/ \
    && ./setup.sh \
    && cd .. && rm -rf install && unlink $(basename $URL)

RUN PYTHON_VERSION=3.8.10 \
    URL=${BASE_URL}/3.8.10-107001/python-3.8.10-linux-20.04-x64.tar.gz \
    && echo "Install Python ${PYTHON_VERSION}" \
    && curl -L $URL > $(basename $URL) \
    && mkdir -p install \
    && tar -xf $(basename $URL) -C install \
    && chmod +x ./install/setup.sh \
    && cd ./install/ \
    && ./setup.sh \
    && cd .. && rm -rf install && unlink $(basename $URL)


RUN PYTHON_VERSION=3.9.5 \
    URL=${BASE_URL}/3.9.5-106999/python-3.9.5-linux-20.04-x64.tar.gz \
    && echo "Install Python ${PYTHON_VERSION}" \
    && curl -L $URL > $(basename $URL) \
    && mkdir -p install \
    && tar -xf $(basename $URL) -C install \
    && chmod +x ./install/setup.sh \
    && cd ./install/ \
    && ./setup.sh \
    && cd .. && rm -rf install && unlink $(basename $URL)

# not works with /etc/env
# ENV PATH="${AGENT_TOOLSDIRECTORY}/Python/3.5.10/x64/bin:${PATH}"
# ENV PATH="${AGENT_TOOLSDIRECTORY}/Python/3.6.13/x64/bin:${PATH}"
# ENV PATH="${AGENT_TOOLSDIRECTORY}/Python/3.7.10/x64/bin:${PATH}"
# ENV PATH="${AGENT_TOOLSDIRECTORY}/Python/3.8.10/x64/bin:${PATH}"
# ENV PATH="${AGENT_TOOLSDIRECTORY}/Python/3.9.5/x64/bin:${PATH}"

RUN echo PATH="${AGENT_TOOLSDIRECTORY}/Python/3.5.10/x64/bin:${AGENT_TOOLSDIRECTORY}/Python/3.6.13/x64/bin:${AGENT_TOOLSDIRECTORY}/Python/3.7.10/x64/bin:${AGENT_TOOLSDIRECTORY}/Python/3.8.10/x64/bin:${AGENT_TOOLSDIRECTORY}/Python/3.9.5/x64/bin:${PATH}" >> /etc/environment \
    && cat /etc/environment

RUN echo $PATH
