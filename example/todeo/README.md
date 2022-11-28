# todeo

Todeo example project.

## Init commands

    fvm use 3.3.3

    fvm flutter pub get

    fvm flutter pub run build_runner build --delete-conflicting-outputs

    fvm flutter pub run easy_localization:generate --source-dir ./assets/translations -f keys -o local_keys.g.dart

    fvm flutter pub run flutter_flavorizr -p assets:download,assets:extract,android:androidManifest,android:buildGradle,android:dummyAssets,android:icons,ios:xcconfig,ios:buildTargets,ios:schema,ios:dummyAssets,ios:icons,ios:plist,ios:launchScreen,google:firebase,huawei:agconnect,assets:clean,ide:config

## Formatting code

    fvm flutter format . -l 120

## Run application with uat env

    fvm flutter run -t lib/main_uat.dart --flavor=uat

    fvm flutter run -t lib/main_uat.dart --flavor=prod

## Change app icon

1) Replace images in assets/icons/launcher_icon.png
2) Run
<!-- -->
    fvm flutter pub run flutter_flavorizr -p android:icons ios:icons

## Build application dev

    fvm flutter build apk --release -t lib/main_dev.dart --bundle-sksl-path flutter_01.sksl.json

## Prepare application to prod version

1) Generate release key for Android and put it in `android/keys` folder
2) Create file key.properties with fields

       storePassword=
       keyPassword=
       keyAlias=release
       storeFile=../keys/release.keystore

3) **Don't** commit your `key.properties` file into repository
4) Build your first prod build

## Build application prod

    fvm flutter build apk --release -t lib/main_prod.dart --bundle-sksl-path flutter_01.sksl.json

## Usage env

uat - developer url for API

prod - production url for API

test - use mock implemetation of repositories to simulate BE work
