# Docker Projects

This Docker project allows you to set up a development environment for PHP projects with Nginx, PHP, MySQL, and phpMyAdmin using Docker containers. The project is configured via Docker Compose and can be easily customized using environment variables and configuration files.

## Getting Started

### Prerequisites

Make sure you have Docker and Docker Compose installed on your system.

### Setup

1. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/GevOkeefe/docker-projects.git
    ```

2. Navigate to the project directory:

    ```bash
    cd docker-projects
    ```

3. Modify the `.env.template` and make `.env` file and set the necessary environment variables, such as 
   ```
   NGINX_HOST=
   MYSQL_HOST=
   MYSQL_VERSION=
   MYSQL_DATABASE=
   MYSQL_ROOT_PASSWORD=
   MYSQL_USER=
   MYSQL_PASSWORD=
   ```

4. You can add multiple database servers and add environment variables for them as it was in `.env.template`. Example:
   ```
   MYSQL_HOST_1=
   MYSQL_VERSION_1=
   MYSQL_DATABASE_1=
   MYSQL_ROOT_PASSWORD_1=
   MYSQL_USER_1=
   MYSQL_PASSWORD_1=
   ```

5. Place your project files inside the `src/` directory.

6. If you haven't already, create your SSH key pair (id_rsa and known_hosts) and place them in the `ssh/` directory. This is necessary for Git operations from within the container.

### Usage

1. Configure NGINX conf as in `etc/nginx/conf.d/default.conf.template`. Filename should be like `yoursitename.conf`. Modify paths like `/var/www/html/example/` to valid ones and `server_name` to desired host.
   Also modify `etc/nginx/domains.yaml.template` and make `domains.yaml` file where you specify hosts for Traefik. Example:
   ```
   - "traefik.http.routers.nginx.rule=Host(`host_one.app.localhost`) || Host(`host_two.app.localhost`)"
   ```

2. Create project files like `etc/projects/php80.yaml.template` and `etc/projects/php80.yaml.template` and set paths to your projects depending on their PHP version.

3. Configure database images in `docker-compose.databases.yml`. Modify hosts in `docker-compose.yml` under `myadmin:environment` to your hosts. Example: 
    ```
   - PMA_HOSTS=${MYSQL_HOST}, ${MYSQL_HOST_1}
   ```
   Add dependencies of your volumes from `docker-compose.databases.yml`  to `docker-compose.yml`

4. Run:
   ```bash
   docker compose up -d
   ``` 

5. Once the containers are up and running, you can access your PHP project at `http://{host}.app.localhost`.

6. PHPMyAdmin is accessible at `http://myadmin.localhost`.

7. Traefik is accessible at `http://traefik.localhost`.

8. Mailpit is accessible at `http://mail.localhost`.

## Docker Compose Configuration

The `docker-compose.yml` file defines the services and configurations for the Docker containers:

- **traefik**: Acts as a reverse proxy and load balancer, providing access to the Docker services.
- **nginx**: Nginx server serving PHP files.
- **php**: PHP service with the specified PHP version.
- **myadmin**: PHPMyAdmin for database management.
- **mailer**: Mailpit client for mail management.

The `docker-compose.databases.yml` file defines the services and configurations for the Docker containers:

- **mysqldb**: MySQL database.

## Contributing

Feel free to contribute to this project by opening issues or pull requests.