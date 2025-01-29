import 'package:flutter_base_kit/app/repositories/user_repo/user_repository.dart';
import 'package:flutter_base_kit/app/viewmodels/base_view_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserViewModel extends BaseViewModel {
  final UserRepository userRepository = UserRepository();

  bool get isLoggedIn => userRepository.isLoggedIn;

  Future<bool> loginWithEmailAndPassword({required String email, required String password}) async {
    final response = await userRepository.loginWithEmailAndPassword(email: email, password: password);
    checkError(response);

    if (response.data is User) {
      User user = response.data;
      await getUserProfile(userId: user.id);
    }

    return response.data is User;
  }

  Future<bool> signUpWithEmailAndPassword({required String email, required String password}) async {
    final response = await userRepository.signUpWithEmailAndPassword(email: email, password: password);
    checkError(response);

    if (response.data is User) {
      User user = response.data;
      await createUserProfile(userId: user.id, email: user.email!);
    }

    return response.data is User;
  }

  Future<bool> logout() async {
    final response = await userRepository.logout();
    checkError(response);
    return response.data;
  }

  Future<void> createUserProfile({required String userId, required String email}) async {
    final response = await userRepository.createUserProfile(userId: userId, email: email);
    checkError(response);
  }

  Future<void> getUserProfile({required String userId}) async {
    final response = await userRepository.getUserProfile(userId: userId);
    checkError(response);
  }
}
