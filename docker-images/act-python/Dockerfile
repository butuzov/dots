# Generated, do not edit
FROM catthehacker/ubuntu:act-latest
ENV AGENT_TOOLSDIRECTORY=/opt/hostedtoolcache
ENV RUNNER_TOOL_CACHE=/opt/hostedtoolcache

# Python (3.9.5)
RUN PYTHON_VERSION=3.9.5 \ 
 && URL=https://github.com/actions/python-versions/releases/download/3.9.5-109482/python-3.9.5-linux-20.04-x64.tar.gz \ 
 && echo "Install Python ${PYTHON_VERSION}" \
 && curl -L $URL > $(basename $URL) \
 && mkdir -p install \
 && tar -xf $(basename $URL) -C install \
 && chmod +x ./install/setup.sh \
 && cd ./install/ \
 && ./setup.sh \
 && cd .. && rm -rf install && unlink $(basename $URL)

# Python (3.8.10)
RUN PYTHON_VERSION=3.8.10 \ 
 && URL=https://github.com/actions/python-versions/releases/download/3.8.10-109483/python-3.8.10-linux-20.04-x64.tar.gz \ 
 && echo "Install Python ${PYTHON_VERSION}" \
 && curl -L $URL > $(basename $URL) \
 && mkdir -p install \
 && tar -xf $(basename $URL) -C install \
 && chmod +x ./install/setup.sh \
 && cd ./install/ \
 && ./setup.sh \
 && cd .. && rm -rf install && unlink $(basename $URL)

# Python (3.7.10)
RUN PYTHON_VERSION=3.7.10 \ 
 && URL=https://github.com/actions/python-versions/releases/download/3.7.10-99135/python-3.7.10-linux-20.04-x64.tar.gz \ 
 && echo "Install Python ${PYTHON_VERSION}" \
 && curl -L $URL > $(basename $URL) \
 && mkdir -p install \
 && tar -xf $(basename $URL) -C install \
 && chmod +x ./install/setup.sh \
 && cd ./install/ \
 && ./setup.sh \
 && cd .. && rm -rf install && unlink $(basename $URL)

# Python (3.6.13)
RUN PYTHON_VERSION=3.6.13 \ 
 && URL=https://github.com/actions/python-versions/releases/download/3.6.13-99136/python-3.6.13-linux-20.04-x64.tar.gz \ 
 && echo "Install Python ${PYTHON_VERSION}" \
 && curl -L $URL > $(basename $URL) \
 && mkdir -p install \
 && tar -xf $(basename $URL) -C install \
 && chmod +x ./install/setup.sh \
 && cd ./install/ \
 && ./setup.sh \
 && cd .. && rm -rf install && unlink $(basename $URL)

# Python (3.5.10)
RUN PYTHON_VERSION=3.5.10 \ 
 && URL=https://github.com/actions/python-versions/releases/download/3.5.10-90026/python-3.5.10-linux-20.04-x64.tar.gz \ 
 && echo "Install Python ${PYTHON_VERSION}" \
 && curl -L $URL > $(basename $URL) \
 && mkdir -p install \
 && tar -xf $(basename $URL) -C install \
 && chmod +x ./install/setup.sh \
 && cd ./install/ \
 && ./setup.sh \
 && cd .. && rm -rf install && unlink $(basename $URL)
