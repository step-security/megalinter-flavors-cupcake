FROM ghcr.io/oxsecurity/megalinter-cupcake:v10@sha256:7cce5b9d46564149d451a9752c5c266982f10c231be7df79996f46e3e171d2fc

LABEL org.opencontainers.image.source="https://github.com/step-security/megalinter-flavors-cupcake" \
      org.opencontainers.image.vendor="StepSecurity" \
      org.opencontainers.image.description="MegaLinter cupcake flavor — StepSecurity maintained"

RUN apk add --no-cache jq

COPY stepsecurity-entrypoint.sh /stepsecurity-entrypoint.sh
RUN chmod +x /stepsecurity-entrypoint.sh

ENTRYPOINT ["/stepsecurity-entrypoint.sh"]
