import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/customnavbar/customnavbar_widget.dart';
import '/widgets/top_notification/top_notification_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ProfilePageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool? showTooltip = false;

  ///  State fields for stateful widgets in this page.

  // Model for top_notification component.
  late TopNotificationModel topNotificationModel;
  // Model for customnavbar component.
  late CustomnavbarModel customnavbarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    topNotificationModel = createModel(context, () => TopNotificationModel());
    customnavbarModel = createModel(context, () => CustomnavbarModel());
  }

  void dispose() {
    topNotificationModel.dispose();
    customnavbarModel.dispose();
  }

  /// Additional helper methods are added here.

}
