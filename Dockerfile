FROM ghcr.io/oxsecurity/megalinter-cupcake:v10@sha256:266c8d80f74b3308d71078f9f1e5426c6f012eb71c126eadd69960d5ccb770ed

LABEL org.opencontainers.image.source="https://github.com/step-security/megalinter-flavors-cupcake" \
      org.opencontainers.image.vendor="StepSecurity" \
      org.opencontainers.image.description="MegaLinter cupcake flavor — StepSecurity maintained"

RUN apk add --no-cache jq

COPY stepsecurity-entrypoint.sh /stepsecurity-entrypoint.sh
RUN chmod +x /stepsecurity-entrypoint.sh

ENTRYPOINT ["/stepsecurity-entrypoint.sh"]
