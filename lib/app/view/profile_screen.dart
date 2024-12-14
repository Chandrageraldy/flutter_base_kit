import 'package:flutter_base_kit/app/assets/exporter/importer_app_general.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(S.current.profileScreenLabel, style: _Styles.getLabelTextStyle()),
      ),
    );
  }
}

abstract class _Styles {
  static getLabelTextStyle() {
    return Quicksand.medium.withSize(FontSizes.large);
  }
}
