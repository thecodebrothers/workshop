import 'package:flutter/material.dart';
import 'package:groceries_app/ui/widgets/primary_button.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Default',
  type: PrimaryButton,
)
Widget primaryButtonUseCase(BuildContext context) {
  return const PrimaryButton();
}
