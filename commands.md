flutter pub run build_runner watch --delete-conflicting-outputs
flutter pub run build_runner build --delete-conflicting-outputs

### Generate Localization files

`flutter gen-l10n`

### Generate Splash Screen

`flutter clean && flutter pub get && flutter pub run flutter_native_splash:create`

### web html renderer

`flutter run -d chrome --web-renderer html`

### Common Git Commands

#### Ignore File Endings

`git config --global core.autocrlf false`

#### Ignore File Permissions

`git config core.fileMode false`

#### Ignore File Endings and File Permissions

`git config --global core.autocrlf false && git config core.fileMode false`

#### Reset Git Cache

`git rm -r --cached . && git add .`
