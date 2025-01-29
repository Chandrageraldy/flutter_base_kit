import 'package:flutter_base_kit/app/models/auth_model.dart/email_auth_request_model.dart';
import 'package:flutter_base_kit/app/models/user_profile_model/user_profile_model.dart';
import 'package:flutter_base_kit/app/services/user_service/user_service.dart';

import 'package:flutter_base_kit/app/assets/exporter/exporter_app_general.dart';

class UserRepository {
  final UserService userService = UserService();
  final SharedPreferenceHandler sharedPreferenceHandler = SharedPreferenceHandler();

  bool get isLoggedIn => sharedPreferenceHandler.getUser() != null;

  Future<Response> loginWithEmailAndPassword({required String email, required String password}) async {
    EmailAuthRequestModel model = EmailAuthRequestModel(email: email, password: password);
    final response = await userService.loginWithEmailAndPassword(model);
    return response;
  }

  Future<Response> signUpWithEmailAndPassword({required String email, required String password}) async {
    EmailAuthRequestModel model = EmailAuthRequestModel(email: email, password: password);
    final response = await userService.signUpWithEmailAndPassword(model);
    return response;
  }

  Future<Response> logout() async {
    final response = await userService.logout();
    sharedPreferenceHandler.logout();
    return response;
  }

  Future<Response> createUserProfile({required String userId, required String email}) async {
    UserProfileModel model = UserProfileModel(userId: userId, email: email);
    final response = await userService.createUserProfile(model: model);
    if (response.error == null) {
      await processUserProfile(response.data as List<Map<String, dynamic>>);
    }
    return response;
  }

  Future<Response> getUserProfile({required String userId}) async {
    final response = await userService.getUserProfile(userId: userId);
    if (response.error == null) {
      await processUserProfile(response.data as List<Map<String, dynamic>>);
    }
    return response;
  }
}

// * ------------------------ PrivateMethods ------------------------
extension _PrivateMethods on UserRepository {
  Future<void> processUserProfile(List<Map<String, dynamic>> user) async {
    UserProfileModel model = UserProfileModel.fromJson(user[0]);

    await sharedPreferenceHandler.putUser(model);
    // print(sharedPreferenceHandler.getUser());
  }
}
