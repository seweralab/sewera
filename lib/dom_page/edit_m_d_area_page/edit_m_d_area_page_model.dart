import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/customnavbar/customnavbar_widget.dart';
import '/widgets/top_notification/top_notification_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditMDAreaPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for areaField widget.
  TextEditingController? areaFieldController;
  String? Function(BuildContext, String?)? areaFieldControllerValidator;
  // Model for customnavbar component.
  late CustomnavbarModel customnavbarModel;
  // Model for top_notification component.
  late TopNotificationModel topNotificationModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    customnavbarModel = createModel(context, () => CustomnavbarModel());
    topNotificationModel = createModel(context, () => TopNotificationModel());
  }

  void dispose() {
    areaFieldController?.dispose();
    customnavbarModel.dispose();
    topNotificationModel.dispose();
  }

  /// Additional helper methods are added here.

}
