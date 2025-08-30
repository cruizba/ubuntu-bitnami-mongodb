FROM ubuntu:24.04

# Define environment variables
ENV YQ_VERSION=v4.47.1 \
    WAIT_FOR_PORT_VERSION=v1.0.10 \
    RENDER_TEMPLATE_VERSION=v1.0.9 \
    MONGODB_MAJOR=8.0 \
    MONGODB_VERSION=8.0.12 \
    MONGODB_SHELL_VERSION=2.5.7 \
    DEBIAN_FRONTEND=noninteractive

# Copy install script
COPY install.sh /tmp/install.sh

# Run install script
RUN chmod +x /tmp/install.sh && /tmp/install.sh

# Set up Bitnami scripts and permissions
COPY prebuildfs /
RUN chmod g+rwX /opt/bitnami && find / -perm /6000 -type f -exec chmod a-s {} \; || true
COPY rootfs /
RUN /opt/bitnami/scripts/mongodb/postunpack.sh

# Expose MongoDB port
EXPOSE 27017

# Set user and commands
USER 1001
ENTRYPOINT [ "/opt/bitnami/scripts/mongodb/entrypoint.sh" ]
CMD [ "/opt/bitnami/scripts/mongodb/run.sh" ]
