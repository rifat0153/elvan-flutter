import 'package:elvan/shared/constants/strings.dart';
import 'package:elvan/shared/components/dialogs/alert_dialog_model.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class DeleteDialog extends AlertDialogModel<bool> {
  const DeleteDialog({
    required String titleOfObjectToDelete,
  }) : super(
          title: '${Strings.delete} $titleOfObjectToDelete?',
          message:
              '${Strings.areYouSureYouWantToDeleteThis} $titleOfObjectToDelete?',
          buttons: const {
            Strings.cancel: false,
            Strings.delete: true,
          },
        );
}
