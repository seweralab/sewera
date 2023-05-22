import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/close_quiz/close_quiz_widget.dart';
import '/widgets/net_btn/net_btn_widget.dart';
import '/widgets/top_notification/top_notification_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quiz_select_date_calendar_model.dart';
export 'quiz_select_date_calendar_model.dart';

class QuizSelectDateCalendarWidget extends StatefulWidget {
  const QuizSelectDateCalendarWidget({
    Key? key,
    this.customServiceName,
  }) : super(key: key);

  final String? customServiceName;

  @override
  _QuizSelectDateCalendarWidgetState createState() =>
      _QuizSelectDateCalendarWidgetState();
}

class _QuizSelectDateCalendarWidgetState
    extends State<QuizSelectDateCalendarWidget> {
  late QuizSelectDateCalendarModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizSelectDateCalendarModel());
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
          preferredSize: Size.fromHeight(56.0),
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
            toolbarHeight: 0.0,
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.9,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          18.0, 32.0, 18.0, 32.0),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 18.0, 0.0),
                                  child: Icon(
                                    Icons.arrow_back_sharp,
                                    color: Colors.black,
                                    size: 24.0,
                                  ),
                                ),
                                Text(
                                  'Когда нужна услуга?',
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
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
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
                                        onTap: () => FocusScope.of(context)
                                            .requestFocus(_unfocusNode),
                                        child: Padding(
                                          padding:
                                              MediaQuery.of(bottomSheetContext)
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
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    FlutterFlowCalendar(
                      color: FlutterFlowTheme.of(context).primary,
                      weekFormat: false,
                      weekStartsMonday: true,
                      initialDate: getCurrentTimestamp,
                      onChange: (DateTimeRange? newSelectedDate) {
                        setState(
                            () => _model.calendarSelectedDay = newSelectedDate);
                      },
                      titleStyle: TextStyle(),
                      dayOfWeekStyle: TextStyle(),
                      dateStyle: TextStyle(),
                      selectedDateStyle: TextStyle(),
                      inactiveDateStyle: TextStyle(),
                      locale: FFLocalizations.of(context).languageCode,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    final ordersUpdateData = createOrdersRecordData(
                      deadline: functions.calendar(_model.calendarSelectedDay!),
                    );
                    await FFAppState().currentOrder!.update(ordersUpdateData);

                    context.pushNamed('QuizSelectAddr');
                  },
                  child: wrapWithModel(
                    model: _model.netBtnModel,
                    updateCallback: () => setState(() {}),
                    child: NetBtnWidget(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
