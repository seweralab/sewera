import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 's_m_s_page_model.dart';
export 's_m_s_page_model.dart';

class SMSPageWidget extends StatefulWidget {
  const SMSPageWidget({
    Key? key,
    this.phone,
  }) : super(key: key);

  final String? phone;

  @override
  _SMSPageWidgetState createState() => _SMSPageWidgetState();
}

class _SMSPageWidgetState extends State<SMSPageWidget> {
  late SMSPageModel _model;
  FocusNode _focusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SMSPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onExecute.add(StopWatchExecute.start);
    });

    authManager.handlePhoneAuthStateChanges(context);
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 60),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, -1),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 90),
                            child: SvgPicture.asset(
                              'assets/images/logo.svg',
                              width: 32,
                              height: 32,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                          child: Text(
                            'Введите код из смс',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  fontFamily: 'Fira Sans',
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                          child: Text(
                            'Введите код из смс, который пришел на телефон, который вы указали',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont(
                              'Fira Sans',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 14,
                              height: 1.2,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                child: Text(
                                  widget.phone!,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Fira Sans',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed(
                                    'StartPage',
                                    queryParameters: {
                                      'phone': serializeParam(
                                        widget.phone,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                text: 'Изменить',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 33,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Fira Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                  elevation: 0,
                                  borderSide: BorderSide(
                                    color: Color(0xFF405460),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          alignment: AlignmentDirectional(0, 1),
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 5, 0, 30),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    FocusScope.of(context)
                                        .requestFocus(_focusNode);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF3F4F5),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: valueOrDefault<Color>(
                                          functions
                                              .pincodeBorderErr(_model.showErr),
                                          Color(0xFF82959C),
                                        ),
                                      ),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 15, 0, 0),
                                        child: PinCodeTextField(
                                          focusNode:
                                              _focusNode, // Устанавливаем фокус на поле пин-кода
                                          autoDisposeControllers: false,
                                          appContext: context,
                                          length: 6,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Fira Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          enableActiveFill: false,
                                          autoFocus: true,
                                          enablePinAutofill: true,
                                          errorTextSpace: 16,
                                          showCursor: false,
                                          backgroundColor: Color(0xFFF3F4F5),
                                          keyboardType: TextInputType.phone,
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          obscureText: false,
                                          hintCharacter: '●',
                                          pinTheme: PinTheme(
                                            fieldHeight: 40,
                                            fieldWidth: 20,
                                            borderWidth: 0,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            shape: PinCodeFieldShape.circle,
                                            activeColor: Color(0xFFF3F4F5),
                                            inactiveColor: Color(0xFFF3F4F5),
                                            selectedColor: Color(0xFFF3F4F5),
                                            activeFillColor: Color(0xFFF3F4F5),
                                            inactiveFillColor:
                                                Color(0xFFF3F4F5),
                                            selectedFillColor:
                                                Color(0xFFF3F4F5),
                                          ),
                                          controller: _model.pinCodeController,
                                          onChanged: (_) {},
                                          onCompleted: (_) async {
                                            Function() _navigate = () {};
                                            GoRouter.of(context)
                                                .prepareAuthEvent();
                                            final smsCodeVal =
                                                _model.pinCodeController!.text;
                                            if (smsCodeVal == null ||
                                                smsCodeVal.isEmpty) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                      'Введите код подтверждения'),
                                                ),
                                              );
                                              return;
                                            }
                                            final phoneVerifiedUser =
                                                await authManager.verifySmsCode(
                                              context: context,
                                              smsCode: smsCodeVal,
                                            );
                                            if (phoneVerifiedUser == null) {
                                              return;
                                            }

                                            _navigate = () =>
                                                context.goNamedAuth('HomePage2',
                                                    context.mounted);
                                            if (!loggedIn) {
                                              setState(() {
                                                _model.showSendBtn = false;
                                                _model.showTimer = true;
                                              });
                                            }

                                            _navigate();
                                          },
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          validator: _model
                                              .pinCodeControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (_model.showErr)
                              Align(
                                alignment: AlignmentDirectional(0, 1),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 10),
                                  child: Text(
                                    'Неверный код',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Fira Sans',
                                          color: Color(0xFFEB5757),
                                          fontSize: 12,
                                        ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        if (_model.showSendBtn)
                          FFButtonWidget(
                            onPressed: () async {
                              _model.timerController.onExecute
                                  .add(StopWatchExecute.reset);

                              await Future.delayed(
                                  const Duration(milliseconds: 50));
                              _model.timerController.onExecute
                                  .add(StopWatchExecute.start);
                              await Future.delayed(
                                  const Duration(milliseconds: 100));
                              setState(() {
                                _model.showSendBtn = false;
                                _model.showTimer = true;
                              });
                              final phoneNumberVal = widget.phone;
                              if (phoneNumberVal == null ||
                                  phoneNumberVal.isEmpty ||
                                  !phoneNumberVal.startsWith('+')) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text('Телефонный номер обязателен'),
                                  ),
                                );
                                return;
                              }
                              await authManager.beginPhoneAuth(
                                context: context,
                                phoneNumber: phoneNumberVal,
                                onCodeSent: (context) async {
                                  context.goNamedAuth(
                                    'SMSPage',
                                    context.mounted,
                                    queryParameters: {
                                      'phone': serializeParam(
                                        widget.phone,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                    ignoreRedirect: true,
                                  );
                                },
                              );
                            },
                            text: 'Отправить СМС ещё раз',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 48,
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              iconPadding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              color: Color(0xFF405460),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Fira Sans',
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                              elevation: 0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        if (_model.showTimer)
                          Container(
                            width: double.infinity,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Color(0xFFF3F4F5),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Новый код — через ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Fira Sans',
                                        color: Color(0x4D102938),
                                      ),
                                ),
                                FlutterFlowTimer(
                                  initialTime: _model.timerMilliseconds,
                                  getDisplayTime: (value) =>
                                      StopWatchTimer.getDisplayTime(
                                    value,
                                    hours: false,
                                    minute: false,
                                    milliSecond: false,
                                  ),
                                  timer: _model.timerController,
                                  updateStateInterval:
                                      Duration(milliseconds: 1000),
                                  onChanged:
                                      (value, displayTime, shouldUpdate) {
                                    _model.timerMilliseconds = value;
                                    _model.timerValue = displayTime;
                                    if (shouldUpdate) setState(() {});
                                  },
                                  onEnded: () async {
                                    setState(() {
                                      _model.showSendBtn = true;
                                      _model.showTimer = false;
                                    });
                                  },
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Fira Sans',
                                        color: Color(0x4D102938),
                                      ),
                                ),
                                Text(
                                  ' сек.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Fira Sans',
                                        color: Color(0x4D102938),
                                      ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(18, 30, 18, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.safePop();
                      },
                      child: Icon(
                        Icons.close,
                        color: Color(0xDA102938),
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
