FROM odoo:18

USER root

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gettext-base && \
    rm -rf /var/lib/apt/lists/*

# Set up configuration directory
RUN mkdir -p /etc/odoo/conf.d && \
    chown -R odoo:odoo /etc/odoo

# Copy configuration files with correct ownership
COPY --chown=odoo:odoo ./odoo.conf.template /etc/odoo/
COPY --chown=odoo:odoo ./addons /mnt/extra-addons/
COPY --chown=odoo:odoo ./docker-entrypoint.sh /entrypoint.sh

# Make entrypoint executable
RUN chmod +x /entrypoint.sh

# Switch back to odoo user
USER odoo

# Expose Odoo port
EXPOSE 8069

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]
