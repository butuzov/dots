# Generated, do not edit
FROM catthehacker/ubuntu:act-latest
ENV AGENT_TOOLSDIRECTORY=/opt/hostedtoolcache
ENV RUNNER_TOOL_CACHE=/opt/hostedtoolcache

# Python (3.9.7)
RUN PYTHON_VERSION=3.9.7 \ 
 && URL=https://github.com/actions/python-versions/releases/download/3.9.7-116077/python-3.9.7-linux-20.04-x64.tar.gz \ 
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
 && URL=https://github.com/actions/python-versions/releases/download/3.8.12-116385/python-3.8.12-linux-20.04-x64.tar.gz \ 
 && echo "Install Python ${PYTHON_VERSION}" \
 && curl -L $URL > $(basename $URL) \
 && mkdir -p install \
 && tar -xf $(basename $URL) -C install \
 && chmod +x ./install/setup.sh \
 && cd ./install/ \
 && ./setup.sh \
 && cd .. && rm -rf install && unlink $(basename $URL)

# Python (3.7.12)
RUN PYTHON_VERSION=3.7.12 \ 
 && URL=https://github.com/actions/python-versions/releases/download/3.7.12-116024/python-3.7.12-linux-20.04-x64.tar.gz \ 
 && echo "Install Python ${PYTHON_VERSION}" \
 && curl -L $URL > $(basename $URL) \
 && mkdir -p install \
 && tar -xf $(basename $URL) -C install \
 && chmod +x ./install/setup.sh \
 && cd ./install/ \
 && ./setup.sh \
 && cd .. && rm -rf install && unlink $(basename $URL)

# Python (3.6.15)
RUN PYTHON_VERSION=3.6.15 \ 
 && URL=https://github.com/actions/python-versions/releases/download/3.6.15-116025/python-3.6.15-linux-20.04-x64.tar.gz \ 
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
