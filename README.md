# pari_technical_test | Flutter | Ahmad Tuflihun

## Stack:

- Flutter, for UI
- Bloc, for state management
- http, for API calls
- Go Router, for navigation
- hive, for local storage
- freezed, for immutability and equality
- json_annotation, for JSON serialization
- get_it, for dependency injection
- build_runner, for code generation

## How to run app:

1. Clone the repository
2. Open the terminal and navigate to the project directory
3. Run build_runner to generate the necessary files (if changes are made to the models):
    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ``` 
4. Run the following command to get the dependencies:
    ```bash
    flutter pub get
    ```
5. Run the following command to run the app:
    ```bash
    flutter run
    ```

## Running Build Runner

```bash
dart run build_runner build
```

## APK Build

```bash
flutter build apk --target-platform android-arm,android-arm64,android-x64
```

## APK RELEASE Build

```bash
flutter build apk --release --target-platform android-arm,android-arm64,android-x64
```