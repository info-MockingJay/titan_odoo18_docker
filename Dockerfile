
FROM python:3.12-slim AS builder

WORKDIR /opt/odoo
COPY ./requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

FROM odoo:18.0

USER root

COPY --from=builder /opt/odoo /opt/odoo

COPY ./addons /mnt/extra-addons

USER odoo
