# Flutter Commands

### Generate Dart Files for Freezed and Riverpod

`dart run build_runner watch --delete-conflicting-outputs`
`dart run build_runner build --delete-conflicting-outputs`

### Dart format

`dart format -l 200 lib ` // format all files in lib folder with line length 200

### Generate Localization files

`flutter gen-l10n`

### Generate Splash Screen

`flutter clean && flutter pub get && flutter pub run flutter_native_splash:create`

### Create App Icons

`flutter clean && flutter pub get && flutter pub run flutter_launcher_icons:main`

### web html renderer

`flutter run -d chrome --web-renderer html`

### Change AppName

`flutter pub global run rename --appname "The Daily Star - Bangladesh"`

### Change BundleId

`flutter pub global run rename --bundleId com.mcc.thedailystar`

### Create Key-store

`keytool -genkey -v -keystore c:\Users\Rifat\upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload`

Update keystore path before run

# Common Git Commands

#### Ignore File Endings

`git config --global core.autocrlf false`

#### Ignore File Permissions

`git config core.fileMode false`

#### Ignore File Endings and File Permissions

`git config --global core.autocrlf false && git config core.fileMode false`

#### Reset Git Cache

`git rm -r --cached . && git add .`