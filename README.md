
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
cp .env.exmaple .env

# Install SSL Certificates / edit domain value if you edit the .env variable TLD
cd certs && mkcert "*.dev.loc" dev.loc localhost 127.0.0.1 ::1
```

## Usage

```bash
# Start boxy
docker compose up

# Stop boxy
docker compose down
```

## Configuration

Use the `.env` for configuration

| Key            | Default | Description                                                                                                                                                                                                                     |
|----------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| TLD            | dev.loc | Use a subdomain wildcard definition like `dev.loc`. Don't use TLD definition like `.loc` because SSL certificate generation is not possible. If you edit the value ensure that you regenerate the SSL Certificate with `mkcert` |
| PHP_VERSION    | 8.4     | Version 8.1 up to 8.4 is supported                                                                                                                                                                                              |
| APACHE_VERSION | 2.4     | Only Version 2.4 is supported                                                                                                                                                                                                   |
| MARIADB_VERSION | 11.8    | Only Version 11.8 is supported                                                                                                                                                                                                  |
| PHPMYADMIN_VERSION | 5.2     | Only Version 5.2 is supported                                                                                                                                                                                                   |

## License

This project is licensed under the MIT License.
