# Multiplayer Tic-Tac-Toe Game

Welcome to the Multiplayer Tic-Tac-Toe Game project! This game allows two players to compete in real-time using Flutter on the client-side and Node.js with Socket.IO on the server-side. Riverpod is used for state management in the Flutter app.

## Table of Contents

- [Features](#features)
- [Screenshots](#screenshots)
- [Architecture](#architecture)
- [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Running the App](#running-the-app)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)

## Features

- Real-time multiplayer Tic-Tac-Toe
- Smooth and interactive UI
- State management using Riverpod
- Server-side socket management with Node.js and Socket.IO
- Persistent game state

## Screenshots

![Screenshot 1](screenshots/screen1.png)
![Screenshot 2](screenshots/screen2.png)

## Architecture

The project follows a clean architecture with the following main components:

- **Flutter App**: The client-side application developed using Flutter.
- **Node.js Server**: The server-side application handling socket connections and game logic.
- **Riverpod**: State management solution used in the Flutter app.

## Setup

### Prerequisites

Ensure you have the following installed on your local machine:

- Flutter SDK: [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)
- Node.js and npm: [Node.js Installation Guide](https://nodejs.org/en/download/)

### Installation

1. **Clone the repository**:

    ```bash
    git clone https://github.com/yourusername/multiplayer-tic-tac-toe.git
    cd multiplayer-tic-tac-toe
    ```

2. **Install Flutter dependencies**:

    ```bash
    cd client
    flutter pub get
    ```

3. **Install Node.js dependencies**:

    ```bash
    cd server
    npm install
    ```

### Running the App

1. **Start the Node.js server**:

    ```bash
    cd server
    node index.js
    ```

2. **Run the Flutter app**:

    ```bash
    cd client
    flutter run
    ```

## Usage

1. **Create a Room**: One player creates a room by entering a nickname and starting a new game.
2. **Join a Room**: The second player joins the room using the room ID provided by the first player.
3. **Play the Game**: Players take turns marking X and O on the board. The first player to align three marks horizontally, vertically, or diagonally wins.


## Contributing

We welcome contributions to this project! Here’s how you can help:

1. **Fork the repository**
2. **Create a new branch** (`git checkout -b feature/YourFeature`)
3. **Commit your changes** (`git commit -m 'Add some feature'`)
4. **Push to the branch** (`git push origin feature/YourFeature`)
5. **Create a pull request**

Please make sure to update tests as appropriate.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Thank you for checking out our project! We hope you enjoy playing the multiplayer Tic-Tac-Toe game. If you have any questions or feedback, please feel free to reach out.



