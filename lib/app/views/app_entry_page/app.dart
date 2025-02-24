import 'package:flutter_base_kit/app/assets/app_options/app_options.dart';
import 'package:flutter_base_kit/app/assets/app_router/app_router.dart';

import 'package:flutter_base_kit/app/viewmodels/app_config_vm/locale_view_model.dart';
import 'package:flutter_base_kit/app/viewmodels/app_config_vm/theme_view_model.dart';

import 'package:flutter_base_kit/app/assets/exporter/exporter_app_general.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providerAssets(),
      child: const AppWrapper(),
    );
  }
}

class AppWrapper extends StatefulWidget {
  const AppWrapper({super.key});

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  final _router = AppRouter();

  @override
  void initState() {
    super.initState();
    _setupEasyLoading();
  }

  @override
  Widget build(BuildContext context) {
    // Watch the LocaleViewModel and ThemeViewModel to rebuild when the locale or theme changes
    final currentLocale = context.select((LocaleViewModel vm) => vm.currentAppLocale);
    final themeMode = context.select((ThemeViewModel vm) => vm.themeMode);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router.config(),
      builder: (context, child) {
        final easyLoadingInitialiser = EasyLoading.init(
          builder: (context, child) {
            final mediaQueryData = MediaQuery.of(context);
            final scale = mediaQueryData.textScaler;
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaler: scale),
              child: child ?? StylesManager.kEmptyWidget,
            );
          },
        );
        return easyLoadingInitialiser(context, child);
      },
      theme: ThemeManager.lightMode,
      darkTheme: ThemeManager.darkMode,
      themeMode: themeMode,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: currentLocale,
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}

// * ------------------------ PrivateMethods ------------------------
extension _PrivateMethods on _AppWrapperState {
  void _setupEasyLoading() {
    EasyLoading.instance.userInteractions = false;
    EasyLoading.instance.maskType = EasyLoadingMaskType.black;
  }
}
