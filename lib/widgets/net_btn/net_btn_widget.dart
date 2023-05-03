import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'net_btn_model.dart';
export 'net_btn_model.dart';

class NetBtnWidget extends StatefulWidget {
  const NetBtnWidget({Key? key}) : super(key: key);

  @override
  _NetBtnWidgetState createState() => _NetBtnWidgetState();
}

class _NetBtnWidgetState extends State<NetBtnWidget> {
  late NetBtnModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NetBtnModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
      child: Material(
        color: Colors.transparent,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          width: double.infinity,
          height: 48.0,
          decoration: BoxDecoration(
            color: Color(0xFF00BB67),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                child: Text(
                  'Продолжить',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Fira Sans',
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: FlutterFlowTheme.of(context).primaryBtnText,
                size: 18.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
