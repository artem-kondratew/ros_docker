# ROS Docker Project

ROS (Robot Operating System) project with Docker Compose.

## Requirements

- Docker
- Docker Compose
- X11 (for GUI applications)

## Quick Start

### 1. Environment Variables Setup (optional)

Default values are:
- `CONTAINER_NAME=humble_docker`
- `DISTRO_IMAGE=osrf/ros:humble-desktop-full`
- `ROS_DISTRO=humble`

To change parameters, you can:

**Option A:** Create a `.env` file from template:
```bash
cp env.template .env
# Edit .env as needed
```

**Option B:** Set variables in your shell:
```bash
export CONTAINER_NAME=my_ros_container
export DISTRO_IMAGE=osrf/ros:humble-desktop-full
export ROS_DISTRO=humble
```

Parameters:
- `CONTAINER_NAME` - container name
- `DISTRO_IMAGE` - ROS distribution image
- `ROS_DISTRO` - ROS version (humble, iron, etc.)

### 2. X11 Setup (for GUI)

Allow Docker access to X11:

```bash
xhost +local:docker
```

### 3. Build and Run

```bash
# Navigate to docker directory
cd docker

# Build image
docker compose build

# Start container
docker compose up -d

# View logs
docker compose logs -f

# Stop container
docker compose down
```

Or use the `-f` flag from the root directory:
```bash
docker compose -f docker/docker-compose.yml build
docker compose -f docker/docker-compose.yml up -d
```

### 4. Enter Container

```bash
cd docker
docker compose exec ros_container bash
```

Or use:

```bash
docker exec -it humble_docker bash
```

(replace `humble_docker` with your `CONTAINER_NAME`)

## Docker Compose Commands

All commands should be executed from the `docker/` directory or use the `-f docker/docker-compose.yml` flag:

- `docker compose build` - build image
- `docker compose up -d` - start container in background
- `docker compose up` - start container with log output
- `docker compose down` - stop and remove container
- `docker compose ps` - show container status
- `docker compose logs` - show logs
- `docker compose exec ros_container bash` - enter container
- `docker compose restart` - restart container

## Project Structure

```
ros_docker/
├── docker/
│   ├── dockerfile          # Dockerfile for building image
│   └── docker-compose.yml  # Docker Compose configuration
├── workspace/              # ROS workspace (mounted into container)
│   └── src/
├── env.template            # Environment variables template
├── .env                    # Environment variables (create from env.template, not in git)
└── README.md              # This file
```

## Configuration Features

- **Privileged mode**: Enabled for device access
- **Host networking**: Uses host network
- **X11 forwarding**: Configured for GUI applications
- **USB devices**: Access to USB devices
- **Workspace mount**: `workspace` directory is mounted to `/workspace` inside container

## Usage Examples

### Running with Different ROS Version

Create a `.env` file (or set environment variables):

```bash
cat > .env << EOF
DISTRO_IMAGE=osrf/ros:humble-desktop-full
ROS_DISTRO=humble
CONTAINER_NAME=humble_docker
EOF
```

Then rebuild and start:

```bash
cd docker
docker compose build
docker compose up -d
```
