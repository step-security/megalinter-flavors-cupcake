FROM ghcr.io/oxsecurity/megalinter-cupcake:v10

LABEL org.opencontainers.image.source="https://github.com/step-security/megalinter-flavors-cupcake" \
      org.opencontainers.image.vendor="StepSecurity" \
      org.opencontainers.image.description="MegaLinter cupcake flavor — StepSecurity maintained"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
