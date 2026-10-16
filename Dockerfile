FROM php:8.3-cli

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libicu-dev \
    libonig-dev \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libzip-dev \
    libsqlite3-dev \
    sqlite3 \
    zip \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Configure and install PHP extensions required for CodeIgniter 4
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
        intl \
        mbstring \
        mysqli \
        pdo_mysql \
        pdo_sqlite \
        sqlite3 \
        gd \
        zip \
        opcache

# Set timezone
ENV TZ=Asia/Manila
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html

# Copy backend application into container working directory
COPY backend/ /var/www/html/

# Normalize line endings on start.sh and install Composer dependencies
RUN sed -i 's/\r$//' /var/www/html/start.sh \
    && chmod +x /var/www/html/start.sh \
    && composer install --no-dev --no-interaction --prefer-dist --optimize-autoloader \
    && mkdir -p /var/www/html/writable/cache /var/www/html/writable/logs /var/www/html/writable/session /var/www/html/writable/uploads \
    && chmod -R 777 /var/www/html/writable

EXPOSE 8080

CMD ["sh", "start.sh"]
