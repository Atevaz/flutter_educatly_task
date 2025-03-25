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


### `core/`: Core functionalities such as Firebase initialization, network requests, app-wide configurations, etc.
- `firebase/`: Firebase setup and configuration.
- `network/`: Network services to handle API requests.
- `widgets/`: Commonly used Flutter widgets across the app.

### `features/`: Main features of the app.
- `auth/`: User authentication flow (sign up, login, logout).
- `chats/`: Real-time messaging and chat-related logic.
- `home/`: Main screen of the app where chats are displayed.

## Setup Instructions

### Prerequisites

- Flutter 2.x or higher
- Firebase account and Firebase project set up

### 1. Clone the repository
Clone the repository to your local machine:

```bash
git clone https://github.com/yourusername/educatly-flutter.git
cd educatly-flutter
