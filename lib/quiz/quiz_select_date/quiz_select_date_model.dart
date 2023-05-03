import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/widgets/close_quiz/close_quiz_widget.dart';
import '/widgets/net_btn/net_btn_widget.dart';
import '/widgets/top_notification/top_notification_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuizSelectDateModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool showTopErr = true;

  ///  State fields for stateful widgets in this page.

  // Model for top_notification component.
  late TopNotificationModel topNotificationModel;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // Model for NetBtn component.
  late NetBtnModel netBtnModel;
  DateTime? datePicked;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    topNotificationModel = createModel(context, () => TopNotificationModel());
    netBtnModel = createModel(context, () => NetBtnModel());
  }

  void dispose() {
    topNotificationModel.dispose();
    netBtnModel.dispose();
  }

  /// Additional helper methods are added here.

  String? get radioButtonValue => radioButtonValueController?.value;
}
