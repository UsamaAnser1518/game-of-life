# Conway's Game of Life API

This project implements an API for Conway's Game of Life, allowing users to create, update, and view the state of the game board through HTTP requests.

## Overview

Conway's Game of Life is a cellular automaton devised by the British mathematician John Horton Conway in 1970. The game is a zero-player game, meaning that its evolution is determined by its initial state, requiring no further input. One interacts with the Game of Life by creating an initial configuration and observing how it evolves.

This API provides endpoints to upload a new board state, get the next or future state of the board, and determine the final state of a board if it stabilizes or reaches a conclusion within a specified number of generations.

## Features

- **Create Board:** Allows uploading a new board state, returning an ID for the board.
- **Get Next State:** Retrieves the next state of the board based on its current state.
- **Get Future State:** Calculates the board state a specified number of generations ahead.
- **Get Final State:** Attempts to determine the final state of the board. If the board does not stabilize after a specified number of attempts, the game ends.

## Technical Details

### Technologies Used

- **Ruby on Rails:** The API is built with Ruby on Rails, utilizing MVC architecture for organizing code. This is an API-Only applicartion not containing any views.
- **PostgreSQL:** Used as the database to persist board states and other relevant data.
- **RSpec:** For testing the functionality of the board calculations and API responses.

### Models

#### Board

- Represents a game board with a state.
- State is stored as a serialized array, representing the grid of cells.

### Controllers

#### BoardsController

- **POST /boards:** Create a new board with a given state.
- **GET /boards/:id:** Fetch the current state of the board.
- **PUT /boards/:id:** Update the board to its next state.

## Setup

### Prerequisites

- Ruby 3.1.2
- Rails 7.0.8
- PostgreSQL

### Installation

1. Clone the repository to your local machine.
2. Run `bundle install` to install the required gems.
3. Setup your database with `rails db:create` and `rails db:migrate`.
4. Start the server with `rails server`.

## Usage

### Creating a New Board

```bash
curl -X POST http://localhost:3000/boards -d '{"board": {"state": [[0,1,0],[1,0,1],[0,1,0]]}}' -H "Content-Type: application/json"
```

### Getting the Next State

```bash
curl -X PUT http://localhost:3000/boards/:id
```

### Fetching the Current State

```bash
curl http://localhost:3000/boards/:id
```

