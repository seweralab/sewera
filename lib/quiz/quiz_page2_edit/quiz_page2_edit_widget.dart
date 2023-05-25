import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/widgets/close_quiz/close_quiz_widget.dart';
import '/widgets/top_notification/top_notification_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quiz_page2_edit_model.dart';
export 'quiz_page2_edit_model.dart';

class QuizPage2EditWidget extends StatefulWidget {
  const QuizPage2EditWidget({
    Key? key,
    this.quizref,
    this.quiztitle,
    this.serviceref,
  }) : super(key: key);

  final DocumentReference? quizref;
  final String? quiztitle;
  final DocumentReference? serviceref;

  @override
  _QuizPage2EditWidgetState createState() => _QuizPage2EditWidgetState();
}

class _QuizPage2EditWidgetState extends State<QuizPage2EditWidget> {
  late QuizPage2EditModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizPage2EditModel());
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

    return StreamBuilder<List<QuizRecord>>(
      stream: queryQuizRecord(
        parent: widget.serviceref,
        queryBuilder: (quizRecord) =>
            quizRecord.where('title', isEqualTo: widget.quiztitle),
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
        List<QuizRecord> quizPage2EditQuizRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final quizPage2EditQuizRecord = quizPage2EditQuizRecordList.isNotEmpty
            ? quizPage2EditQuizRecordList.first
            : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.0),
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
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    SingleChildScrollView(
                                      primary: false,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          18.0, 0.0, 18.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
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
                                                                context
                                                                    .safePop();
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .arrow_back_sharp,
                                                                color: Colors
                                                                    .black,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            quizPage2EditQuizRecord!
                                                                .title,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Fira Sans',
                                                                  fontSize:
                                                                      20.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
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
                                                                  onTap: () => FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          _unfocusNode),
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery.of(
                                                                            bottomSheetContext)
                                                                        .viewInsets,
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
                                                            color: Colors.black,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                if (_model.showTopError == true)
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: 277.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFFFEE83),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
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
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    18.0, 0.0, 18.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          if ((functions
                                                                      .splitBy(
                                                                          quizPage2EditQuizRecord!
                                                                              .options,
                                                                          '||')
                                                                      .length
                                                                      .toString() !=
                                                                  '0') &&
                                                              (quizPage2EditQuizRecord!
                                                                      .type ==
                                                                  'select'))
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.8,
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              1.0),
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                300.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                              child: FlutterFlowRadioButton(
                                                                                options: functions.addSelectsCustomInput(functions.splitBy(quizPage2EditQuizRecord!.options, '||').toList()).toList(),
                                                                                onChanged: (val) async {
                                                                                  setState(() {});
                                                                                  setState(() {
                                                                                    _model.showInputError = false;
                                                                                    _model.showTopError = false;
                                                                                    _model.localVal = _model.radioButtonValue;
                                                                                  });
                                                                                },
                                                                                controller: _model.radioButtonValueController ??= FormFieldController<String>(functions.setInitialRadio(columnOrdersRecord.quiz, quizPage2EditQuizRecord!.title)!),
                                                                                optionHeight: 50.0,
                                                                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Fira Sans',
                                                                                      color: Colors.black,
                                                                                    ),
                                                                                textPadding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                buttonPosition: RadioButtonPosition.left,
                                                                                direction: Axis.vertical,
                                                                                radioButtonColor: Color(0xFF00BB67),
                                                                                inactiveRadioButtonColor: Color(0x8A000000),
                                                                                toggleable: false,
                                                                                horizontalAlignment: WrapAlignment.start,
                                                                                verticalAlignment: WrapCrossAlignment.start,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                30.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                              ),
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.05),
                                                                                    child: Container(
                                                                                      width: double.infinity,
                                                                                      child: TextFormField(
                                                                                        controller: _model.textController1 ??= TextEditingController(
                                                                                          text: functions.setInitialRadioInput(columnOrdersRecord.quiz, quizPage2EditQuizRecord!.title),
                                                                                        ),
                                                                                        onChanged: (_) => EasyDebounce.debounce(
                                                                                          '_model.textController1',
                                                                                          Duration(milliseconds: 10),
                                                                                          () async {
                                                                                            setState(() {
                                                                                              _model.showInputError = false;
                                                                                              _model.showTopError = false;
                                                                                            });
                                                                                            setState(() {
                                                                                              _model.radioButtonValueController?.value = functions.defineInput();
                                                                                            });
                                                                                          },
                                                                                        ),
                                                                                        onFieldSubmitted: (_) async {
                                                                                          setState(() {
                                                                                            _model.showInputError = false;
                                                                                            _model.showTopError = false;
                                                                                          });
                                                                                        },
                                                                                        autofocus: true,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          hintText: 'Укажите своё значение',
                                                                                          hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                                                                          enabledBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: functions.borderErrorColor(_model.showInputError),
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: Color(0x00000000),
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          errorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: Color(0x00000000),
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: Color(0x00000000),
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          filled: true,
                                                                                          fillColor: FlutterFlowTheme.of(context).lineColor,
                                                                                          contentPadding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                        validator: _model.textController1Validator.asValidator(context),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          30.0,
                                                                          15.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
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
                                                                              width: 14.0,
                                                                              height: 14.0,
                                                                              fit: BoxFit.cover,
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
                                                          if ((quizPage2EditQuizRecord!
                                                                      .type ==
                                                                  'multiselect') &&
                                                              (functions
                                                                      .splitBy(
                                                                          quizPage2EditQuizRecord!
                                                                              .options,
                                                                          '||')
                                                                      .length >
                                                                  0))
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Stack(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          1.0),
                                                                  children: [
                                                                    FlutterFlowCheckboxGroup(
                                                                      options: functions
                                                                          .addSelectsCustomInput(functions
                                                                              .splitBy(quizPage2EditQuizRecord!.options, '||')
                                                                              .toList())
                                                                          .toList(),
                                                                      onChanged:
                                                                          (val) async {
                                                                        setState(() =>
                                                                            _model.checkboxGroupValues =
                                                                                val);
                                                                        setState(
                                                                            () {
                                                                          _model.showInputError =
                                                                              false;
                                                                          _model.showTopError =
                                                                              false;
                                                                        });
                                                                      },
                                                                      controller: _model
                                                                              .checkboxGroupValueController ??=
                                                                          FormFieldController<
                                                                              List<String>>(
                                                                        functions.setInitialCheckbox(
                                                                            columnOrdersRecord.quiz,
                                                                            quizPage2EditQuizRecord!.title),
                                                                      ),
                                                                      activeColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      checkColor:
                                                                          Colors
                                                                              .white,
                                                                      checkboxBorderColor:
                                                                          Color(
                                                                              0xFF95A1AC),
                                                                      textStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMedium,
                                                                      itemPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                                      initialized:
                                                                          _model.checkboxGroupValues !=
                                                                              null,
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            30.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              50.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.05),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              child: TextFormField(
                                                                                controller: _model.textController2 ??= TextEditingController(
                                                                                  text: functions.setInitialCheckboxInput(columnOrdersRecord.quiz, quizPage2EditQuizRecord!.title),
                                                                                ),
                                                                                onChanged: (_) => EasyDebounce.debounce(
                                                                                  '_model.textController2',
                                                                                  Duration(milliseconds: 10),
                                                                                  () async {
                                                                                    setState(() {
                                                                                      _model.showInputError = false;
                                                                                      _model.showTopError = false;
                                                                                    });
                                                                                  },
                                                                                ),
                                                                                onFieldSubmitted: (_) async {
                                                                                  setState(() {
                                                                                    _model.showInputError = false;
                                                                                    _model.showTopError = false;
                                                                                  });
                                                                                },
                                                                                autofocus: true,
                                                                                obscureText: false,
                                                                                decoration: InputDecoration(
                                                                                  hintText: 'Укажите своё значение',
                                                                                  hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                                                                  enabledBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: functions.borderErrorColor(_model.showInputError),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                  focusedBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                  errorBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                  filled: true,
                                                                                  fillColor: Color(0xFFE0E3E7),
                                                                                  contentPadding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                validator: _model.textController2Validator.asValidator(context),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          30.0,
                                                                          15.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
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
                                                                              width: 14.0,
                                                                              height: 14.0,
                                                                              fit: BoxFit.cover,
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
                                                    if ((quizPage2EditQuizRecord!
                                                                .type !=
                                                            'select') &&
                                                        (quizPage2EditQuizRecord!
                                                                .type !=
                                                            'multiselect'))
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child:
                                                                  AuthUserStreamWidget(
                                                                builder:
                                                                    (context) =>
                                                                        TextFormField(
                                                                  controller: _model
                                                                          .formTextController ??=
                                                                      TextEditingController(
                                                                    text: functions.inputFromUserFields(
                                                                        quizPage2EditQuizRecord!
                                                                            .input,
                                                                        valueOrDefault(
                                                                            currentUserDocument
                                                                                ?.mdSeptic,
                                                                            ''),
                                                                        valueOrDefault(
                                                                            currentUserDocument
                                                                                ?.mdArea,
                                                                            ''),
                                                                        valueOrDefault(
                                                                            currentUserDocument
                                                                                ?.mdType,
                                                                            ''),
                                                                        columnOrdersRecord
                                                                            .quiz,
                                                                        quizPage2EditQuizRecord!
                                                                            .title),
                                                                  ),
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.formTextController',
                                                                    Duration(
                                                                        milliseconds:
                                                                            10),
                                                                    () async {
                                                                      setState(
                                                                          () {
                                                                        _model.showInputError =
                                                                            false;
                                                                        _model.showTopError =
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
                                                                      _model.showTopError =
                                                                          false;
                                                                    });
                                                                  },
                                                                  autofocus:
                                                                      true,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    hintText:
                                                                        'Укажите свое значение',
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall,
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: functions
                                                                            .borderErrorColor(_model.showInputError),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .lineColor,
                                                                    contentPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                  validator: _model
                                                                      .formTextControllerValidator
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
                                                                      0.0, 0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
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
                                                                      child: SvgPicture
                                                                          .asset(
                                                                        'assets/images/confirm.svg',
                                                                        width:
                                                                            14.0,
                                                                        height:
                                                                            14.0,
                                                                        fit: BoxFit
                                                                            .cover,
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
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
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
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  18.0, 0.0, 18.0, 20.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (quizPage2EditQuizRecord!.type ==
                                      'select') {
                                    if (_model.radioButtonValue != null &&
                                        _model.radioButtonValue != '') {
                                      if (_model.radioButtonValue == 'input') {
                                        if (_model.textController1.text !=
                                                null &&
                                            _model.textController1.text != '') {
                                          final ordersUpdateData1 =
                                              createOrdersRecordData(
                                            quiz: functions
                                                .quizPage2updateLocalValRadio(
                                                    _model.radioButtonValue!,
                                                    quizPage2EditQuizRecord!
                                                        .title,
                                                    quizPage2EditQuizRecord!
                                                        .reference,
                                                    columnOrdersRecord.quiz,
                                                    _model
                                                        .textController1.text),
                                          );
                                          await FFAppState()
                                              .currentOrder!
                                              .update(ordersUpdateData1);
                                        } else {
                                          setState(() {
                                            _model.showInputError = true;
                                          });
                                          return;
                                        }
                                      } else {
                                        final ordersUpdateData2 =
                                            createOrdersRecordData(
                                          quiz: functions
                                              .quizPage2updateLocalValRadio(
                                                  _model.radioButtonValue!,
                                                  quizPage2EditQuizRecord!
                                                      .title,
                                                  quizPage2EditQuizRecord!
                                                      .reference,
                                                  columnOrdersRecord.quiz,
                                                  _model.textController1.text),
                                        );
                                        await FFAppState()
                                            .currentOrder!
                                            .update(ordersUpdateData2);
                                      }
                                    } else {
                                      setState(() {
                                        _model.showTopError = true;
                                      });
                                      return;
                                    }
                                  } else {
                                    if (quizPage2EditQuizRecord!.type ==
                                        'multiselect') {
                                      if (_model.checkboxGroupValues?.length !=
                                          null) {
                                        if (functions.isCheckboxHaveInput(_model
                                            .checkboxGroupValues
                                            ?.toList())) {
                                          if (_model.textController2.text !=
                                                  null &&
                                              _model.textController2.text !=
                                                  '') {
                                            final ordersUpdateData3 =
                                                createOrdersRecordData(
                                              quiz: functions
                                                  .quizPage2updateLocalValCheckbox(
                                                      columnOrdersRecord.quiz,
                                                      _model
                                                          .textController2.text,
                                                      _model
                                                          .checkboxGroupValues!
                                                          .toList(),
                                                      quizPage2EditQuizRecord!
                                                          .reference,
                                                      quizPage2EditQuizRecord!
                                                          .title),
                                            );
                                            await columnOrdersRecord.reference
                                                .update(ordersUpdateData3);
                                          } else {
                                            setState(() {
                                              _model.showInputError = true;
                                            });
                                            return;
                                          }
                                        } else {
                                          final ordersUpdateData4 =
                                              createOrdersRecordData(
                                            quiz:
                                                functions
                                                    .quizPage2updateLocalValCheckbox(
                                                        columnOrdersRecord.quiz,
                                                        _model.textController2
                                                            .text,
                                                        _model
                                                            .checkboxGroupValues!
                                                            .toList(),
                                                        quizPage2EditQuizRecord!
                                                            .reference,
                                                        quizPage2EditQuizRecord!
                                                            .title),
                                          );
                                          await columnOrdersRecord.reference
                                              .update(ordersUpdateData4);
                                        }
                                      } else {
                                        setState(() {
                                          _model.showTopError = true;
                                        });
                                        return;
                                      }
                                    } else {
                                      if (_model.formTextController.text !=
                                              null &&
                                          _model.formTextController.text !=
                                              '') {
                                        final ordersUpdateData5 =
                                            createOrdersRecordData(
                                          quiz: functions
                                              .quizPage2updateLocalValInput(
                                                  columnOrdersRecord.quiz,
                                                  _model
                                                      .formTextController.text,
                                                  quizPage2EditQuizRecord!
                                                      .title,
                                                  quizPage2EditQuizRecord!
                                                      .reference),
                                        );
                                        await columnOrdersRecord.reference
                                            .update(ordersUpdateData5);
                                      } else {
                                        setState(() {
                                          _model.showInputError = true;
                                        });
                                        return;
                                      }
                                    }
                                  }

                                  setState(() {
                                    FFAppState().currentQuizIndex =
                                        FFAppState().currentQuizIndex + 1;
                                  });

                                  context.pushNamed('QuizSendOrder');
                                },
                                text: 'Сохранить',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 48.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Fira Sans',
                                        color: Colors.white,
                                      ),
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
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
