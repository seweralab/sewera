import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/calendar/calendar_widget.dart';
import '/widgets/close_quiz/close_quiz_widget.dart';
import '/widgets/top_notification/top_notification_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'quiz_page2_edit_date_model.dart';
export 'quiz_page2_edit_date_model.dart';

class QuizPage2EditDateWidget extends StatefulWidget {
  const QuizPage2EditDateWidget({Key? key}) : super(key: key);

  @override
  _QuizPage2EditDateWidgetState createState() =>
      _QuizPage2EditDateWidgetState();
}

class _QuizPage2EditDateWidgetState extends State<QuizPage2EditDateWidget> {
  late QuizPage2EditDateModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizPage2EditDateModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  wrapWithModel(
                    model: _model.topNotificationModel,
                    updateCallback: () => setState(() {}),
                    child: TopNotificationWidget(
                      isDisbaledHome: false,
                      isDisabledNotification: false,
                    ),
                  ),
                ],
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            toolbarHeight: 0,
            elevation: 0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: StreamBuilder<OrdersRecord>(
            stream: OrdersRecord.getDocument(FFAppState().currentOrder!),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                );
              }
              final columnOrdersRecord = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Stack(
                          alignment: AlignmentDirectional(0, 0),
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  18, 32, 18, 32),
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 18, 0),
                                          child: Icon(
                                            Icons.arrow_back_sharp,
                                            color: Colors.black,
                                            size: 24,
                                          ),
                                        ),
                                        Text(
                                          'Когда нужна услуга?',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Fira Sans',
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (bottomSheetContext) {
                                              return GestureDetector(
                                                onTap: () => FocusScope.of(
                                                        context)
                                                    .requestFocus(_unfocusNode),
                                                child: Padding(
                                                  padding: MediaQuery.of(
                                                          bottomSheetContext)
                                                      .viewInsets,
                                                  child: CloseQuizWidget(),
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        },
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.black,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (_model.showTopError == true)
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      45, 0, 0, 0),
                                  child: Container(
                                    width: 277,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFEE83),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 10, 8, 10),
                                      child: Text(
                                        'Нужно выбрать хотя бы один вариант',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Fira Sans',
                                              fontSize: 14,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                        child: Builder(
                          builder: (context) {
                            final radios =
                                functions.quizGetRadioDates().toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: radios.length,
                              itemBuilder: (context, radiosIndex) {
                                final radiosItem = radios[radiosIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 10),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      setState(() {
                                        _model.selected = radiosItem;
                                      });
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Stack(
                                          children: [
                                            if (radiosItem != _model.selected)
                                              SvgPicture.asset(
                                                'assets/images/radio_clear.svg',
                                                width: 24,
                                                height: 24,
                                                fit: BoxFit.cover,
                                              ),
                                            if (radiosItem == _model.selected)
                                              SvgPicture.asset(
                                                'assets/images/radio_check.svg',
                                                width: 24,
                                                height: 24,
                                                fit: BoxFit.cover,
                                              ),
                                          ],
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.75,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 0, 0, 0),
                                            child: AutoSizeText(
                                              radiosItem,
                                              maxLines: 2,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 20),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (_model.selected != null && _model.selected != '') {
                          if (_model.selected == 'Выберу день в календаре') {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              isDismissible: false,
                              enableDrag: false,
                              context: context,
                              builder: (bottomSheetContext) {
                                return GestureDetector(
                                  onTap: () => FocusScope.of(context)
                                      .requestFocus(_unfocusNode),
                                  child: Padding(
                                    padding: MediaQuery.of(bottomSheetContext)
                                        .viewInsets,
                                    child: Container(
                                      height: 460,
                                      child: CalendarWidget(),
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));

                            return;
                          } else {
                            final ordersUpdateData = createOrdersRecordData(
                              deadline: _model.selected,
                            );
                            await FFAppState()
                                .currentOrder!
                                .update(ordersUpdateData);

                            context.pushNamed(
                              'QuizSendOrder',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                      PageTransitionType.rightToLeft,
                                ),
                              },
                            );

                            return;
                          }
                        } else {
                          setState(() {
                            _model.showTopError = true;
                          });
                          return;
                        }
                      },
                      text: 'Сохранить',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 48,
                        elevation: 0,
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Fira Sans',
                                  color: Colors.white,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
