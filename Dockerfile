FROM ghcr.io/oxsecurity/megalinter-cupcake:v10

LABEL org.opencontainers.image.source="https://github.com/step-security/megalinter-flavors-cupcake" \
      org.opencontainers.image.vendor="StepSecurity" \
      org.opencontainers.image.description="MegaLinter cupcake flavor — StepSecurity maintained"

COPY stepsecurity-entrypoint.sh /stepsecurity-entrypoint.sh
RUN chmod +x /stepsecurity-entrypoint.sh

ENTRYPOINT ["/stepsecurity-entrypoint.sh"]
