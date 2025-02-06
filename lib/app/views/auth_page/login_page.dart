import 'package:flutter_base_kit/app/assets/app_router/app_router.dart';
import 'package:flutter_base_kit/app/viewmodels/user_vm/user_view_model.dart';
import 'package:flutter_base_kit/app/widgets/text_form_field/app_text_form_field.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_base_kit/app/assets/exporter/exporter_app_general.dart';

@RoutePage()
class LoginPage extends BaseStatefulPage {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseStatefulState<LoginPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget body() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: StylesManager.defaultSpacing,
        children: [getAppTitleLabel(), getFormBuilder()],
      ),
    );
  }
}

// * ---------------------------- Actions ----------------------------
extension _Actions on _LoginPageState {
  void _onLoginPressed() async {
    if (_formKey.currentState!.saveAndValidate()) {
      final email = _formKey.currentState!.fields[FormFields.email.name]!.value as String;
      final password = _formKey.currentState!.fields[FormFields.password.name]!.value as String;

      final result = await tryLoad(
            context,
            () =>
                context.read<UserViewModel>().loginWithEmailAndPassword(email: email.trim(), password: password.trim()),
          ) ??
          false;

      if (result && mounted) {
        context.router.replaceAll([DashboardNavigatorRoute()]);
      }
    }
  }

  void _onTestErrorPressed() async {
    await tryLoad(
        context, () => context.read<UserViewModel>().getUserProfile(userId: '62c1365a-55e4-413c-8195-1a8fa09cb032'));
  }

  void _onRemoveAllSP() async {
    await SharedPreferenceHandler().removeAll();
  }
}

// * ------------------------ WidgetFactories ------------------------
extension _WidgetFactories on _LoginPageState {
  // App Title Label
  Widget getAppTitleLabel() {
    return Text(
      S.current.flutterBaseKit,
      style: _Styles.getAppTitleTextStyle(),
    );
  }

  // Form Builder
  Widget getFormBuilder() {
    return FormBuilder(
      key: _formKey,
      child: Column(
        spacing: StylesManager.defaultSpacing,
        children: [
          getEmailTextField(),
          getPasswordTextField(),
          getLoginButton(),
          getTestErrorButton(),
          getRemoveAllSPButton(),
          getSignUpButton(),
        ],
      ),
    );
  }

  // Email Text Field
  Widget getEmailTextField() {
    return AppTextFormField(
      field: FormFields.email,
      placeholder: S.current.email,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.email(),
      ]),
    );
  }

  // Password Text Field
  Widget getPasswordTextField() {
    return AppTextFormField(
      field: FormFields.password,
      placeholder: S.current.password,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.minLength(8),
      ]),
    );
  }

  // Login Button
  Widget getLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _onLoginPressed,
        child: Text(S.current.login, style: _Styles.getButtonLabelTextStyle()),
      ),
    );
  }

  // Test Error Button
  Widget getTestErrorButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _onTestErrorPressed,
        child: Text(S.current.testError, style: _Styles.getButtonLabelTextStyle()),
      ),
    );
  }

  // Remove All SP Button
  Widget getRemoveAllSPButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _onRemoveAllSP,
        child: Text(S.current.removeSP, style: _Styles.getButtonLabelTextStyle()),
      ),
    );
  }

  // Sign Up Button
  Widget getSignUpButton() {
    return TextButton(
      onPressed: () => context.router.replaceAll([SignUpRoute()]),
      child: Text(S.current.signUpCTA, style: _Styles.getSignUpButtonLabelTextStyle()),
    );
  }
}

// * ---------------------------- Styles -----------------------------
class _Styles {
  // App Title Text Style
  static getAppTitleTextStyle() {
    return Quicksand.bold.withSize(FontSizes.extraMassive).copyWith(color: ColorManager.primaryColor);
  }

  // Button Label Text Style
  static getButtonLabelTextStyle() {
    return Quicksand.medium.withSize(FontSizes.large);
  }

  // Sign Up Button Label Text Style
  static getSignUpButtonLabelTextStyle() {
    return Quicksand.medium.withSize(FontSizes.medium);
  }
}
