import 'package:flutter/material.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

class PhoneFieldController extends ChangeNotifier {
  late final ValueNotifier<IsoCode?> isoCodeController;
  late final TextEditingController nationalController;
  final IsoCode defaultIsoCode;

  /// focus node of the national number
  final FocusNode focusNode;

  IsoCode? get isoCode => isoCodeController.value;
  String? get national => nationalController.text.isEmpty ? null : nationalController.text;
  set isoCode(IsoCode? isoCode) => isoCodeController.value = isoCode;
  set national(String? national) => nationalController.value = TextEditingValue(
        text: national ?? '',
        selection: TextSelection.fromPosition(
          TextPosition(offset: national?.length ?? 0),
        ),
      );

  PhoneFieldController({
    required String? national,
    required IsoCode? isoCode,
    required this.defaultIsoCode,
    required this.focusNode,
  }) {
    isoCodeController = ValueNotifier(isoCode);
    nationalController = TextEditingController(text: national);
    isoCodeController.addListener(notifyListeners);
    nationalController.addListener(notifyListeners);
  }

  selectNationalNumber() {
    nationalController.selection = TextSelection(
      baseOffset: 0,
      extentOffset: nationalController.value.text.length,
    );
    focusNode.requestFocus();
  }

  @override
  void dispose() {
    isoCodeController.dispose();
    nationalController.dispose();
    super.dispose();
  }
}
