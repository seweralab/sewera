import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/close_quiz/close_quiz_widget.dart';
import '/widgets/quiz_checkbox/quiz_checkbox_widget.dart';
import '/widgets/quiz_radio/quiz_radio_widget.dart';
import '/widgets/top_notification/top_notification_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuizPage2EditOrderModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool showInputError = false;

  String? localVal;

  ///  State fields for stateful widgets in this page.

  // Model for top_notification component.
  late TopNotificationModel topNotificationModel;
  // Model for quizRadio component.
  late QuizRadioModel quizRadioModel;
  // Model for quizCheckbox component.
  late QuizCheckboxModel quizCheckboxModel;
  // State field(s) for quizInput widget.
  TextEditingController? quizInputController;
  String? Function(BuildContext, String?)? quizInputControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    topNotificationModel = createModel(context, () => TopNotificationModel());
    quizRadioModel = createModel(context, () => QuizRadioModel());
    quizCheckboxModel = createModel(context, () => QuizCheckboxModel());
  }

  void dispose() {
    topNotificationModel.dispose();
    quizRadioModel.dispose();
    quizCheckboxModel.dispose();
    quizInputController?.dispose();
  }

  /// Additional helper methods are added here.

}
