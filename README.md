# 📦 MiladVPN Monitoring Tools

**ابزارهای آماده برای مانیتورینگ نودهای Milad VPN با Prometheus و Grafana**

---

## 🛠 نصب خودکار Node Exporter

این اسکریپت جهت نصب سریع و ساده‌ی `node_exporter` روی سرورهای لینوکسی (Ubuntu/Debian) طراحی شده. با استفاده از این ابزار می‌توانید مصرف CPU، RAM، Disk و ترافیک شبکه سرورها را به‌صورت گرافیکی در Grafana مشاهده کنید.

---

## 🚀 روش استفاده

### 1. اجرای مستقیم از GitHub:

```bash
wget https://raw.githubusercontent.com/mil4d1/grafana/main/install_node_exporter.sh
chmod +x install_node_exporter.sh
sudo ./install_node_exporter.sh

```

> ⚠️ جایگزین کن `YOUR_USERNAME` با یوزرنیم گیت‌هابت.

---

### 2. اضافه کردن نود به Prometheus

روی سرور مرکزی (که Prometheus نصب شده)، فایل زیر را ویرایش کنید:

```bash
sudo nano /etc/prometheus/prometheus.yml
```

در بخش زیر IP نود جدید را اضافه کنید:

```yaml
scrape_configs:
  - job_name: 'node_exporters'
    static_configs:
      - targets:
          - '127.0.0.1:9100'
          - 'YOUR_NODE_IP:9100'
```

سپس سرویس Prometheus را ری‌استارت کنید:

```bash
sudo systemctl restart prometheus
```

---

## 📊 داشبورد پیشنهادی در Grafana

می‌توانید از داشبورد زیر استفاده کنید:
- داشبورد سفارشی Milad VPN با نمودارهای کیلومتری و مانیتورینگ شبکه
- فایل: `miladvpn-golden-dashboard.json`

---

## 🤝 همکاری

در صورت نیاز به تغییرات، درخواست Pull Request ارسال کنید یا با ما در تماس باشید.
