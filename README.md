# TodoApp

**TodoApp** is a simple and intuitive to-do list application built with Flutter. It allows users to create, update, and delete tasks, with persistent storage using shared preferences. Whether you're managing daily tasks or organizing your workflow, TodoApp has you covered.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgements](#acknowledgements)

## Features

TodoApp comes with the following features to help you stay organized:

- **Add New Tasks**: Easily create new tasks with a title and optional description.
- **Mark Tasks as Completed**: Keep track of your progress by marking tasks as completed.
- **Delete Tasks**: Remove tasks you no longer need.
- **Persistent Storage**: Tasks are saved locally using shared preferences, ensuring your data persists even after closing the app.

## Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart) (included with Flutter)

### Installation

1. **Clone the repository**:
    ```sh
    git clone https://github.com/salah-191135/my_ToDo_app.git
    cd todoapp
    ```

2. **Install dependencies**:
    ```sh
    flutter pub get
    ```

3. **Run the app**:
    ```sh
    flutter run
    ```

## Project Structure

The project is organized as follows:

- **`main.dart`**: The entry point of the application.
- **`home_page.dart`**: The home page of the application, where tasks are displayed and managed.
- **`storage_service.dart`**: Handles data storage and retrieval using shared preferences.
- **`add_task_dialog.dart`**: A custom dialog box for adding new tasks.
- **`task_item.dart`**: A custom widget for displaying individual tasks.

## Contributing

We welcome contributions from the community! If you'd like to contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bugfix.
3. Make your changes and commit them.
4. Push your changes to your fork.
5. Submit a pull request with a detailed description of your changes.

Please ensure your code follows our coding standards and includes appropriate tests.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Acknowledgements

TodoApp was made possible thanks to the following resources and libraries:

- [Flutter](https://flutter.dev/): The framework used to build this app.
- [Shared Preferences](https://pub.dev/packages/shared_preferences): For persistent local storage.
- [Flutter Slidable](https://pub.dev/packages/flutter_slidable): For swipeable task items.
