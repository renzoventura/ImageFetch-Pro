# Pixabay App Readme

## Introduction

This is a Pixabay app that features a search bar capable of retrieving data from an API and displaying the results in a container. The app is designed to be a simple and efficient tool for searching and viewing the first 50 images returned.

## Features

- **Search Bar**: The app provides a search bar for users to enter their search queries. As users type into the search bar, the app waits for them to finish typing and then retrieves images based on the entered query.

- **Clear Search**: Users can easily clear their search query using the "Clear" button in the search bar.

- **Feed Container**: The retrieved images are displayed in a scrollable feed container, where users can view and interact with them.

## Extra Features
- **Debouncing**: To improve performance and avoid excessive API requests, the app uses debouncing, ensuring that API calls are made only after the user has finished typing.

- **Environment Variables**: The app supports environment variables, making it easy to manage sensitive data like API keys without hardcoding them in the source code.

  ```flutter run -t lib/main.dart --dart-define=apiKey=[YOUR KEY]```

## State management
This app uses Riverpod for state management. The state management logic is implemented using the FeedProvider class. Here's how it works:

- The feedProvider is created as a StateNotifierProvider and is responsible for managing the app's state.

- FeedProvider initializes the state with empty feeds, no loading, and no error message.

- The getImages method in FeedProvider is used to fetch images from the Pixabay API. It updates the state based on the API response and handles loading and error states.

- The FeedState class defines the structure of the app's state, including feeds, loading status, and error messages.

## Libraries Used
This app utilizes the following Flutter packages:

- flutter_riverpod: Our state management library of choice.
- getIt: For dependency injection, to access our api calls.
- dio: A Http client.
- cached_network_image: Caches network images for efficient loading.
- json_serializable: Helps with serialization.


## How to run app
- **Run this command to created the generated files for the models**

  ```dart  run build_runner build --delete-conflicting-outputs```

- **Run this command with your pixabay api key**
  ```flutter run -t lib/main.dart --dart-define=apiKey=[YOUR KEY]```

## How to run integrated tests
- **Run this command with your pixabay api key**

  ```flutter test integration_test/app_test.dart --dart-define=apiKey=[YOUR KEY]```
