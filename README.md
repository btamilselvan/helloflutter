# wip

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Installation

> Android studio
> flutter sdk
> flutter beta channel for web

### Commands

> one time code generation => flutter pub run build_runner build
> Generating code continuously => flutter pub run build_runner watch

### Notes

 > Check recipe.dart and recipes.dart for json decode example
 > create launch icons:
    install: flutter_launcher_icons, update pubspec.yaml
     run: flutter pub pub run flutter_launcher_icons:main

> change app name
    install: flutter_launcher_name, update pubspec.yaml
    then run: flutter pub run flutter_launcher_name:main

### Prepare for Android:
> https://flutter.dev/docs/deployment/android
1. Check the launcher icons and app name using the above steps
2. Setup keys for app signing
    keytool -genkey -v -keystore c:\Users\USER_NAME\key.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias key
3. Updates the keys in key.properties (new file)
4. configure gradle for app signing
5. Update app label and give internet permissions to the app in AndroidManifest.xml
6. Review build config in gradle.. like sdk version, appId, etc
7. Build APK bundle -> flutter build appbundle
    This should create the bundle here <app dir>/build/app/outputs/bundle/release/app.aab.
8. Offline test:
    1. download bundletool jar from github then -> alias bundletool='java -jar bundletool-all.jar or java -jars bundletool-all.jar
    2.  bundletool build-apks --bundle=/t/Git_Repository/tamil/flutter/helloflutter/build/app/outputs/bundle/release/app-release.aab --output /t/Git_Repository/tamil/flutter/helloflutter/build/app/outputs/bundle/apks/wip.apks --ks=/c/Users/Tamil/.ssh/apk_key.jks --ks-pass=pass:password --ks-key-alias=apkkey
    3. Install apk to the connected device:  bundletool install-apks --apks=/t/Git_Repository/tamil/flutter/helloflutter/build/app/outputs/bundle/apks/wip.apks
9. Playstore test
    > setup google play account
    > create a internal release, and upload appbundle, setup testers group, invite testers
    > after internal testing, perform open testing with larger audience



