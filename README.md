# News Feed App with Firebase Integration

A Flutter-based **News Feed App** that displays articles fetched from Firebase Firestore. The app is designed for performance and user convenience, offering offline support and seamless scrolling even with large datasets.

---

## Features

- **Firebase Firestore Integration:** Articles are fetched in real-time from a Firestore collection named `articles`.
- **State Management:** Utilizes **Riverpod** for efficient and scalable state management.
- **Image and Data Caching:** Implements robust caching to enhance performance and offline usability.
- **Offline Support:** Previously fetched articles and images are accessible even without an internet connection.
- **Responsive Design:** Ensures smooth operation across various screen sizes and orientations.
- **Detail Page Navigation:** View full details of an article by tapping on it.

---

## Project Setup

### Dependencies
This project uses the following dependencies:

- `firebase_core` - For Firebase initialization.
- `cloud_firestore` - To interact with Firebase Firestore.
- `flutter_riverpod` - State management library.
- `cached_network_image` - For efficient image caching and lazy loading.

Add the dependencies to `pubspec.yaml`:
```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^3.8.0
  cloud_firestore: ^5.5.0
  flutter_riverpod: ^2.6.1
  cached_network_image: ^3.4.1
```

### Firebase Setup
1. Create a Firebase project in the Firebase Console.
2. Add the **Firestore Database** and a collection named `articles` with the following fields:
    - `title` (String)
    - `description` (String)
    - `imageUrl` (String)
    - `timestamp` (Timestamp)
3. Download and include `google-services.json` (Android) or `GoogleService-Info.plist` (iOS) in the appropriate directories.

### Running the App
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/news_feed_app.git
   cd news_feed_app
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

---

## Caching Mechanism

### 1. Data Caching
- Articles fetched from Firestore are stored in memory using Riverpod providers.
- On app startup, cached data is displayed first, ensuring quick load times while new data is fetched in the background.

### 2. Image Caching
- The `cached_network_image` package handles image caching and lazy loading.
- Placeholder images are displayed while the actual images are being fetched.
- Cached images are reused across sessions, minimizing bandwidth usage.

---

## Riverpod for State Management

Riverpod ensures efficient state management with minimal rebuilds and clean separation of concerns:

- **FutureProvider:** Fetches articles from Firestore and exposes them to the UI.
- **ConsumerWidget:** Updates only the affected widgets when the state changes.
- **Error Handling:** Provides a robust mechanism for handling errors and network issues.

Example:
```dart
final articleProvider = FutureProvider<List<Article>>((ref) async {
  final firebaseService = FirebaseService();
  return firebaseService.fetchArticles();
});
```

---

## Features in Detail

### Home Screen
- Displays a list of articles with title, description, and image.
- Smooth scrolling with cached data and images.

### Article Detail Page
- Shows the full content of an article, including a larger image and detailed description.

---

## Future Enhancements
- Add user authentication for personalized news feeds.
- Enable push notifications for new articles.
- Introduce search and filtering capabilities.

---

## License
This project is licensed under the MIT License. See the `LICENSE` file for details.
