📍 Location App – Live Location on Google Maps (Flutter)

A reference Flutter application that demonstrates how to fetch a user’s live/current location and display it on Google Maps in real time.
This project can be used as a starter template for location-based apps such as tracking, navigation, or map-based utilities.

🚀 Features

📌 Fetches the user’s current GPS location

🗺️ Displays the location on Google Maps

🔄 Updates location in real time as the user moves

📍 Shows precise latitude and longitude

🔐 Handles runtime location permissions

🧩 Clean and reusable Flutter code structure

🛠️ Tech Stack

Flutter

Google Maps SDK

Location / Geolocator Plugin

Android & iOS Support

📦 Prerequisites

Before running the project, ensure you have:

Flutter SDK installed

Android Studio / Xcode set up

A valid Google Maps API Key

Location services enabled on the device/emulator

🔑 Google Maps API Setup

Create a project in Google Cloud Console

Enable:

Maps SDK for Android

Maps SDK for iOS

Generate an API key

Add the API key to:

Android
android/app/src/main/AndroidManifest.xml

iOS
ios/Runner/AppDelegate.swift

▶️ How to Run the Project
# Get dependencies
flutter pub get

# Run on connected device or emulator
flutter run

📍 Location Permissions
Android

ACCESS_FINE_LOCATION

ACCESS_COARSE_LOCATION

iOS

NSLocationWhenInUseUsageDescription

NSLocationAlwaysAndWhenInUseUsageDescription

Ensure permissions are added in the respective platform configuration files.

📂 Project Use Cases

Live location tracking apps

Navigation-based apps

Delivery & logistics systems

Attendance or field-force tracking

Map-based utilities

⚠️ Notes

This project is intended as a reference / starter app

Accuracy depends on device GPS and permissions

Google Maps API usage may incur billing based on usage

📄 License

This project is open for learning and reference purposes.
Feel free to modify and extend it as per your needs.

👨‍💻 Author

Developed as a reference Flutter project for integrating live location with Google Maps.
