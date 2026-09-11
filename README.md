# Kwentuhan Flutter

This directory is the Flutter conversion of the finished Kwentuhan elementary storytelling app. The original web app remains unchanged beside it; this project keeps the same stories, supplied artwork, navigation, narration behavior, favorites, music controls, reader flow, final card, and quizzes while organizing the code into models, data, services, screens, widgets, and theme files.

## Run

Install Flutter 3.22 or newer, then run:

```bash
flutter pub get
flutter run
```

The Android and iOS runner folders are now included. If you ever need to refresh
their generated wrapper metadata with a newer Flutter SDK, run:

```bash
flutter create --platforms=android,ios .
```

This does not replace the `lib/` conversion or the bundled assets.

The project targets Android, iOS, and Flutter web. The first run may ask the operating system for speech/audio permissions. Narration uses the device's Filipino (`fil-PH`) voice when one is available and falls back to the platform speech voice otherwise.

## Build

```bash
flutter analyze
flutter build apk --release
flutter build ios --release
flutter build web --release
```

The Android wrapper is pinned to Gradle 8.14.0, which is the minimum required
by the current Flutter Android toolchain. The Android project also explicitly
opts out of the new AGP DSL and built-in Kotlin migration until its legacy
Kotlin plugin is migrated. Codemagic reapplies these settings after refreshing
the platform folders, so a generated wrapper cannot silently restore Gradle
8.4 or the incompatible defaults.

The repository also includes `codemagic.yaml`. In Codemagic, add the repository,
select the `android-apk` workflow, and start a build. The generated APK appears
in the build artifacts. For Play Store distribution, upload an Android keystore
in Codemagic and enable the `android_signing` entry in that workflow.

The bundled assets are copied from the finished web app so the Flutter build is self-contained.
