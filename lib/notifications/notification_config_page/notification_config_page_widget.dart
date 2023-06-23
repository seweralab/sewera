import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/top_notification/top_notification_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notification_config_page_model.dart';
export 'notification_config_page_model.dart';

class NotificationConfigPageWidget extends StatefulWidget {
  const NotificationConfigPageWidget({Key? key}) : super(key: key);

  @override
  _NotificationConfigPageWidgetState createState() =>
      _NotificationConfigPageWidgetState();
}

class _NotificationConfigPageWidgetState
    extends State<NotificationConfigPageWidget> {
  late NotificationConfigPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationConfigPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.topNotificationModel,
                      updateCallback: () => setState(() {}),
                      child: TopNotificationWidget(
                        isDisbaledHome: false,
                        isDisabledNotification: false,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                18.0, 14.0, 18.0, 16.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.safePop();
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 18.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.safePop();
                                          },
                                          child: Icon(
                                            Icons.arrow_back_sharp,
                                            color: Colors.black,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Настройка уведомлений',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Fira Sans',
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                AuthUserStreamWidget(
                                  builder: (context) => SwitchListTile.adaptive(
                                    value: _model.switchListTileValue1 ??=
                                        valueOrDefault<bool>(
                                            currentUserDocument?.push, false),
                                    onChanged: (newValue) async {
                                      setState(() => _model
                                          .switchListTileValue1 = newValue!);
                                    },
                                    title: Text(
                                      'Push уведомления',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Fira Sans',
                                            fontSize: 14.0,
                                          ),
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                  ),
                                ),
                                AuthUserStreamWidget(
                                  builder: (context) => SwitchListTile.adaptive(
                                    value: _model.switchListTileValue2 ??=
                                        valueOrDefault<bool>(
                                            currentUserDocument
                                                ?.emailNotifications,
                                            false),
                                    onChanged: (newValue) async {
                                      setState(() => _model
                                          .switchListTileValue2 = newValue!);
                                    },
                                    title: Text(
                                      'Email уведомления',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Fira Sans',
                                            fontSize: 14.0,
                                          ),
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 30.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await currentUserReference!
                            .update(createUsersRecordData(
                          push: _model.switchListTileValue1,
                          emailNotifications: _model.switchListTileValue2,
                        ));
                        context.safePop();
                      },
                      text: 'Готово!',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 48.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
