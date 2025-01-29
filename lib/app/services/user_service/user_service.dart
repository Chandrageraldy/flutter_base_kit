import 'package:flutter_base_kit/app/models/auth_model.dart/email_auth_request_model.dart';
import 'package:flutter_base_kit/app/models/response_model.dart';
import 'package:flutter_base_kit/app/models/user_profile_model/user_profile_model.dart';
import 'package:flutter_base_kit/app/services/supabase_base_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserService extends SupabaseBaseService {
  final supabase = Supabase.instance.client;

  Future<Response> loginWithEmailAndPassword(EmailAuthRequestModel model) {
    return authenticate(authType: AuthType.EMAILLOGIN, requestBody: model.toJson());
  }

  Future<Response> signUpWithEmailAndPassword(EmailAuthRequestModel model) {
    return authenticate(authType: AuthType.EMAILSIGNUP, requestBody: model.toJson());
  }

  Future<Response> logout() {
    return authenticate(authType: AuthType.LOGOUT);
  }

  Future<Response> createUserProfile({required UserProfileModel model}) {
    return callSupabaseDB(
      requestType: RequestType.POST,
      requestBody: model.toJson(),
      queryBuilder: supabase.from('user'),
    );
  }

  Future<Response> getUserProfile({required String userId}) {
    return callSupabaseDB(
        requestType: RequestType.GET, queryBuilder: supabase.from('user'), filters: {'userId': userId});
  }
}
