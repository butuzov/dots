# Generated, do not edit
FROM catthehacker/ubuntu:act-latest
ENV AGENT_TOOLSDIRECTORY=/opt/hostedtoolcache
ENV RUNNER_TOOL_CACHE=/opt/hostedtoolcache

# Python (3.10.2)
RUN PYTHON_VERSION=3.10.2 \ 
 && URL=https://github.com/actions/python-versions/releases/download/3.10.2-121429/python-3.10.2-linux-20.04-x64.tar.gz \ 
 && echo "Install Python ${PYTHON_VERSION}" \
 && curl -L $URL > $(basename $URL) \
 && mkdir -p install \
 && tar -xf $(basename $URL) -C install \
 && chmod +x ./install/setup.sh \
 && cd ./install/ \
 && ./setup.sh \
 && cd .. && rm -rf install && unlink $(basename $URL)

# Python (3.9.10)
RUN PYTHON_VERSION=3.9.10 \ 
 && URL=https://github.com/actions/python-versions/releases/download/3.9.10-1788162477/python-3.9.10-linux-20.04-x64.tar.gz \ 
 && echo "Install Python ${PYTHON_VERSION}" \
 && curl -L $URL > $(basename $URL) \
 && mkdir -p install \
 && tar -xf $(basename $URL) -C install \
 && chmod +x ./install/setup.sh \
 && cd ./install/ \
 && ./setup.sh \
 && cd .. && rm -rf install && unlink $(basename $URL)

# Python (3.8.12)
RUN PYTHON_VERSION=3.8.12 \ 
 && URL=https://github.com/actions/python-versions/releases/download/3.8.12-117929/python-3.8.12-linux-20.04-x64.tar.gz \ 
 && echo "Install Python ${PYTHON_VERSION}" \
 && curl -L $URL > $(basename $URL) \
 && mkdir -p install \
 && tar -xf $(basename $URL) -C install \
 && chmod +x ./install/setup.sh \
 && cd ./install/ \
 && ./setup.sh \
 && cd .. && rm -rf install && unlink $(basename $URL)
