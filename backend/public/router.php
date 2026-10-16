<?php

// Router script for PHP built-in web server (Railway / cloud deployment)
$uri = urldecode(parse_url($_SERVER['REQUEST_URI'] ?? '/', PHP_URL_PATH) ?: '/');
$filePath = __DIR__ . $uri;

// Serve existing static assets (images, js, css, favicon, etc.) directly
if ($uri !== '/' && is_file($filePath)) {
    return false;
}

// Forward all other routes to CodeIgniter 4 front controller
$_SERVER['SCRIPT_NAME'] = '/index.php';
require_once __DIR__ . '/index.php';
