<h1 align="center">
  Flutter Base Kit
</h1>

<h4 align="center">
  <a href="https://docs.flutter.dev/release/release-notes/release-notes-3.27.0"><img src="https://img.shields.io/badge/Flutter-3.27.0-gray?labelColor=black&style=flat&logo=Flutter&link=https://docs.flutter.dev/release/release-notes/release-notes-3.27.0" alt="Flutter" /></a>
	<a href="https://opensource.org/license/mit"><img src="https://img.shields.io/badge/License-MIT-gray?labelColor=black&style=flat&link=https://opensource.org/license/mit" alt="License" /></a>
  <a href="https://supabase.com/docs/reference/dart/introduction"><img src="https://img.shields.io/badge/Supabase-DB-grey?labelColor=black&style=flat&link=https://supabase.com/docs/reference/dart/introduction" alt="Supabase" /></a>
</h4>

<p align="center">
  <i align="center">Accelerate your Flutter app development using the Flutter Base Kit - featuring MVVM design architecture with dark mode, localization, typography support, and Supabase integration for authentication and database, as well as pre-built splash screen, onboarding page, and navigation bar support - streamline your development process like never before! 🔥</i>
</p>

<p align="center">
  <img src="https://github.com/Chandrageraldy/flutter_base_kit/blob/a43fb4db683bfbbb72e8774d1755fe5c465843fd/preview.png" alt="flutter-base-kit-preview-image"/>
</p>

