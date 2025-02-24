import 'package:flutter_base_kit/app/assets/exporter/exporter_app_general.dart';

class AdaptiveAlertDialog extends StatelessWidget {
  const AdaptiveAlertDialog({required this.errorMessage, required this.actionBuilders, super.key});

  final String errorMessage;
  final List<Widget> actionBuilders;

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(
        S.current.somethingWentWrong,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
      ),
      content: Text(errorMessage),
      actions: actionBuilders,
      shape: RoundedRectangleBorder(
        borderRadius: StylesManager.kRadius8,
      ),
    );
  }
}
