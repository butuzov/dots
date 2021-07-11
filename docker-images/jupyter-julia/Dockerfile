ARG VERSION=1.5.3
FROM docker.io/julia:${VERSION}-buster as julia

FROM butuzov/jupyter as base

USER butuzov

ENV JU_PATH /usr/local/julia
ENV PATH $JU_PATH/bin:$PATH
COPY --from=julia  /usr/local/julia          /usr/local/julia
RUN julia -e 'import Pkg; Pkg.add("IJulia");'
