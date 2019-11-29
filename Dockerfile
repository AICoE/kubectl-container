FROM registry.access.redhat.com/ubi8/ubi-minimal

ENV SUMMARY="Minimal kubectl ubi8-minimal image." \
	DESCRIPTION="Minimal [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/) UBI-based image. This image is meant to be used in Argo Workflows to inspect resources."

LABEL summary="$SUMMARY" \
	description="$DESCRIPTION" \
	io.k8s.description="$DESCRIPTION" \
	io.k8s.display-name="Kubectl ubi8-minimal" \
	io.openshift.tags="argo,kubectl" \
	name="aicoe/kubectl:latest" \
	vendor="AICoE at the Office of the CTO, Red Hat Inc." \
	version="0.1.0" \
	release="0" \
	maintainer="Marek Cermak <macermak@redhat.com>"

# Install requirements
RUN VERSION=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt) ;\
	curl \
	-L https://storage.googleapis.com/kubernetes-release/release/${VERSION}/bin/linux/amd64/kubectl \
	-o /usr/bin/kubectl && chmod +x /usr/bin/kubectl && \
	curl \
	-L https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 \
	-o /usr/bin/jq && \
	chmod +x /usr/bin/jq
RUN microdnf install -y findutils

USER 1001

ENTRYPOINT [ "kubectl" ]
CMD [ "--help" ]
