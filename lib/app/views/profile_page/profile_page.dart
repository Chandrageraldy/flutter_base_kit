import 'package:flutter_base_kit/app/assets/app_router/app_router.dart';
import 'package:flutter_base_kit/app/models/user_profile_model/user_profile_model.dart';
import 'package:flutter_base_kit/app/viewmodels/user_vm/user_view_model.dart';

import 'package:flutter_base_kit/app/assets/exporter/exporter_app_general.dart';

@RoutePage()
class ProfilePage extends BaseStatefulPage {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends BaseStatefulState<ProfilePage> {
  final UserProfileModel? userProfile = SharedPreferenceHandler().getUser();

  @override
  Widget body() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          getEmailLabel(),
          getUserIdLabel(),
          getProfileButton(),
          getTestUrgentErrorButton(),
          getLogoutButton(),
        ],
      ),
    );
  }
}

// * ---------------------------- Actions ----------------------------
extension _Actions on _ProfilePageState {
  void _onGetProfilePressed() async {
    UserProfileModel? user = SharedPreferenceHandler().getUser();
    await tryLoad(context, () => context.read<UserViewModel>().getUserProfile(userId: user?.userId ?? ''));
  }

  void _onTestUrgentErrorPressed() async {
    await tryLoad(context, () => context.read<UserViewModel>().logout());
    if (mounted) {
      await tryLoad(
          context, () => context.read<UserViewModel>().getUserProfile(userId: '62c1365a-55e4-413c-8195-1a8fa09cb032'));
    }
  }

  void _onLogoutPressed() async {
    final result = await tryLoad(context, () => context.read<UserViewModel>().logout()) ?? false;

    if (result && mounted) {
      context.router.replaceAll([LoginRoute()]);
    }
  }
}

// * ------------------------ WidgetFactories ------------------------
extension _WidgetFactories on _ProfilePageState {
  // Email Label
  Widget getEmailLabel() {
    return Text(userProfile?.email ?? '', style: _Styles.getLabelTextStyle());
  }

  // User ID Label
  Widget getUserIdLabel() {
    return Text(userProfile?.userId ?? '', style: _Styles.getLabelTextStyle());
  }

  // Logout Button
  Widget getLogoutButton() {
    return TextButton(
      onPressed: _onLogoutPressed,
      child: Text(S.current.logOut),
    );
  }

  // Test Error Button
  Widget getProfileButton() {
    return TextButton(
      onPressed: _onGetProfilePressed,
      child: Text(S.current.profileScreenLabel, style: _Styles.getButtonLabelTextStyle()),
    );
  }

  Widget getTestUrgentErrorButton() {
    return TextButton(
      onPressed: _onTestUrgentErrorPressed,
      child: Text(S.current.testUrgentError),
    );
  }
}

// * ---------------------------- Styles -----------------------------
abstract class _Styles {
  // Label Text Style
  static getLabelTextStyle() {
    return Quicksand.medium.withSize(FontSizes.large);
  }

  // Button Label Text Style
  static getButtonLabelTextStyle() {
    return Quicksand.medium.withSize(FontSizes.large);
  }
}
