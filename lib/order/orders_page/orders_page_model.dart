import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/customnavbar/customnavbar_widget.dart';
import '/widgets/top_notification/top_notification_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrdersPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for top_notification component.
  late TopNotificationModel topNotificationModel1;
  // Model for top_notification component.
  late TopNotificationModel topNotificationModel2;
  // Model for customnavbar component.
  late CustomnavbarModel customnavbarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    topNotificationModel1 = createModel(context, () => TopNotificationModel());
    topNotificationModel2 = createModel(context, () => TopNotificationModel());
    customnavbarModel = createModel(context, () => CustomnavbarModel());
  }

  void dispose() {
    topNotificationModel1.dispose();
    topNotificationModel2.dispose();
    customnavbarModel.dispose();
  }

  /// Additional helper methods are added here.

}
