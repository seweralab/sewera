import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/close_quiz/close_quiz_widget.dart';
import '/widgets/net_btn/net_btn_widget.dart';
import '/widgets/top_notification/top_notification_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuizSelectAddrEditModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool? showSuggestion;

  LatLng? selectCoord;

  bool showInputErr = true;

  ///  State fields for stateful widgets in this page.

  // Model for top_notification component.
  late TopNotificationModel topNotificationModel;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (DaDataSuggestion)] action in TextField widget.
  ApiCallResponse? apiResultx2g;
  // Model for NetBtn component.
  late NetBtnModel netBtnModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    topNotificationModel = createModel(context, () => TopNotificationModel());
    netBtnModel = createModel(context, () => NetBtnModel());
  }

  void dispose() {
    topNotificationModel.dispose();
    textController?.dispose();
    netBtnModel.dispose();
  }

  /// Additional helper methods are added here.

}
