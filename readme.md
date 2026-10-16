# COCOIR — Eco-Friendly Coconut Coir E-Commerce Platform

> **"From Husk to Craft."**
> COCOIR transforms discarded Philippine coconut husks into premium, 100% biodegradable products for construction, gardening, agriculture, and everyday living.

Built with **CodeIgniter 4 (PHP 8.3)**, **Tailwind CSS**, **MySQL / SQLite**, and **Docker**, COCOIR is a full-stack sustainable e-commerce platform featuring a customer storefront, shopping cart, checkout with COD & InstaPay payment verification, order & refund management, and a complete Admin CMS & Analytics portal.

---

## Key Features

### Customer Storefront
- **Landing & Brand Story**: Showcases COCOIR's eco-mission, impact stats, timeline, and Filipino farmer partnerships.
- **Product Catalog (`/products`)**: Browse 12+ coconut coir products across 5 specialized categories:
  - **Home & Living**: Coir Door Mat, Coir Hanging Basket, Coir Doormat Runner
  - **Gardening**: Coco Grow Bag, Coir Mulch Mat, Seedling Tray Liner
  - **Construction**: Geotextile Mat, Erosion Control Net, Coir Log
  - **Craft & Utility**: Twisted Coir Rope
  - **Agriculture**: Coco Peat Block, Coir Fibre Bale
- **Shopping Cart (`/cart`)**: Persistent cart supporting both guest sessions and authenticated users with live quantity updates and stock checks.
- **Checkout (`/checkout`)**: Pre-fills saved user delivery addresses, supports **Delivery** or **Store Pickup**, and accepts **Cash on Delivery (COD)** or **InstaPay** (with payment screenshot upload).
- **Order Tracking & Refunds (`/orders`)**: Track orders across statuses (`to_pay`, `to_ship`, `to_receive`, `completed`, `cancelled`, `refund`), cancel pending orders, confirm receipt, or submit refund requests with proof and QR upload.
- **Customer Profile (`/profile`)**: Manage personal details, default shipping address, profile avatar, and account password.

### Admin Portal (`/admin/dashboard`)
- **Executive Dashboard**: Real-time KPIs for today's sales, monthly revenue, order status breakdown, recent orders, and low-stock alerts.
- **Inventory Management (`/admin/products`)**: Full CRUD for products with image uploads, category assignment, stock control, and active/inactive toggling.
- **Order & Payment Verification (`/admin/orders`)**: Filter orders by status, inspect customer InstaPay payment proofs, approve/reject payments, and update fulfillment statuses.
- **Sales & Inventory Reports (`/admin/reports`)**: Daily revenue breakdown (InstaPay vs. COD), average order value, top-selling products, and inventory health metrics.
- **Storefront CMS (`/admin/storefront`)**: Dynamically customize store name, tagline, hero copy, contact details, shipping fees, and social links.
- **Accounts Management (`/admin/accounts`)**: Create, edit, activate/deactivate, or remove client and admin user accounts.

---

## Tech Stack

| Layer | Technology |
| :--- | :--- |
| **Backend Framework** | CodeIgniter 4 (`v4.6.3`), PHP 8.3 |
| **Frontend Styling** | Tailwind CSS, Barlow & Lato Typography, Font Awesome 6 |
| **Database** | MySQL 8.0 (with automatic SQLite3 cloud fallback) |
| **Containerization** | Docker, Docker Compose, Nginx |
| **Cloud Deployment** | Railway (`Dockerfile` + automatic migrations & idempotent seeding) |

---

## Demo Accounts

When seeded (`php spark db:seed DatabaseSeeder`), the following accounts are available:

| Role | Username / Email | Password |
| :--- | :--- | :--- |
| **Admin** | `4adminash` / `admin@silveratelier.com` | `ATsilver` |
| **Client** | `testuser` / `maria@example.com` | `User123!` |

---

## Local Development (Docker Compose)

1. **Start the containers**:
   ```bash
   docker compose up -d --build
   ```
2. **Run migrations & seeders**:
   ```bash
   docker compose exec php php spark migrate --all
   docker compose exec php php spark db:seed DatabaseSeeder
   ```
3. **Access the services**:
   - **Storefront**: [http://localhost:8090](http://localhost:8090)
   - **Admin Dashboard**: [http://localhost:8090/admin/dashboard](http://localhost:8090/admin/dashboard)
   - **phpMyAdmin**: [http://localhost:8092](http://localhost:8092)

---

## Deploying to Railway

This repository is pre-configured for one-click deployment on **Railway** (works from either the repository root `/` or with Root Directory set to `backend`):

1. Push the repository to GitHub (`https://github.com/ashklve/CI4-Silver-Atelier-.git`).
2. In [Railway](https://railway.app), click **New Project → Deploy from GitHub repo** and select `CI4-Silver-Atelier-`.
3. **(Optional) Database**:
   - **Zero-config mode**: If you deploy just the web service, COCOIR automatically initializes a local SQLite3 database (`writable/cocoir.db`), runs all migrations, and seeds all 12 products and demo users on startup.
   - **MySQL service mode**: If you add a **MySQL** service in Railway and reference `MYSQL_URL` (or `MYSQLHOST`, `MYSQLPORT`, `MYSQLDATABASE`, `MYSQLUSER`, `MYSQLPASSWORD`) on the web service, COCOIR automatically connects to MySQL and runs migrations + seeders on boot.
4. Go to **Settings → Networking → Generate Domain** to get your public `.up.railway.app` URL.

---

## Meet the Team

- **Daniel Ling** — Co-Founder & COO / Lead Full-Stack Developer
- **Hilary Pagadora** — Co-Founder & CEO
- **Amilia Tañajura** — Head of Product & Design
