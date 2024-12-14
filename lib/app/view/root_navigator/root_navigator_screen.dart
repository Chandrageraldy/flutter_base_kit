import 'package:flutter_base_kit/app/assets/exporter/importer_app_general.dart';

class RootNavigatorScreen extends StatefulWidget {
  const RootNavigatorScreen({super.key, required this.child, required this.location});

  final Widget child;
  final String location;

  @override
  State<RootNavigatorScreen> createState() => _RootNavigatorScreenState();
}

class _RootNavigatorScreenState extends State<RootNavigatorScreen> {
  int _selectedIndex = 0;
  var navBarItems = <GoRouterBottomNavBarItem>[];

  void _onTabItemTapped(BuildContext context, int index) {
    if (index == _selectedIndex) return;
    GoRouter router = GoRouter.of(context);
    String location = navBarItems[index].initialLocation ?? '';

    setState(() {
      _selectedIndex = index;
    });
    router.go(location);
  }

  @override
  Widget build(BuildContext context) {
    navBarItems = <GoRouterBottomNavBarItem>[
      // CONFIGURE NAVIGATION BAR ITEM
      GoRouterBottomNavBarItem(
        icon: const Icon(Icons.home_outlined),
        activeIcon: const Icon(Icons.home),
        label: S.current.homeScreenLabel,
        initialLocation: NavigatePath.homeScreen,
      ),
      GoRouterBottomNavBarItem(
        icon: const Icon(Icons.person_outline),
        activeIcon: const Icon(Icons.person),
        label: S.current.profileScreenLabel,
        initialLocation: NavigatePath.profileScreen,
      ),
      // ADD MORE NAVIGATION ITEM BELOW
    ];
    int currentIndex =
        widget.location == NavigatePath.homeScreen ? NavigatorRouteItem.homeScreen : NavigatorRouteItem.profileScreen;
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: _Styles.getSelectedLabelStyle(context),
        unselectedLabelStyle: _Styles.getUnselectedLabelStyle(context),
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorManager.lightBlueColor,
        items: navBarItems,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (int index) => _onTabItemTapped(context, index),
      ),
    );
  }
}

class GoRouterBottomNavBarItem extends BottomNavigationBarItem {
  final String? initialLocation;

  const GoRouterBottomNavBarItem({this.initialLocation, required super.icon, required super.activeIcon, super.label});
}

abstract class _Styles {
  // Navigation Item Text Style
  static TextStyle getSelectedLabelStyle(BuildContext context) {
    return Quicksand.light.withSize(FontSizes.extraSmall).copyWith(color: ColorManager.lightBlueColor);
  }

  static TextStyle getUnselectedLabelStyle(BuildContext context) {
    return Quicksand.light.withSize(FontSizes.extraSmall).copyWith(color: ColorManager.whiteColor);
  }
}
