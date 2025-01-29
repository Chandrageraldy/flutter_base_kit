import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_base_kit/app/assets/app_router/app_router.dart';
import 'package:flutter_base_kit/app/utils/utils/utils.dart';
import 'package:flutter_base_kit/app/viewmodels/base_view_model.dart';
import 'package:flutter_base_kit/app/viewmodels/user_vm/user_view_model.dart';

import 'package:flutter_base_kit/app/assets/exporter/exporter_app_general.dart';

mixin ErrorHandlingMixin {
  /// Tries to execute a given asynchronous [fn] function, showing an error
  /// dialog if an error occurs and [shouldShowAlert] is true.
  /// Returns the result of [fn] if successful, or [null] if an error occurs.
  ///
  /// [BuildContext] context is required for showing dialogs.
  /// [Future<T?> Function()] fn is the asynchronous operation to try.
  /// [bool] shouldShowAlert determines whether to show an error dialog.
  Future<T?> tryCatch<T>(
    BuildContext context,
    Future<T?> Function() fn, {
    bool shouldShowAlert = true,
  }) async {
    try {
      return await fn();
    } on UrgentErrorException catch (e, stackTrace) {
      if (context.mounted) {
        unawaited(_handleUrgentError(context, e.message, stackTrace));
      }
      return null;
    } on NormalErrorException catch (e, stackTrace) {
      if (context.mounted) {
        unawaited(_handleError(context, shouldShowAlert, e.message, stackTrace));
      }
      return null;
    }
  }

  Future<T?> tryLoad<T>(
    BuildContext context,
    Future<T?> Function() fn, {
    bool shouldShowAlert = true,
  }) async {
    unawaited(EasyLoading.show());
    try {
      return await fn();
    } on UrgentErrorException catch (e, stackTrace) {
      await EasyLoading.dismiss();
      if (context.mounted) {
        unawaited(_handleUrgentError(context, e.message, stackTrace));
      }
      return null;
    } on NormalErrorException catch (e, stackTrace) {
      await EasyLoading.dismiss();
      if (context.mounted) {
        unawaited(_handleError(context, shouldShowAlert, e.message, stackTrace));
      }
      return null;
    } finally {
      await EasyLoading.dismiss();
    }
  }

  Future<void> _handleError(BuildContext context, bool shouldShowAlert, String message, StackTrace stackTrace) async {
    if (shouldShowAlert && context.mounted) {
      await WidgetUtils.showDefaultErrorDialog(context, message.toString());
    }

    // UNCOMMENT TO DEBUG ERROR
    debugPrint('Error: $message\nStack Trace: $stackTrace');
  }

  Future<void> _handleUrgentError(BuildContext context, String message, StackTrace stackTrace) async {
    if (context.mounted) {
      await WidgetUtils.showDefaultErrorDialog(context, message.toString());
      if (context.mounted) {
        await tryLoad(context, () => context.read<UserViewModel>().logout());
        if (context.mounted) {
          context.router.replaceAll([LoginRoute()]);
        }
      }
    }
    // UNCOMMENT TO DEBUG ERROR
    debugPrint('Error: $message\nStack Trace: $stackTrace');
  }
}
