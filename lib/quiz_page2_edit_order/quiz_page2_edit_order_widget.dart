import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/close_quiz/close_quiz_widget.dart';
import '/widgets/quiz_checkbox/quiz_checkbox_widget.dart';
import '/widgets/quiz_radio/quiz_radio_widget.dart';
import '/widgets/top_notification/top_notification_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quiz_page2_edit_order_model.dart';
export 'quiz_page2_edit_order_model.dart';

class QuizPage2EditOrderWidget extends StatefulWidget {
  const QuizPage2EditOrderWidget({
    Key? key,
    this.serviceRef,
    required this.quiztitle,
  }) : super(key: key);

  final DocumentReference? serviceRef;
  final String? quiztitle;

  @override
  _QuizPage2EditOrderWidgetState createState() =>
      _QuizPage2EditOrderWidgetState();
}

class _QuizPage2EditOrderWidgetState extends State<QuizPage2EditOrderWidget> {
  late QuizPage2EditOrderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizPage2EditOrderModel());
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
      child: WillPopScope(
        onWillPop: () async => false,
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
            child: StreamBuilder<OrdersRecord>(
              stream: OrdersRecord.getDocument(FFAppState().currentOrder!),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 40.0,
                      height: 40.0,
                      child: CircularProgressIndicator(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  );
                }
                final columnOrdersRecord = snapshot.data!;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: StreamBuilder<List<QuizRecord>>(
                        stream: queryQuizRecord(
                          parent: widget.serviceRef,
                          queryBuilder: (quizRecord) => quizRecord
                              .where('title', isEqualTo: widget.quiztitle),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 40.0,
                                height: 40.0,
                                child: CircularProgressIndicator(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            );
                          }
                          List<QuizRecord> quizQuizRecordList = snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final quizQuizRecord = quizQuizRecordList.isNotEmpty
                              ? quizQuizRecordList.first
                              : null;
                          return Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Stack(
                              children: [
                                if (quizQuizRecord != null)
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      18.0, 32.0, 18.0, 32.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      if (FFAppState()
                                                              .currentQuizIndex >
                                                          0)
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      18.0,
                                                                      0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              context.safePop();
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .arrow_back_sharp,
                                                              color:
                                                                  Colors.black,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.7,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Text(
                                                          quizQuizRecord!.title,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Fira Sans',
                                                                fontSize: 20.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder:
                                                              (bottomSheetContext) {
                                                            return GestureDetector(
                                                              onTap: () => FocusScope
                                                                      .of(
                                                                          context)
                                                                  .requestFocus(
                                                                      _unfocusNode),
                                                              child: Padding(
                                                                padding: MediaQuery.of(
                                                                        bottomSheetContext)
                                                                    .viewInsets,
                                                                child:
                                                                    CloseQuizWidget(),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            setState(() {}));
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
                                            if (FFAppState().currentQuizTopErr)
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          48.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 277.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFFFEE83),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  10.0,
                                                                  8.0,
                                                                  10.0),
                                                      child: Text(
                                                        'Нужно выбрать хотя бы один вариант',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Fira Sans',
                                                              fontSize: 14.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              if (quizQuizRecord!.type ==
                                                  'select')
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(18.0, 0.0, 18.0,
                                                          10.0),
                                                  child: wrapWithModel(
                                                    model:
                                                        _model.quizRadioModel,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: QuizRadioWidget(
                                                      selects:
                                                          functions.splitBy(
                                                              quizQuizRecord!
                                                                  .options,
                                                              '||'),
                                                      quizJSON:
                                                          columnOrdersRecord
                                                              .quiz,
                                                      quizName:
                                                          quizQuizRecord!.title,
                                                      quizType:
                                                          quizQuizRecord!.type,
                                                    ),
                                                  ),
                                                ),
                                              if (quizQuizRecord!.type ==
                                                  'multiselect')
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(18.0, 0.0, 18.0,
                                                          10.0),
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .quizCheckboxModel,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: QuizCheckboxWidget(
                                                      selects:
                                                          functions.splitBy(
                                                              quizQuizRecord!
                                                                  .options,
                                                              '||'),
                                                      quizJSON:
                                                          columnOrdersRecord
                                                              .quiz,
                                                      quizName:
                                                          quizQuizRecord!.title,
                                                      quizType:
                                                          quizQuizRecord!.type,
                                                    ),
                                                  ),
                                                ),
                                              if ((quizQuizRecord!.type !=
                                                      'multiselect') &&
                                                  (quizQuizRecord!.type !=
                                                      'select'))
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(18.0, 0.0,
                                                                18.0, 0.0),
                                                    child: Stack(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      18.0,
                                                                      32.0,
                                                                      18.0,
                                                                      32.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  if (FFAppState()
                                                                          .currentQuizIndex >
                                                                      0)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          18.0,
                                                                          0.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          setState(
                                                                              () {
                                                                            FFAppState().currentQuizIndex =
                                                                                FFAppState().currentQuizIndex + -1;
                                                                          });
                                                                          context
                                                                              .safePop();
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .arrow_back_sharp,
                                                                          color:
                                                                              Colors.black,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.7,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Text(
                                                                      quizQuizRecord!
                                                                          .title,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Fira Sans',
                                                                            fontSize:
                                                                                20.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      enableDrag:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (bottomSheetContext) {
                                                                        return GestureDetector(
                                                                          onTap: () =>
                                                                              FocusScope.of(context).requestFocus(_unfocusNode),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.of(bottomSheetContext).viewInsets,
                                                                            child:
                                                                                CloseQuizWidget(),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        setState(
                                                                            () {}));
                                                                  },
                                                                  child: Icon(
                                                                    Icons.close,
                                                                    color: Colors
                                                                        .black,
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        if (FFAppState()
                                                                .currentQuizTopErr ==
                                                            true)
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          48.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: 277.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFFFEE83),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          10.0,
                                                                          8.0,
                                                                          10.0),
                                                                  child: Text(
                                                                    'Нужно выбрать хотя бы один вариант',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Fira Sans',
                                                                          fontSize:
                                                                              14.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        if ((quizQuizRecord!
                                                                    .type !=
                                                                'select') &&
                                                            (quizQuizRecord!
                                                                    .type !=
                                                                'multiselect'))
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child:
                                                                      AuthUserStreamWidget(
                                                                    builder:
                                                                        (context) =>
                                                                            TextFormField(
                                                                      controller:
                                                                          _model.quizInputController ??=
                                                                              TextEditingController(
                                                                        text: functions.inputFromUserFields(
                                                                            quizQuizRecord!
                                                                                .input,
                                                                            valueOrDefault(currentUserDocument?.mdSeptic,
                                                                                ''),
                                                                            valueOrDefault(currentUserDocument?.mdArea, ''),
                                                                            valueOrDefault(currentUserDocument?.mdType, ''),
                                                                            columnOrdersRecord.quiz,
                                                                            quizQuizRecord!.title),
                                                                      ),
                                                                      onChanged:
                                                                          (_) =>
                                                                              EasyDebounce.debounce(
                                                                        '_model.quizInputController',
                                                                        Duration(
                                                                            milliseconds:
                                                                                10),
                                                                        () async {
                                                                          setState(
                                                                              () {
                                                                            _model.showInputError =
                                                                                false;
                                                                          });
                                                                          setState(
                                                                              () {
                                                                            FFAppState().currentQuizTopErr =
                                                                                false;
                                                                          });
                                                                        },
                                                                      ),
                                                                      onFieldSubmitted:
                                                                          (_) async {
                                                                        setState(
                                                                            () {
                                                                          _model.showInputError =
                                                                              false;
                                                                        });
                                                                        setState(
                                                                            () {
                                                                          FFAppState().currentQuizTopErr =
                                                                              false;
                                                                        });
                                                                      },
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintText:
                                                                            'Укажите свое значение',
                                                                        hintStyle:
                                                                            FlutterFlowTheme.of(context).bodySmall,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                functions.borderErrorColor(_model.showInputError),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        filled:
                                                                            true,
                                                                        fillColor:
                                                                            Color(0xFFF3F4F5),
                                                                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      validator: _model
                                                                          .quizInputControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              if (_model
                                                                      .showInputError ==
                                                                  true)
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            15.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              1.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              SvgPicture.asset(
                                                                            'assets/images/confirm.svg',
                                                                            width:
                                                                                14.0,
                                                                            height:
                                                                                14.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'Это поле нужно заполнить',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Fira Sans',
                                                                                  fontSize: 12.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      if (quizQuizRecord!.title != null &&
                                          quizQuizRecord!.title != '')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  18.0, 0.0, 18.0, 20.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              if (quizQuizRecord!.type ==
                                                  'select') {
                                                if (FFAppState()
                                                            .currentRadioQuiz !=
                                                        null &&
                                                    FFAppState()
                                                            .currentRadioQuiz !=
                                                        '') {
                                                  if (FFAppState()
                                                          .currentRadioQuiz ==
                                                      'input') {
                                                    if (FFAppState()
                                                                .currentQuizRadioInput !=
                                                            null &&
                                                        FFAppState()
                                                                .currentQuizRadioInput !=
                                                            '') {
                                                      final ordersUpdateData1 =
                                                          createOrdersRecordData(
                                                        quiz: functions
                                                            .quizPage2updateLocalValRadio(
                                                                FFAppState()
                                                                    .currentRadioQuiz,
                                                                quizQuizRecord!
                                                                    .title,
                                                                quizQuizRecord!
                                                                    .reference,
                                                                columnOrdersRecord
                                                                    .quiz,
                                                                FFAppState()
                                                                    .currentQuizRadioInput),
                                                        status: 'Не оформлен',
                                                      );
                                                      await FFAppState()
                                                          .currentOrder!
                                                          .update(
                                                              ordersUpdateData1);
                                                    } else {
                                                      setState(() {
                                                        FFAppState()
                                                                .currentQuizRadieInputErr =
                                                            true;
                                                      });
                                                      return;
                                                    }
                                                  } else {
                                                    final ordersUpdateData2 =
                                                        createOrdersRecordData(
                                                      quiz: functions
                                                          .quizPage2updateLocalValRadio(
                                                              FFAppState()
                                                                  .currentRadioQuiz,
                                                              quizQuizRecord!
                                                                  .title,
                                                              quizQuizRecord!
                                                                  .reference,
                                                              columnOrdersRecord
                                                                  .quiz,
                                                              FFAppState()
                                                                  .currentQuizRadioInput),
                                                      status: 'Не оформлен',
                                                    );
                                                    await FFAppState()
                                                        .currentOrder!
                                                        .update(
                                                            ordersUpdateData2);
                                                  }
                                                } else {
                                                  setState(() {
                                                    FFAppState()
                                                            .currentQuizTopErr =
                                                        true;
                                                  });
                                                  return;
                                                }
                                              } else {
                                                if (quizQuizRecord!.type ==
                                                    'multiselect') {
                                                  if (FFAppState()
                                                          .currentCheckQuiz
                                                          .length >
                                                      0) {
                                                    if (functions
                                                        .isCheckboxHaveInput(
                                                            FFAppState()
                                                                .currentCheckQuiz
                                                                .toList())) {
                                                      if (FFAppState()
                                                                  .currentCheckInputQuiz !=
                                                              null &&
                                                          FFAppState()
                                                                  .currentCheckInputQuiz !=
                                                              '') {
                                                        final ordersUpdateData3 =
                                                            createOrdersRecordData(
                                                          quiz: functions.quizPage2updateLocalValCheckbox(
                                                              columnOrdersRecord
                                                                  .quiz,
                                                              FFAppState()
                                                                  .currentCheckInputQuiz,
                                                              FFAppState()
                                                                  .currentCheckQuiz
                                                                  .toList(),
                                                              quizQuizRecord!
                                                                  .reference,
                                                              quizQuizRecord!
                                                                  .title),
                                                          status: 'Не оформлен',
                                                        );
                                                        await columnOrdersRecord
                                                            .reference
                                                            .update(
                                                                ordersUpdateData3);
                                                      } else {
                                                        setState(() {
                                                          FFAppState()
                                                                  .currentCheckInputQuizErr =
                                                              true;
                                                        });
                                                        return;
                                                      }
                                                    } else {
                                                      final ordersUpdateData4 =
                                                          createOrdersRecordData(
                                                        quiz: functions
                                                            .quizPage2updateLocalValCheckbox(
                                                                columnOrdersRecord
                                                                    .quiz,
                                                                FFAppState()
                                                                    .currentCheckInputQuiz,
                                                                FFAppState()
                                                                    .currentCheckQuiz
                                                                    .toList(),
                                                                quizQuizRecord!
                                                                    .reference,
                                                                quizQuizRecord!
                                                                    .title),
                                                        status: 'Не оформлен',
                                                      );
                                                      await columnOrdersRecord
                                                          .reference
                                                          .update(
                                                              ordersUpdateData4);
                                                    }
                                                  } else {
                                                    setState(() {
                                                      FFAppState()
                                                              .currentQuizTopErr =
                                                          true;
                                                    });
                                                    return;
                                                  }
                                                } else {
                                                  if (_model.quizInputController
                                                              .text !=
                                                          null &&
                                                      _model.quizInputController
                                                              .text !=
                                                          '') {
                                                    final ordersUpdateData5 =
                                                        createOrdersRecordData(
                                                      quiz: functions
                                                          .quizPage2updateLocalValInput(
                                                              columnOrdersRecord
                                                                  .quiz,
                                                              _model
                                                                  .quizInputController
                                                                  .text,
                                                              quizQuizRecord!
                                                                  .title,
                                                              quizQuizRecord!
                                                                  .reference),
                                                      status: 'Не оформлен',
                                                    );
                                                    await columnOrdersRecord
                                                        .reference
                                                        .update(
                                                            ordersUpdateData5);
                                                  } else {
                                                    setState(() {
                                                      _model.showInputError =
                                                          true;
                                                    });
                                                    return;
                                                  }
                                                }
                                              }

                                              setState(() {
                                                FFAppState().currentQuizIndex =
                                                    FFAppState()
                                                            .currentQuizIndex +
                                                        1;
                                                FFAppState().currentRadioQuiz =
                                                    '';
                                                FFAppState()
                                                    .currentQuizRadioInput = '';
                                                FFAppState()
                                                        .currentQuizRadieInputErr =
                                                    false;
                                                FFAppState().currentCheckQuiz =
                                                    [];
                                                FFAppState()
                                                    .currentCheckInputQuiz = '';
                                                FFAppState()
                                                        .currentCheckInputQuizErr =
                                                    false;
                                                FFAppState().currentQuizTopErr =
                                                    false;
                                              });

                                              context
                                                  .pushNamed('QuizSendOrder');
                                            },
                                            text: 'Сохранить',
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 48.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Fira Sans',
                                                        color: Colors.white,
                                                      ),
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
