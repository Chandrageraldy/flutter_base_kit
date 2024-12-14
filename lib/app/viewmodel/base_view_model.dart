import 'package:flutter_base_kit/app/assets/exporter/importer_app_general.dart';

/// A base class to unified all the required common fields and functions
/// Inherited with ChangeNotifier for Provider State Management
/// All inheriting classes will be able to access these values and features
class BaseViewModel with ChangeNotifier {
  /// response that view layer listening for data changes
  /// view layer may perform data update or any Ui logic depends on response status
  Response response = Response<dynamic, Exception>.initial();

  /// Unified method to call Provider [notifyListeners()] to update [response] value.
  void notify(Response newResponse) {
    response = newResponse;
    switch (newResponse.status) {
      case ResponseStatus.LOADING:
        EasyLoading.show();
        break;
      case ResponseStatus.COMPLETE:
      case ResponseStatus.ERROR:
        EasyLoading.dismiss();
        break;
      case ResponseStatus.INITIAL:
        break;
    }
    notifyListeners();
  }
}
