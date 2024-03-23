
# Balance Backend
We're going to build a RESTful backend for an existing mobile app. The mobile app allows a
user to log in, submit game completion information, and see some basic summary statistics.
Assume that the mobile app is already built and we need to match with its expectations for the
API.

## Getting Started / Dependencies

- **Docker**: The application is containerized using Docker. Make sure you have Docker installed on your system.
  - For Windows or Mac, install [Docker Desktop](https://www.docker.com/products/docker-desktop).
  - For Linux, use your package manager to install Docker and docker-compose.


## Installation
Clone the repository:

 1. Pull down the repo: `git clone https://github.com/scottleeroberts/balance-backend`
 2. cd balance-backend
 3. Run `docker compose up` to bring up the docker container

This will start a server on port 3000 on localhost.  All requests must be done against `http://localhost:3000/`

## Testing
Run the test suite using Docker:

```bash
    docker compose run --rm web /bin/bash -c "bundle exec rails test"
```

## API Endpoints
|Verb | Route | Description |
|--|--|--|
| POST | /api/user  | Create a new user |
| POST | /api/sessions  | Login and and retrieve token |
| GET | /api/games  | List all games |
| GET | /api/game_events  | Mark game as complete for logged in user|
| GET | /api/user  | View user details and stats |
| DELETE | /api/sessions  | User logout |


## Usage Examples
With the Docker container running, you can use curl to interact with the API. Here are some examples:

### Create a user
    curl -X POST http://localhost:3000/api/user \
        -H 'Content-Type: application/json' \
        -d '{
      "user":{
        "email": "doug@aol.com",
        "password": "1231231",
        "full_name": "Doug Aol",
        "username": "dougie"
      }
    }'

### Login with username and password to get a bearer token
    curl -X POST http://localhost:3000/api/sessions \
        -H 'Content-Type: application/json' \
        -d '{
      "user":{
        "email": "doug@aol.com",
        "password": "5up3r53cr3t"
      }
    }'

### Get the list of games
    curl http://localhost:3000/api/games \
        -H 'Content-Type: application/json' \
        -H 'Authorization: <bearer token>'

### Create a game event
    curl -X POST http://localhost:3000/api/game_events \
        -H 'Content-Type: application/json' \
        -H 'Authorization: <bearer token>' \
        -d '{
      "game_event":{
        "occurred_at": "2024-03-23T14:30:00+00:00",
        "game_id": "10",
        "type": "completed"
      }
    }'

### Get the user, with stats, including streak
    curl http://localhost:3000/api/user
        -H 'Content-Type: application/json' \
        -H 'Authorization: <bearer token>'

### BONUS: Logout
    curl -X DELETE http://localhost:3000/api/sessions \
    -H 'Content-Type: application/json' \
    -H 'Authorization: <bearer token>'
