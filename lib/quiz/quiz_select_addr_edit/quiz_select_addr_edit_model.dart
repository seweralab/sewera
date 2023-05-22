import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/close_quiz/close_quiz_widget.dart';
import '/widgets/net_btn/net_btn_widget.dart';
import '/widgets/top_notification/top_notification_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuizSelectAddrEditModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool? showSuggestion;

  LatLng? selectCoord;

  bool showInputErr = true;

  ///  State fields for stateful widgets in this page.

  // Model for NetBtn component.
  late NetBtnModel netBtnModel;
  // Model for top_notification component.
  late TopNotificationModel topNotificationModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    netBtnModel = createModel(context, () => NetBtnModel());
    topNotificationModel = createModel(context, () => TopNotificationModel());
  }

  void dispose() {
    netBtnModel.dispose();
    topNotificationModel.dispose();
  }

  /// Additional helper methods are added here.

}
