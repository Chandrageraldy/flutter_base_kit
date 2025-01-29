import 'package:flutter_base_kit/app/assets/app_router/app_router.dart';
import 'package:flutter_base_kit/app/viewmodels/user_vm/user_view_model.dart';
import 'package:flutter_base_kit/app/widgets/text_form_field/app_text_form_field.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:flutter_base_kit/app/assets/exporter/exporter_app_general.dart';

@RoutePage()
class SignUpPage extends BaseStatefulPage {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends BaseStatefulState<SignUpPage> {
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
extension _Actions on _SignUpPageState {
  void _onSignUpPressed() async {
    if (_formKey.currentState!.saveAndValidate()) {
      final email = _formKey.currentState!.fields[FormFields.email.name]!.value as String;
      final password = _formKey.currentState!.fields[FormFields.password.name]!.value as String;

      final result = await tryLoad(
            context,
            () => context
                .read<UserViewModel>()
                .signUpWithEmailAndPassword(email: email.trim(), password: password.trim()),
          ) ??
          false;

      if (result && mounted) {
        context.router.replaceAll([DashboardNavigatorRoute()]);
      }
    }
  }
}

// * ------------------------ WidgetFactories ------------------------
extension _WidgetFactories on _SignUpPageState {
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
        children: [getEmailTextField(), getPasswordTextField(), getSignUpButton(), getLogInButton()],
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

  // Sign Up Button
  Widget getSignUpButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _onSignUpPressed,
        child: Text(
          S.current.signUp,
          style: _Styles.getButtonLabelTextStyle(),
        ),
      ),
    );
  }

  // Log In Button
  Widget getLogInButton() {
    return TextButton(
      onPressed: () => context.router.replaceAll([LoginRoute()]),
      child: Text(S.current.loginCTA, style: _Styles.getLogInButtonLabelTextStyle()),
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

  // Log In Button Label Text Style
  static getLogInButtonLabelTextStyle() {
    return Quicksand.medium.withSize(FontSizes.medium);
  }
}
