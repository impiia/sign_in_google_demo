**Google Sign-In Flutter Demo**

This is a simple Flutter application that demonstrates Google Sign-In functionality using the `google_sign_in` package. The app allows users to sign in with their Google account, displaying a welcome message with their name and email upon successful sign-in. It also provides a "Sign out" button to log out of the Google account.

### Features

- Google Sign-In for both Android and iOS platforms.
- Display user information (name and email) upon successful sign-in.
- Sign-out functionality with a corresponding message.

### Prerequisites

Before running the application, make sure to:

1. Add your Google Sign-In API credentials:
   - For Android: Update the `clientId` in the `initGoogleSignIn` method with your Android client ID.
   - For iOS: Update the `clientId` in the `initGoogleSignIn` method with your iOS client ID.

2. Ensure you have the necessary dependencies by running:

   ```bash
   flutter pub get
   ```

### How to Run

To run the application, use the following command:

```bash
flutter run
```




Feel free to customize and enhance the application based on your needs!
