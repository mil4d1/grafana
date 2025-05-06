#!/bin/bash

# تغییر مسیر به /opt
cd /opt || exit

# دانلود node_exporter
wget https://github.com/prometheus/node_exporter/releases/download/v1.8.0/node_exporter-1.8.0.linux-amd64.tar.gz

# اکسترکت و انتقال
tar xvf node_exporter-1.8.0.linux-amd64.tar.gz
mv node_exporter-1.8.0.linux-amd64 /opt/node_exporter

# ساخت فایل سرویس systemd
cat <<EOF > /etc/systemd/system/node_exporter.service
[Unit]
Description=Node Exporter
After=network.target

[Service]
User=nobody
ExecStart=/opt/node_exporter/node_exporter

[Install]
WantedBy=default.target
EOF

# فعال‌سازی و راه‌اندازی
systemctl daemon-reload
systemctl enable node_exporter
systemctl start node_exporter

# نمایش وضعیت
systemctl status node_exporter --no-pager
