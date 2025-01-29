import 'package:flutter_base_kit/app/assets/exporter/exporter_app_general.dart';

@RoutePage()
class HomePage extends BaseStatefulPage {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseStatefulState<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget body() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [getHomeLabel()],
      ),
    );
  }
}

// * ------------------------ WidgetFactories ------------------------
extension _WidgetFactories on _HomePageState {
  // Home Label
  Widget getHomeLabel() {
    return Text(S.current.homeScreenLabel, style: _Styles.getLabelTextStyle());
  }
}

// * ---------------------------- Styles -----------------------------
abstract class _Styles {
  // Label Text Style
  static getLabelTextStyle() {
    return Quicksand.medium.withSize(FontSizes.large);
  }
}
