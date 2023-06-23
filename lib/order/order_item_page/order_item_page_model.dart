import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/top_notification/top_notification_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class OrderItemPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool showDetails = false;

  bool showInfoChanged = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for top_notification component.
  late TopNotificationModel topNotificationModel;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  OrdersRecord? reorder;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    topNotificationModel = createModel(context, () => TopNotificationModel());
  }

  void dispose() {
    unfocusNode.dispose();
    topNotificationModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
