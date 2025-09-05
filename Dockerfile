# Stage 1: Build Dependencies
FROM python:3.10-slim AS builder

WORKDIR /opt/odoo

# Copy and install Python dependencies
COPY ./requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Stage 2: Final Image with Odoo
FROM odoo:18.0

USER root

# Copy only necessary files from the builder stage
COPY --from=builder /opt/odoo /opt/odoo

# Copy custom addons
COPY ./addons /mnt/extra-addons

USER odoo
