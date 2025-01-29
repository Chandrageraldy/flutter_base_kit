import 'package:flutter/cupertino.dart';
import 'package:flutter_base_kit/app/assets/app_router/app_router.dart';
import 'package:flutter_base_kit/app/assets/exporter/exporter_app_general.dart';

@RoutePage()
class DashboardPage extends BaseStatefulPage {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends BaseStatefulState<DashboardPage> {
  @override
  Widget body() {
    return AutoTabsRouter.tabBar(
      physics: NeverScrollableScrollPhysics(),
      routes: const [
        HomeRoute(),
        ProfileRoute(),
      ],
      builder: (context, child, _) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child,
          extendBodyBehindAppBar: true,
          bottomNavigationBar: CupertinoTabBar(
            currentIndex: tabsRouter.activeIndex,
            backgroundColor: ColorManager.lightBlueColor,
            activeColor: Colors.black,
            inactiveColor: Colors.grey,
            onTap: tabsRouter.setActiveIndex,
            items: [
              getHomeBarItem(),
              getProfileBarItem(),
            ],
          ),
        );
      },
    );
  }

  @override
  bool hasDefaultPadding() {
    return false;
  }
}

// * ------------------------ WidgetFactories ------------------------
extension _WidgetFactories on _DashboardPageState {
  BottomNavigationBarItem getHomeBarItem() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home),
      label: S.current.homeScreenLabel,
    );
  }

  BottomNavigationBarItem getProfileBarItem() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      activeIcon: Icon(Icons.person),
      label: S.current.profileScreenLabel,
    );
  }
}
