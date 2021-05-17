#!/usr/bin/env bash



split() {
   # Usage: split "string" "delimiter"
   IFS=$'\n' read -d "" -ra arr <<< "${1//$2/$'\n'}"
   printf '%s\n' "${arr[@]}"
}


top() {
  declare -i limit
  limit=5
  if [[ ! -z $1 ]]; then
    limit=$1
  fi


  touch .seen
  for v in $(cat versions.json | jq '.[].version' --raw-output | sort -t "." -k1,1n -k2,2nr -k3,3nr); do

    minor=$(split $v "." | sed -n '2p')

    if [[ $(grep $minor .seen) ]]; then
      continue
    fi

    if [[ $((--limit)) -lt 0 ]]; then
      continue
    fi

    echo $minor >> .seen
    echo $v
  done

  unlink .seen
}


echo "# Generated, do not edit"                                                 > Dockerfile
echo "FROM catthehacker/ubuntu:act-latest"                                      >> Dockerfile
echo "ENV AGENT_TOOLSDIRECTORY=/opt/hostedtoolcache"                            >> Dockerfile
echo "ENV RUNNER_TOOL_CACHE=/opt/hostedtoolcache"                               >> Dockerfile

curl -l https://raw.githubusercontent.com/actions/go-versions/main/versions-manifest.json -o versions.json

for version in $(top 4); do
  URL=$(cat versions.json | jq --raw-output '.[].files[].download_url' | grep linux | grep $version)

  echo ""                                                                       >> Dockerfile
  echo "# Go ($version)"                                                        >> Dockerfile
  echo "RUN GO_VERSION=$version \ "                                             >> Dockerfile
  echo " && URL=$URL \ "                                                        >> Dockerfile
  echo ' && echo "Install Go ${GO_VERSION}" \'                                  >> Dockerfile
  echo ' && curl -L $URL > $(basename $URL) \'                                  >> Dockerfile
  echo ' && mkdir -p install \'                                                 >> Dockerfile
  echo ' && tar -xf $(basename $URL) -C install \'                              >> Dockerfile
  echo ' && chmod +x ./install/setup.sh \'                                      >> Dockerfile
  echo ' && cd ./install/ \'                                                    >> Dockerfile
  echo ' && ./setup.sh \'                                                       >> Dockerfile
  echo ' && cd .. && rm -rf install && unlink $(basename $URL)'                 >> Dockerfile

done


