import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/customnavbar/customnavbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SupportModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for customnavbar component.
  late CustomnavbarModel customnavbarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    customnavbarModel = createModel(context, () => CustomnavbarModel());
  }

  void dispose() {
    customnavbarModel.dispose();
  }

  /// Additional helper methods are added here.

}
