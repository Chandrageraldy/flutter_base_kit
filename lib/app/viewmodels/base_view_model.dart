import 'package:flutter_base_kit/app/models/error_model/error_model.dart';

import 'package:flutter_base_kit/app/assets/exporter/exporter_app_general.dart';

/// A base class to unified all the required common fields and functions
/// Inherited with ChangeNotifier for Provider State Management
/// All inheriting classes will be able to access these values and features
class BaseViewModel with ChangeNotifier {
  /// A function that handles error responses from the API.
  /// It will throw an exception if there are any errors.
  /// Ensure to handle these exceptions with the [tryLoad] or [tryCatch] methods in the UI.
  void checkError(Response response) {
    if (response.status == ResponseStatus.ERROR) {
      if (response.error != null && response.error is ErrorModel) {
        ErrorModel error = response.error;
        if (error.isUrgentError) {
          throw UrgentErrorException(error.message ?? S.current.requestError);
        }
        throw NormalErrorException(error.message ?? S.current.requestError);
      }
      throw NormalErrorException(S.current.requestError);
    }
  }
}

class NormalErrorException implements Exception {
  final String message;

  NormalErrorException(this.message);
}

class UrgentErrorException implements Exception {
  final String message;

  UrgentErrorException(this.message);
}
