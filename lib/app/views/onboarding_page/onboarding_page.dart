import 'package:flutter_base_kit/app/assets/app_router/app_router.dart';
import 'package:flutter_base_kit/app/widgets/onboard_content/onboard_content.dart';

import 'package:flutter_base_kit/app/assets/exporter/exporter_app_general.dart';

@RoutePage()
class OnboardingPage extends BaseStatefulPage {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends BaseStatefulState<OnboardingPage> {
  late PageController _pageController;
  var pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Enable Set State inside Extension
  void _setState(VoidCallback fn) {
    if (mounted) {
      setState(fn);
    }
  }

  @override
  Widget body() {
    bool isLastPage = pageIndex == onboardData.length - 1;
    return Column(
      children: [
        Expanded(child: getOnboardingPageView()),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [if (!isLastPage) getSkipButton(), getGeneratedDotIndicator(), getNextButton(isLastPage)],
        )
      ],
    );
  }
}

// * ---------------------------- Actions ----------------------------
extension _Actions on _OnboardingPageState {
  void _finishOnboarding() {
    if (mounted) {
      SharedPreferenceHandler().putHasOnboarded(true);
      context.router.replaceAll([LoginRoute()]);
    }
  }
}

// * ------------------------ WidgetFactories ------------------------
extension _WidgetFactories on _OnboardingPageState {
  // Skip Button
  Widget getSkipButton() {
    return TextButton(
        onPressed: _finishOnboarding,
        style: _Styles.getButtonStyle(context),
        child: Text(S.current.skip.toUpperCase()));
  }

  // Next Button
  Widget getNextButton(bool isLastPage) {
    return TextButton(
        onPressed: () {
          isLastPage
              ? _finishOnboarding()
              : _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
        },
        style: _Styles.getButtonStyle(context),
        child: Text(isLastPage ? S.current.getStarted.toUpperCase() : S.current.next.toUpperCase()));
  }

  // Onboarding PageView Builder
  Widget getOnboardingPageView() {
    return PageView.builder(
      itemCount: onboardData.length,
      controller: _pageController,
      onPageChanged: (index) {
        _setState(() {
          pageIndex = index;
        });
      },
      itemBuilder: (context, index) => OnboardContent(
        onboardTitle: onboardData[index].onboardTitle,
        onboardImage: onboardData[index].onboardImage,
        onboardDesc: onboardData[index].onboardDesc,
      ),
    );
  }

  // Dot Indicator
  Widget getDotIndicator(bool isActive) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: StylesManager.kRadius8, color: isActive ? ColorManager.blueColor : Colors.black),
      width: isActive ? _Styles.dotIndicatorWidth * 2 : _Styles.dotIndicatorWidth,
      height: _Styles.dotIndicatorWidth,
    );
  }

  Widget getGeneratedDotIndicator() {
    return Row(
      children: List.generate(
        onboardData.length,
        (index) => Padding(
          padding: StylesManager.kPadd3,
          child: getDotIndicator(index == pageIndex),
        ),
      ),
    );
  }
}

// * ----------------------------- Styles -----------------------------
abstract class _Styles {
  // Skip & Next Button Style
  static ButtonStyle getButtonStyle(BuildContext context) {
    return TextButton.styleFrom(
        textStyle: Quicksand.bold.withSize(FontSizes.medium), foregroundColor: ColorManager.blueColor);
  }

  // Dot Indicator Style
  static const dotIndicatorWidth = 8.0;
}
