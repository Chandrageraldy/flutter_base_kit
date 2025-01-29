import 'package:flutter_base_kit/app/models/error_model/error_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:flutter_base_kit/app/assets/exporter/exporter_app_general.dart';

abstract class SupabaseBaseService {
  Future<Response> authenticate({Map<String, dynamic>? requestBody, required AuthType authType}) async {
    try {
      AuthResponse? response;
      final supabase = Supabase.instance.client;
      switch (authType) {
        case AuthType.EMAILSIGNUP:
          response = await supabase.auth.signUp(
            email: requestBody!['email'],
            password: requestBody['password'],
          );
        case AuthType.EMAILLOGIN:
          response = await supabase.auth.signInWithPassword(
            email: requestBody!['email'],
            password: requestBody['password'],
          );
        case AuthType.LOGOUT:
          await supabase.auth.signOut();
          return Response.complete(true);
      }
      return Response.complete(response.user);
    } on AuthException catch (e) {
      debugPrint('Code: ${e.code}');
      debugPrint(e.message);
      return _handleSupabaseException(e.code);
    } catch (e) {
      debugPrint(e.toString());
      return Response.error(e);
    }
  }

  Future<Response> callSupabaseDB({
    required RequestType requestType,
    Map<dynamic, dynamic>? requestBody,
    SupabaseQueryBuilder? queryBuilder,
    Map<String, dynamic>? filters,
  }) async {
    try {
      final PostgrestList? response;
      PostgrestFilterBuilder? filterBuilder;

      switch (requestType) {
        case RequestType.GET:
          filterBuilder = queryBuilder?.select();
        case RequestType.POST:
          filterBuilder = queryBuilder?.insert(requestBody as Object);
        case RequestType.PUT:
          filterBuilder = queryBuilder?.update(requestBody!);
        case RequestType.DELETE:
          filterBuilder = queryBuilder?.delete();
      }

      if (filters != null && filters.isNotEmpty && filterBuilder != null) {
        filters.forEach((key, value) {
          if (value != null) {
            filterBuilder = filterBuilder?.eq(key, value);
          }
        });
      }

      response = await filterBuilder?.select() ?? [];

      // Return urgent error if response is empty
      if (response.isEmpty) {
        return _handleSupabaseException(SupabaseExceptionType.permissionDenied);
      }

      return Response.complete(response);
    } on PostgrestException catch (e) {
      debugPrint('Code: ${e.code}');
      debugPrint(e.message);
      return _handleSupabaseException(e.code);
    } catch (e) {
      debugPrint(e.toString());
      return Response.error(e);
    }
  }

  Response _handleSupabaseException(String? e) {
    String message;
    switch (e) {
      case SupabaseExceptionType.invalidCredentials:
        message = S.current.invalidCredential;
      case SupabaseExceptionType.userAlreadyExists:
        message = S.current.usedEmail;
      case SupabaseExceptionType.permissionDenied:
        message = S.current.permissionDenied;
        return Response.error(ErrorModel(code: e, message: message, isUrgentError: true));
      default:
        message = S.current.requestError;
    }

    return Response.error(ErrorModel(code: e, message: message));
  }
}

enum RequestType { GET, POST, PUT, DELETE }

enum AuthType { EMAILSIGNUP, EMAILLOGIN, LOGOUT }

class SupabaseExceptionType {
  static const invalidCredentials = 'invalid_credentials';
  static const userAlreadyExists = 'user_already_exists';
  static const permissionDenied = 'permission_denied';
}
