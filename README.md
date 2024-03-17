# WOI By Indivata

### Run Flutter app between Flavor for development and production with command prompt

### FLUTTER VERSION 3.16.0

``` consoloe
flutter pub run build_runner build --delete-conflicting-outputs 
```

Development
```console  
flutter run --release -t lib/presentation/app_flavor/main_dev.dart --flavor dev  
```
SIT
```console  
flutter run --release -t lib/presentation/app_flavor/main_sit.dart --flavor sit  
```  
UAT
```console  
flutter run --release -t lib/presentation/app_flavor/main_uat.dart --flavor uat  
```  
Production
```console  
flutter run --release -t lib/presentation/app_flavor/main_prod.dart --flavor prod  
```  

### Build Release APK  between Flavor for development and production with command prompt


Development
```console  
flutter build web --release -t lib/presentation/app_flavor/main_dev.dart
```  
SIT
```console  
flutter build web --release -t lib/presentation/app_flavor/main_sit.dart 
```  
UAT
```console  
flutter build web --release -t lib/presentation/app_flavor/main_uat.dart
```  

### Build Release IPA  between Flavor for development and production with command prompt


Development
```console  
flutter build ipa --release -t lib/presentation/app_flavor/main_dev.dart --flavor dev
```  
SIT
```console  
flutter build ipa --release -t lib/presentation/app_flavor/main_sit.dart --flavor sit  
```  
UAT
```console  
flutter build ipa --release -t lib/presentation/app_flavor/main_uat.dart --flavor uat  
```  
Production
```console  
flutter build ipa --release -t lib/presentation/app_flavor/main_prod.dart --flavor prod  
``` 

```console  
flutter build appbundle -t lib/presentation/app_flavor/main_prod.dart --flavor prod
```



 
