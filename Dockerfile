FROM registry.access.redhat.com/ubi8/ubi-minimal
LABEL maintainer "Marek Cermak <macermak@redhat.com>"

RUN VERSION=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt) ;\
    curl \
    -L https://storage.googleapis.com/kubernetes-release/release/${VERSION}/bin/linux/amd64/kubectl \
    -o /usr/bin/kubectl && chmod +x /usr/bin/kubectl
RUN curl \
    -L https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 \
    -o /usr/bin/jq && chmod +x /usr/bin/jq

USER 1001

ENTRYPOINT [ "kubectl" ]
CMD [ "--help" ]