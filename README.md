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

3. Modify the `.env` file and set the necessary environment variables, such as `NGINX_HOST`, `MYSQL_HOST`, `MYSQL_VERSION`, `MYSQL_DATABASE`, `MYSQL_ROOT_PASSWORD`, `MYSQL_USER`, and `MYSQL_PASSWORD`.

4. Optionally, you can define default values for `PROJECT_DIR` and `PHP_VERSION` in the `.env` file if you want to run with docker command instead of Shell script.

5. Place your project files inside the `src/` directory.

6. If you haven't already, create your SSH key pair (id_rsa and known_hosts) and place them in the `ssh/` directory. This is necessary for Git operations from within the container.

### Usage

1. Run the project using the provided `runProject.sh` script:

    ```bash
    ./runProject.sh
    ```

2. The script will prompt you to enter the project name located in the `src/` folder and the PHP version.

3. Once the containers are up and running, you can access your PHP project at `http://app.localhost`.

4. PHPMyAdmin is accessible at `http://myadmin.localhost`.

5. Traefik is accessible at `http://traefik.localhost`.

6. Mailpit is accessible at `http://mail.localhost`.

## Docker Compose Configuration

The `docker-compose.yml` file defines the services and configurations for the Docker containers:

- **traefik**: Acts as a reverse proxy and load balancer, providing access to the Docker services.
- **nginx**: Nginx server serving PHP files.
- **php**: PHP service with the specified PHP version.
- **myadmin**: PHPMyAdmin for database management.
- **mailer**: Mailpit client for mail management.
- **mysqldb**: MySQL database.

## Contributing

Feel free to contribute to this project by opening issues or pull requests.