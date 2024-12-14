import 'package:flutter_base_kit/app/assets/exporter/importer_app_general.dart';
import 'package:flutter_base_kit/app/assets/exporter/importer_app_config.dart';
import 'package:flutter_base_kit/app/assets/app_options.dart';
import 'package:flutter_base_kit/app/assets/app_router.dart';

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
  final routerConfiguration = AppRouter.routerConfiguration();

  @override
  void initState() {
    super.initState();
    setupEasyLoading();
  }

  @override
  Widget build(BuildContext context) {
    // Watch the LocaleViewModel to rebuild when the locale changes
    final currentLocale = context.select((LocaleViewModel vm) => vm.currentAppLocale);
    S.load(currentLocale);
    final themeMode = context.select((ThemeViewModel vm) => vm.themeMode);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: routerConfiguration,
      builder: (context, child) {
        final easyLoadingInitialiser = EasyLoading.init(
          builder: (context, child) {
            final mediaQueryData = MediaQuery.of(context);
            final scale = mediaQueryData.textScaler;
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaler: scale),
              child: child ?? const SizedBox(),
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
        GlobalCupertinoLocalizations.delegate
      ],
      locale: currentLocale,
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}

extension _Init on _AppWrapperState {
  void setupEasyLoading() {
    EasyLoading.instance.userInteractions = false;
    EasyLoading.instance.maskType = EasyLoadingMaskType.black;
  }
}
