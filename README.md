# Kwentuhan Flutter

This directory is the Flutter conversion of the finished Kwentuhan elementary storytelling app. The original web app remains unchanged beside it; this project keeps the same stories, supplied artwork, navigation, narration behavior, favorites, music controls, reader flow, final card, and quizzes while organizing the code into models, data, services, screens, widgets, and theme files.

## Run

Install Flutter 3.22 or newer, then run:

```bash
flutter create .
flutter pub get
flutter run
```

`flutter create .` only adds the platform runner folders when the checkout is first opened; it does not replace the `lib/` conversion or the bundled assets.

The project targets Android, iOS, and Flutter web. The first run may ask the operating system for speech/audio permissions. Narration uses the device's Filipino (`fil-PH`) voice when one is available and falls back to the platform speech voice otherwise.

## Build

```bash
flutter analyze
flutter build apk --release
flutter build ios --release
flutter build web --release
```

The bundled assets are copied from the finished web app so the Flutter build is self-contained.