<p align="center">
  <i align="center">This project is licensed under the MIT License - see the LICENSE -> (https://opensource.org/licenses/MIT) file for details.</i>
</p>

## 🚀 Getting Started 

**The Flutter Base Kit** is designed to help developers build maintainable Flutter apps with a focus on clean architecture and best practices. It incorporates the MVVM (Model-View-ViewModel) design pattern, ensuring your app remains modular, scalable, and easy to maintain. With built-in support for Dark Mode, Localization, and customizable Splash Screen, Onboarding Page, and Navigation Bar, this kit drastically streamlines your app development process.

- **MVVM Architecture:** Promotes a clear separation of concerns, enhancing code maintainability and testability.
- **Pre-built Components:** Includes ready-to-use and customizable Splash Screen, Onboarding Pages, and Navigation Bar.
- **Supabase Integration:** Easily integrate Supabase for authentication and database by simply pasting your project URL and anon key.

With this kit, you can rapidly develop scalable and professional Flutter applications with minimal boilerplate code. Whether you're building an MVP or a fully-fledged app, the Flutter Base Kit will ensure a smooth, efficient development journey.

## 🛠️ Project Architecture Pattern

For clear seperation of concerns and maintainability, [MVVM](https://medium.com/flutterworld/flutter-mvvm-architecture-f8bed2521958), aka Model-View-ViewModel is adapted as the base project architecture pattern.

```
├── app
│   ├── models
│   │   ├── ...
│   ├── views
│   │   ├── ...
│   ├── viewmodels
│   │   ├── ...
│   ├── repositories
│   │   ├── ...
│   ├── services
│   │   ├── ...
│   ├── assets
│   │   ├── ...
│   ├── utils
│   │   ├── ...
│   ├── widgets
│   │   ├── ...
```

### Models

- The model data class defines the format or structure for the data to be utilized.
```dart
class ErrorModel {

  TokenModel({this.errorCode, this.errorMessage});

  String? errorCode;
  String? errorMessage;
}
```
- The Response model is designed to represent complete and error states of a network request in a clean and consistent way.
- In the Response model, T represents the data returned from a network request, and V represents the error that might be encountered.

- **data (T?):** Holds the data returned from the network request. This is only populated in the COMPLETE state.
- **error (V?):** Holds the error information if the request failed. This is only populated in the ERROR state.
- **status (ResponseStatus):** The status of the request. This can be one of the following:

```dart
enum ResponseStatus { COMPLETE, ERROR }
```

### Views

- View layer are the presentation layer, where include all the Stateless and Statefull UI classes.
- `lib/app/views/base_stateful_page.dart` is provided to unified common UI behaviour and UI presentation logic across all stateful screen in the app.
- New Stateful classes should extends `BaseStatefulPage` to inherit the basic unified features included.
```dart
class LoginPage extends BaseStatefulPage {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseStatefulState<LoginPage> {
  @override
  Widget body() {
    return SizedBox();
  }
}
```

### View Models

- ViewModel class acts as a connector between View and Model, separating View and Model to segregate business logic from UI.
- `lib/app/viewmodels/base_view_model.dart` is provided to unified common view model behaviour, eg: `checkError()` method.
- New ViewModel classes should extends `BaseViewModel` to inherit the basic unified features included.
```dart
class UserViewModel extends BaseViewModel {
  Future<bool> logout() async {
    final response = await userRepository.logout();
    checkError(response);
    return response.data;
  }
}
```

### Repositories

- It is responsible for handling business logic related to data processing from one or multiple API calls, and returning it in a format suitable for use in the app.
```dart
class UserRepository {
  Future<Response> logout() async {
    final response = await userService.logout();
    sharedPreferenceHandler.logout();
    return response;
  }
}
```

### Services

- Service class manages API calls, handle HTTP requests, and process responses from external services or servers.
- `lib/app/service/supabase_base_service.dart` is provided to unified all Supabase related service, eg: `authenticate()` and `callSupabaseDB()`.
- New Service classes that requires calling Supabase service should extends `SupabaseBaseService` to inherit the basic unified features included.
```dart
class UserRepository extends SupabaseBaseService {
  Future<Response> logout() {
    return authenticate(authType: AuthType.LOGOUT);
  }
}
```

### Assets and Utils

- The assets folder contains files related to the app's static resources, such as configuration files, application settings, app styling and any other non-code resources required by the app.
- The utils folder contains utility classes or helper functions that provide common functionality used across the app. They help avoid code duplication and improve the maintainability of the project.

### Widgets

- Reusable components or building blocks of the Flutter UI, eg: Buttons, Text, and Images.


## 📦 State Management Library

This project relies on [Provider](https://pub.dev/packages/provider) which will be taking the [Flutter App State Management](https://docs.flutter.dev/data-and-backend/state-mgmt/simple) as base reference. Provider is use along with MVVM architectural pattern to provide better separation and management within the project.

### Using the Provider

1. To simplified and standardize the usage of Provider in this project, a base class, base_view_model.dart is provided which extending the ChangeNotifier and include common functions/fields required. (eg: notify() and more)
2. ChangeNotifierProviders are implemented in the top inheritance level of the project `app.dart` which using MultiProvider to support multiple providers within the project.
3. For any new ViewModel class, please register in the `lib/app/asset/app_options.dart`
```dart
List<SingleChildWidget> providerAssets() => [
  ChangeNotifierProvider.value(value: BaseViewModel()),
  ChangeNotifierProvider.value(value: LocaleViewModel())
];
```
4. To access provider values:
```dart
context.select((ViewModel vm) => vm.properties);
```
5. To access provider without listening for changes:
```dart
context.read<ViewModel>().method()
```

## ⚙️ App Configuration

### Supabase Configuration

This Base Kit supports seamless integration with Supabase that comes with pre-built `SupabaseBaseService` class to assist developers in handling database operations and authentication. Any new service class that requires Supabase service should extend the `SupabaseBaseService` class to inherit the basic unified features included.

- Paste your Supabase project URL and anon key into the provided fields in `app_options.dart` to start integrating Supabase. 
```dart
const SUPABASE_URL = 'YOUR SUPABASE URL'
const SUPABASE_KEY = 'YOUR SUPABASE KEY'
```

For detailed documentation, refer to the [Official Supabase Flutter Documentation](https://supabase.com/docs/reference/dart/introduction).

### Routing Configuration

This Base Kit utilizes the [auto_route](https://pub.dev/packages/auto_route) package to handle routing and follows the [Auto Route Official Documentation](https://pub.dev/packages/go_router) as reference.

1. To add new routes, annotate the new page with `@RoutePage()` above the state class.
```dart
@RoutePage()
class LoginPage extends BaseStatefulPage {
  ...
}
```

2. Run `dart run build_runner build` in the terminal to generate the corresponding route.
3. Add new routes to the routes list getter in `app_router.dart`.
4. Refer to the the auto_route official documentation to pass in parameters or navigate between destinations in app.

### Navigation Bar Configuration

1. Annotate new page with `@RoutePage` and run the `dart run build_runner build` command in the terminal to generate new route.
2. Open the `app_router.dart` file and add the generated route inside the routes list under the `DashboardRoute` children within the `getDashboardRoutes` function.

```dart
AutoRoute getDashboardRoutes() {
  return AutoRoute(
    page: DashboardNavigatorRoute.page,
    children: [
      AutoRoute(
        page: DashboardRoute.page,
        initial: true,
        children: [
          AutoRoute(page: HomeRoute.page, initial: true),
          AutoRoute(page: ProfileRoute.page),
          // Add routes here
        ],
      )
    ],
  );
}
```

3. Open `dashboard_page.dart` and add the new generated routes under the `routes` list.
4. Add or set the styling for each navigation bar item under the `_WidgetFactories` extension and add the new item inside the `items` list.

### Localization Configuration

This Base Kit utilizes the [Flutter Intl IDE Plugin](https://plugins.jetbrains.com/plugin/13666-flutter-intl) and follows the [Official Localizely Documentation](https://localizely.com/blog/flutter-localization-step-by-step/?tab=automated-using-flutter-intl).

1. Open the relevant .arb file in the l10n folder, or create a new one for the desired locale .

```
├── l10n
│    ├── app_en.arb
│    └── app_zh.arb
```

2. Define the new key/value localization pair, adhering to the required format.
3. Direclty access the localization in the app by using `S.current.{your localization variable}`.

```dart
@override
Widget build(BuildContext context) {
  return Text(S.current.helloWorld);
}
```

5. For testing different locales, set the locale in `app.dart` by using `Locale('your language code')` format.

### Typography Configuration

1. Create a new folder inside the `fonts` folder, naming it according to the font family, and include all the necessary font files with various weights.
2. In the pubspec.yaml file, declare the newly added fonts by specifying the font family name and the different font weights.
3. Create a new enum inside `app_typography.dart file` in the `assets` folder file with the font name, and implement the AppTypography abstract class, ensuring that all the required abstract methods are properly defined (refer to the Quicksand font enum).
