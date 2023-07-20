import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class StartPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for phonefield widget.
  TextEditingController? phonefieldController;
  final phonefieldMask = SpecialMaskTextInputFormatter();
  String? Function(BuildContext, String?)? phonefieldControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    phonefieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

class SpecialMaskTextInputFormatter extends MaskTextInputFormatter {
  static String maskA = "+# (###) ###-##-##";
  static String maskB = "+7 (###) ###-##-##";
  static String maskC = "+7 (###) ###-##-##";

  SpecialMaskTextInputFormatter({String? initialText})
      : super(
            mask: maskA,
            filter: {"#": RegExp('[0-9]')},
            initialText: initialText);
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String firstChar =
        newValue.text.isNotEmpty ? newValue.text.substring(0, 1) : "";

    if (firstChar == "7") {
      print(newValue.text.substring(1));
      newValue = TextEditingValue(
        text: "+7" + newValue.text.substring(1),
        selection: newValue.selection.copyWith(baseOffset: 2, extentOffset: 2),
      );
      updateMask(mask: maskA);
    } else if (firstChar == "9") {
      newValue = TextEditingValue(
        text: "+79" + newValue.text.substring(1),
        selection: newValue.selection.copyWith(baseOffset: 3, extentOffset: 3),
      );
      updateMask(mask: maskB);
    }
    print(newValue);

    return super.formatEditUpdate(oldValue, newValue);
  }
}
