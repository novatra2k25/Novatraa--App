                                                      Novatraa SensaTech – Mobile App
Overview

The Novatra SensaTech Mobile App is a cross-platform application built with Flutter that allows practitioners, industries, and regulators to instantly access and analyze herbal quality reports. It connects with the Novatraa E-Tongue IoT device and backend APIs to display results on purity, adulteration, dilution, and saturation.

Tech Stack
Flutter (cross-platform for iOS & Android)
Dart (programming language)
REST API (Node + Express backend)
Cloud Database (MongoDB)

Setup Instructions
Clone the repository
git clone https://github.com/your-repo/novatra-app.git
cd novatra-app


Install dependencies
flutter pub get
Run the app
flutter run
(Make sure you have Flutter SDK installed and a connected emulator/device.)

Features

User Authentication – secure login & profiles
Herbal Report Access – view purity/adulteration results in real time
Push Notifications – alerts when new results are available

Project Structure
lib/
 ├── main.dart        # App entry point
 ├── screens/         # UI screens
 ├── widgets/         # Reusable components
 ├── services/        # API calls & cloud sync
 └── models/          # Data models
 
Future Enhancements
Multi-language support (English + regional)
Role-based access (practitioner, regulator, industry)
AI-powered sample anomaly detection


History Tracking – review past test reports
Offline Sync – access last synced data without internet
