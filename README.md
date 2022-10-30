
# Technical Test - Bhanuka Isuru

**APK File**
[Google Drive](https://drive.google.com/file/d/1oagYovOxLs1GoUJwAlq_xR6-emIn5Ihy/view?usp=sharing)


**How do I store API Keys and Base Url?**

- I chose  `--dart -define` to store API Key and Base Url. *Reason:* The main advantage of using `--dart-define` is that no need to hardcoding sensitive keys in the source code. And another benefit it the keys can be accessing on the native Android and IOS side.


**how to install and run the code?**

**Method 01:**

`flutter run --dart-define TRM_KEY=<API_KEY> --dart-define BASE_URL=<Base_Url>`

**Method 02:**

Need to edit `.vscode/launch.json` file and add some `args` to launch configuration:

```
{
"version":  "0.2.0",
"configurations":  [
  {  
  "name":  "Launch",  
  "request":  "launch",  
  "type":  "dart",  
  "program":  "lib/main.dart",	
  "args":  [
      "--dart-define",  "TRM_KEY=<API_KEY>",  
      "--dart-define",  "BASE_URL=<Base_Url>",
    ]  
   } 
  ]
}
```

**Method 03:**

If you use IntelliJ or Android Studio, you can use [run/debug configurations](https://www.jetbrains.com/help/idea/run-debug-configuration.html) to achieve the same result.


**App Architecture**

Implement the well-known **clean architecture** with Domain Driven Design and Riverpod.

These are the layers in this pattern.

*1. Presentation -* It contains pages, widgets and communication between them.

*2. Application -* Handle events from Presentation layer and exposes states.

*3. Domain -* It keeps the main business logic. I contains abstractions, validators and entities.

*4. Infrastructure -* This layer is responsible for communication with different data sources.



**App Directory Structure**

Called feature-bases. Each feature has its own directory strucutre.

*Advantages:* easy to search for related files.

*Disadvantages:* it is necessary to worry about the organization of relationships so that there are no duplicates of entities or implementation.


In this app, I used the following dependencies,

 ```
  cached_network_image: ^3.2.2  
  connectivity_plus: ^3.0.2  
  dio: ^4.0.6 
  freezed_annotation: ^2.2.0  
  hooks_riverpod: ^2.0.2   
  infinite_scroll_pagination: ^3.2.0  
  rxdart: ^0.27.5  
  objectbox: ^1.6.2  
  objectbox_flutter_libs: ^1.6.2  
  
dev_dependencies:  
  flutter_test:  
    sdk: flutter  
  flutter_lints: ^2.0.1  
  build_runner: ^2.3.2  
  freezed: ^2.2.0  
  json_serializable: ^6.5.4  
  mockito: ^5.3.2  
  objectbox_generator: ^1.6.2
  ```

**Note about Obfuscation**

I obfuscated entire code when build a release version.  [Obfuscating Dart code](https://docs.flutter.dev/deployment/obfuscate)
