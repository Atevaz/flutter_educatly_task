# Educatly 2024 - Flutter Real-Time Chat Application

This project is a simple real-time chat interface built using Flutter and Firebase, as part of the Educatly 2024 Senior Flutter Developer Task. The application supports user authentication, real-time messaging, online status indicators, and typing indicators, all implemented with Firebase integration.

## Features

- **User Authentication**: Users can sign up, log in, and log out securely using Firebase Authentication.
- **Real-Time Messaging**: Sends and receives messages instantly through Firebase Firestore with chat history displayed.
- **Online Status**: Displays whether a user is online or offline in real time.
- **Typing Indicators**: Shows when a user is typing a message in real time.
- **Chat Interface**: User-friendly interface with chat bubbles, avatars, timestamps, and text input fields.
- **State Management**: Bloc is used to manage application state.

### Optional:
- **Push Notifications**: Firebase Cloud Messaging is intended to be used to notify users of new messages, but this feature has not been fully implemented yet.

## Project Structure
```
lib
├── Core
├── features
└── main.dart
```

### `core/`: Core functionalities such as Firebase initialization, network requests, app-wide configurations, etc.
- `firebase/`: Firebase setup and configuration.
- `widgets/`: Commonly used Flutter widgets across the app.

### `features/`: Main features of the app.
- `auth/`: User authentication flow (sign up, login, logout).
- `chats/`: Real-time messaging and chat-related logic.
- `home/`: Main screen of the app where chats are displayed.

## Setup Instructions

### Prerequisites

- Flutter 2.x or higher

### 1. Clone the repository
Clone the repository to your local machine:

```bash
git clone https://github.com/Atevaz/flutter_educatly_task.git
cd educatly-flutter
```

## 2. Install dependencies
Run the following command to get all the dependencies:

```bash
flutter pub get
```
## 3. Run the application
Run the app on an Android emulator, Simulator or device:

```bash
flutter run
```

## 4. Firebase Push Notifications (Not Completed)
Firebase Cloud Messaging (FCM) is planned to be used for push notifications to alert users of new messages. However, this feature has not yet been fully implemented. The integration for push notifications still needs to be completed.

## License
This project is open-source and available under the MIT License.


### Key Points:
- **Push Notifications**: It is now clearly stated that push notifications were intended but not completed due to time constraints.
- **Completion**: I've added a note that the project wasn't fully completed to the highest standards due to time limitations.

Let me know if you'd like to adjust anything else!


