import 'package:flutter_base_kit/app/assets/exporter/importer_app_general.dart';
import 'package:flutter_base_kit/app/widgets/onboarding/onboard_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
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

  @override
  Widget build(BuildContext context) {
    bool isLastPage = pageIndex == onboardData.length - 1;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(StylesManager.defaultPadding),
          child: Column(
            children: [
              Expanded(child: getOnboardingPageView()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (!isLastPage) getSkipButton(),
                  getGeneratedDotIndicator(),
                  getNextButton(isLastPage),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // Enable Set State inside Extension
  void _setState(VoidCallback fn) {
    if (mounted) {
      setState(fn);
    }
  }
}

// * ---------------------------- Actions ----------------------------
extension _Actions on _OnboardingScreenState {
  void finishOnboarding() {
    if (mounted) {
      SharedPreferenceHandler().putHasOnboarded(true);
      context.go(NavigatePath.homeScreen);
    }
  }
}

// * ------------------------ WidgetFactories ------------------------
extension _WidgetFactories on _OnboardingScreenState {
  // Skip Button
  Widget getSkipButton() {
    return TextButton(
        onPressed: finishOnboarding, style: _Styles.getButtonStyle(context), child: Text(S.current.skip.toUpperCase()));
  }

  // Next Button
  Widget getNextButton(bool isLastPage) {
    return TextButton(
        onPressed: () {
          isLastPage
              ? finishOnboarding()
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
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_Styles.dotIndicatorWidth),
          color: isActive ? ColorManager.primaryColor : Colors.black),
      width: isActive ? _Styles.dotIndicatorWidth * 2 : _Styles.dotIndicatorWidth,
      height: _Styles.dotIndicatorWidth,
    );
  }

  Widget getGeneratedDotIndicator() {
    return Row(
      children: List.generate(
        onboardData.length,
        (index) => Padding(
          padding: const EdgeInsets.all(3),
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
        textStyle: Quicksand.bold.withSize(FontSizes.medium), foregroundColor: ColorManager.primaryColor);
  }

  // Dot Indicator Style
  static const dotIndicatorWidth = 8.0;
}
