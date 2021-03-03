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
Notes:

> Use Android studio to create playstore image (512 X 512)
> Use google sites to host privacy policy page (https://sites.google.com/).
> Create feature graphic from here: https://www.norio.be/graphic-generator/


> Generate SHA1 and SHA256 fingerprints:
 keytool.exe -list -v -alias androiddebugkey -keystore /c/Users/Tamil/.ssh/apk_key_debug.jks
 
> dynamic link
> can be created programatically or thru firebase console. 
- a free subdomain from "page.link" can be used.
- configure dynamic link in firebase console (set up deep link url, ios and android package info). a valid url is needed for deep link url for web (anything is fine when accessed from mobile) (http://apps.tamils.rocks).

> Programmatic creation
- whitelist the domains, the one with "page.link" (trocks.page.link). No need to whiltelist the deeplink url (apps.tamils.rocks)
- Use ActionCodeSettings to set dynamic link properties. can use short-link for the url.
- the dynamic link url will be something like, https://trocks.page.link/?link=http://apps.tamils.rocks&apn=com.success.tradnalist&amv=1&ibi=com.success.tradnalist&isi=1234567
- the short dynamic link can be used in the code instead of full url (short link will be created when dynamic link is setup in console)
- setup dynamic link receiver in the app to handle the incoming requests to the app

### firebase

> make sure to initialize firebase app in the main.
> for web, follow the instructions provided in firebase web app configuration and include the settings in index.html
> initialize firebase app in index.html. make sure to include the firebase js in index.html
> use firebase cli for hosting
> include google client id in index.html to use google sign in
> use firebase service account to use firebase services in the backend to validate idToken, to call firestore, etc.

### flutter
> remember that print truncates the input string to 1020 characters
> to connect to localhost in the host machine from android emulator, use the ip: 10.0.2.2. This ip in emulator is mapped to localhost in the host machine
> to enable http url (instead of https), add <application android:usesCleartextTraffic="true"></application> in AndroidManifest.xml and <key>NSAllowsArbitraryLoads</key> <true/> in iOS Info.plist

