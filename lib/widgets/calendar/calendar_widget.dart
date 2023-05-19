import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'calendar_model.dart';
export 'calendar_model.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late CalendarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 18.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    setState(() {
                      FFAppState().currentQuizDeadline =
                          'Выберу день в календаре';
                    });
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: Color(0xDA102938),
                    size: 24.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
          child: Container(
            width: double.infinity,
            height: 380.0,
            child: custom_widgets.Datetimewidget(
              width: double.infinity,
              height: 380.0,
              textf: 'yyyy',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 24.0),
          child: FFButtonWidget(
            onPressed: () async {
              if (FFAppState().currentQuizDeadline !=
                  'Выберу день в календаре') {
                final ordersUpdateData1 = createOrdersRecordData(
                  deadline: FFAppState().currentQuizDeadline,
                );
                await FFAppState().currentOrder!.update(ordersUpdateData1);
                setState(() {
                  FFAppState().currentQuizDeadline = '';
                });

                context.pushNamed('QuizSelectAddr');

                return;
              } else {
                final ordersUpdateData2 = createOrdersRecordData(
                  deadline: dateTimeFormat(
                    'd/M/y',
                    getCurrentTimestamp,
                    locale: FFLocalizations.of(context).languageCode,
                  ),
                );
                await FFAppState().currentOrder!.update(ordersUpdateData2);
                setState(() {
                  FFAppState().currentQuizDeadline = '';
                });

                context.pushNamed('QuizSelectAddr');

                return;
              }
            },
            text: 'Продолжить',
            options: FFButtonOptions(
              width: double.infinity,
              height: 48.0,
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Fira Sans',
                    color: Colors.white,
                  ),
              elevation: 0.0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ],
    );
  }
}
