
# Boxy

Simple Docker-Based LAMP-Stack for local development

## Table of Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Configuration](#configuration)
- [License](#license)

## Requirements

Install mkcert if you haven’t done so already. Follow the instructions in the [GitHub Repository](https://github.com/FiloSottile/mkcert).

## Installation

Step-by-step instructions on how to get the development environment running.

```bash
# Clone the repository
git clone git@github.com:jaybee111/boxy.git

# Copy .env.example
cp .env.example .env

# Install SSL Certificates / edit the domain value if you edited the TLD variable in .env.
cd certs && mkcert "*.dev.loc" dev.loc localhost 127.0.0.1 ::1
```

## Usage

All projects are stored in ``data/www``. A project path ``data/www/test/htdocs`` is mapped to the following domain ``test.dev.loc``. Ensure that you set ``test.dev.loc`` in ``hosts`` file: ``127.0.0.1 test.dev.loc``.
Use symlinks like ``ln -s xyz/public htdocs`` if you can't use the default ``htdocs`` folder.

### Commands

```bash
# Start boxy
docker compose up -d

# Stop boxy
docker compose down

# SSH Login
docker compose exec php bash
```

### PHPMyAdmin

PHPMyAdmin is available by http://localhost:8080

## Configuration

Use the `.env` for configuration

| Key            | Default | Description                                                                                                                                                                                                                     |
|----------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| TLD            | dev.loc | Use a subdomain wildcard definition like `dev.loc`. Don't use TLD definition like `.loc` because SSL certificate generation is not possible. If you edit the value ensure that you regenerate the SSL Certificate with `mkcert` |
| PHP_VERSION    | 8.4     | Version 8.1 up to 8.4 is supported                                                                                                                                                                                              |
| APACHE_VERSION | 2.4     | Only Version 2.4 is supported                                                                                                                                                                                                   |
| MARIADB_VERSION | 11.8    | Only Version 11.8 is supported                                                                                                                                                                                                  |
| PHPMYADMIN_VERSION | 5.2     | Only Version 5.2 is supported                                                                                                                                                                                                   |

### PHP

Create a ``/containers/php/php.custom.ini`` file for custom configuration. Additionally create an ``docker-compose.override.yaml`` and add following lines:

```bash
services:
  php:
    volumes:
      - ./containers/php/php.custom.ini:/usr/local/etc/php/php.ini
```

## License

This project is licensed under the MIT License.
