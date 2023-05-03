import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/widgets/close_quiz/close_quiz_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quiz_form_model.dart';
export 'quiz_form_model.dart';

class QuizFormWidget extends StatefulWidget {
  const QuizFormWidget({
    Key? key,
    this.index,
    this.ref,
    int? total,
    this.order,
  })  : this.total = total ?? 0,
        super(key: key);

  final int? index;
  final DocumentReference? ref;
  final int total;
  final DocumentReference? order;

  @override
  _QuizFormWidgetState createState() => _QuizFormWidgetState();
}

class _QuizFormWidgetState extends State<QuizFormWidget> {
  late QuizFormModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizFormModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.showTopError = false;
        _model.showInputError = false;
        _model.localVal = '';
      });
    });

    _model.textController1 ??= TextEditingController();
    _model.textController2 ??= TextEditingController();
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
      child: StreamBuilder<QuizRecord>(
        stream: QuizRecord.getDocument(widget.ref!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  color: FlutterFlowTheme.of(context).primary,
                ),
              ),
            );
          }
          final containerSelectQuizRecord = snapshot.data!;
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: StreamBuilder<OrdersRecord>(
              stream: OrdersRecord.getDocument(FFAppState().currentOrder!),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
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
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 1.0,
                            child: Stack(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 32.0, 0.0, 32.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (FFAppState().currentQuizIndex > 0)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 18.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  setState(() {
                                                    FFAppState()
                                                            .currentQuizIndex =
                                                        FFAppState()
                                                                .currentQuizIndex +
                                                            -1;
                                                  });
                                                  context.safePop();
                                                },
                                                child: Icon(
                                                  Icons.arrow_back_sharp,
                                                  color: Colors.black,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.7,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: AutoSizeText(
                                              containerSelectQuizRecord.title!,
                                              maxLines: 2,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Fira Sans',
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (bottomSheetContext) {
                                                return Padding(
                                                  padding: MediaQuery.of(
                                                          bottomSheetContext)
                                                      .viewInsets,
                                                  child: CloseQuizWidget(),
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
                                if (_model.showTopError == true)
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          36.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        width: 277.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFFEE83),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 10.0, 8.0, 10.0),
                                          child: Text(
                                            'Нужно выбрать хотя бы один вариант',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Fira Sans',
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
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if ((functions
                                            .splitBy(
                                                containerSelectQuizRecord
                                                    .options,
                                                '||')
                                            .length >
                                        0) &&
                                    (containerSelectQuizRecord.type ==
                                        'select'))
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          child: Stack(
                                            alignment:
                                                AlignmentDirectional(-1.0, 1.0),
                                            children: [
                                              Container(
                                                width: 300.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: FlutterFlowRadioButton(
                                                    options: functions
                                                        .addSelectsCustomInput(
                                                            functions
                                                                .splitBy(
                                                                    containerSelectQuizRecord
                                                                        .options,
                                                                    '||')
                                                                .toList())
                                                        .toList(),
                                                    onChanged: (val) async {
                                                      setState(() {});
                                                      setState(() {
                                                        _model.localVal = functions
                                                            .newCustomFunction(
                                                                _model
                                                                    .radioButtonValue!,
                                                                _model
                                                                    .textController1
                                                                    .text);
                                                        _model.showTopError =
                                                            false;
                                                        _model.showInputError =
                                                            false;
                                                      });
                                                    },
                                                    controller: _model
                                                            .radioButtonValueController ??=
                                                        FormFieldController<
                                                                String>(
                                                            functions.setInitialRadio(
                                                                columnOrdersRecord
                                                                    .quiz!,
                                                                containerSelectQuizRecord
                                                                    .title!)!),
                                                    optionHeight: 50.0,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Fira Sans',
                                                          color: Colors.black,
                                                        ),
                                                    textPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    buttonPosition:
                                                        RadioButtonPosition
                                                            .left,
                                                    direction: Axis.vertical,
                                                    radioButtonColor:
                                                        Color(0xFF00BB67),
                                                    inactiveRadioButtonColor:
                                                        Color(0x8A000000),
                                                    toggleable: false,
                                                    horizontalAlignment:
                                                        WrapAlignment.start,
                                                    verticalAlignment:
                                                        WrapCrossAlignment
                                                            .start,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          30.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.05),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .textController1,
                                                              onChanged: (_) =>
                                                                  EasyDebounce
                                                                      .debounce(
                                                                '_model.textController1',
                                                                Duration(
                                                                    milliseconds:
                                                                        10),
                                                                () async {
                                                                  setState(() {
                                                                    _model.localVal =
                                                                        _model
                                                                            .textController1
                                                                            .text;
                                                                    _model.showInputError =
                                                                        false;
                                                                  });
                                                                  setState(() {
                                                                    _model.radioButtonValueController
                                                                            ?.value =
                                                                        functions
                                                                            .defineInput();
                                                                  });
                                                                },
                                                              ),
                                                              onFieldSubmitted:
                                                                  (_) async {
                                                                setState(() {
                                                                  _model.localVal =
                                                                      _model
                                                                          .textController1
                                                                          .text;
                                                                  _model.showInputError =
                                                                      false;
                                                                });
                                                                setState(() {
                                                                  _model.radioButtonValueController
                                                                          ?.value =
                                                                      functions
                                                                          .defineInput();
                                                                });
                                                              },
                                                              autofocus: true,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    'Укажите своё значение',
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall,
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: functions
                                                                        .borderErrorColor(
                                                                            _model.showInputError!),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0x00000000),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0x00000000),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0x00000000),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                filled: true,
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .lineColor,
                                                                contentPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                              validator: _model
                                                                  .textController1Validator
                                                                  .asValidator(
                                                                      context),
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
                                      if (_model.showInputError == true)
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30.0, 15.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 1.0, 0.0, 0.0),
                                                  child: SvgPicture.asset(
                                                    'assets/images/confirm.svg',
                                                    width: 14.0,
                                                    height: 14.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Это поле нужно заполнить',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Fira Sans',
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
                                if ((containerSelectQuizRecord.type ==
                                        'multiselect') &&
                                    (functions
                                            .splitBy(
                                                containerSelectQuizRecord
                                                    .options,
                                                '||')
                                            .length >
                                        0))
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Stack(
                                        alignment:
                                            AlignmentDirectional(-1.0, 1.0),
                                        children: [
                                          FlutterFlowCheckboxGroup(
                                            options: functions
                                                .addSelectsCustomInput(functions
                                                    .splitBy(
                                                        containerSelectQuizRecord
                                                            .options,
                                                        '||')
                                                    .toList())
                                                .toList(),
                                            onChanged: (val) async {
                                              setState(() => _model
                                                  .checkboxGroupValues = val);
                                              setState(() {
                                                _model.localVal = functions
                                                    .updateLocalValbyInputAndCheckboxes(
                                                        _model
                                                            .checkboxGroupValues!
                                                            .toList(),
                                                        _model.textController2
                                                            .text);
                                                _model.showTopError = false;
                                                _model.showInputError = false;
                                              });
                                            },
                                            controller: _model
                                                    .checkboxGroupValueController ??=
                                                FormFieldController<
                                                    List<String>>(
                                              [],
                                            ),
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            checkColor: Colors.white,
                                            checkboxBorderColor:
                                                Color(0xFF95A1AC),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium,
                                            itemPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 10.0),
                                            initialized:
                                                _model.checkboxGroupValues !=
                                                    null,
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      30.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.05),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .textController2,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.textController2',
                                                        Duration(
                                                            milliseconds: 10),
                                                        () async {
                                                          setState(() {
                                                            _model.localVal = functions
                                                                .updateLocalValbyInputAndCheckboxes(
                                                                    _model
                                                                        .checkboxGroupValues!
                                                                        .toList(),
                                                                    _model
                                                                        .textController2
                                                                        .text);
                                                            _model.showInputError =
                                                                false;
                                                          });
                                                        },
                                                      ),
                                                      onFieldSubmitted:
                                                          (_) async {
                                                        setState(() {
                                                          _model.localVal =
                                                              functions.updateLocalValbyInputAndCheckboxes(
                                                                  _model
                                                                      .checkboxGroupValues!
                                                                      .toList(),
                                                                  _model
                                                                      .textController2
                                                                      .text);
                                                          _model.showInputError =
                                                              false;
                                                        });
                                                      },
                                                      autofocus: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            'Укажите своё значение',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: functions
                                                                .borderErrorColor(
                                                                    _model
                                                                        .showInputError!),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            Color(0xFFE0E3E7),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                      validator: _model
                                                          .textController2Validator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      if (_model.showInputError == true)
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30.0, 15.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 1.0, 0.0, 0.0),
                                                  child: SvgPicture.asset(
                                                    'assets/images/confirm.svg',
                                                    width: 14.0,
                                                    height: 14.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Это поле нужно заполнить',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Fira Sans',
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
                          if ((containerSelectQuizRecord.type != 'select') &&
                              (containerSelectQuizRecord.type != 'multiselect'))
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => TextFormField(
                                        controller:
                                            _model.formTextController ??=
                                                TextEditingController(
                                          text: functions.inputFromUserFields(
                                              containerSelectQuizRecord.input!,
                                              valueOrDefault(
                                                  currentUserDocument?.mdSeptic,
                                                  ''),
                                              valueOrDefault(
                                                  currentUserDocument?.mdArea,
                                                  ''),
                                              valueOrDefault(
                                                  currentUserDocument?.mdType,
                                                  ''),
                                              columnOrdersRecord.quiz!,
                                              containerSelectQuizRecord.title!),
                                        ),
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.formTextController',
                                          Duration(milliseconds: 10),
                                          () async {
                                            setState(() {
                                              _model.localVal = _model
                                                  .formTextController.text;
                                              _model.showInputError = false;
                                            });
                                          },
                                        ),
                                        onFieldSubmitted: (_) async {
                                          setState(() {
                                            _model.localVal =
                                                _model.formTextController.text;
                                            _model.showInputError = false;
                                          });
                                        },
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: 'Укажите свое значение',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: functions.borderErrorColor(
                                                  _model.showInputError!),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .lineColor,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        validator: _model
                                            .formTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ),
                                if (_model.showInputError == true)
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 1.0, 0.0, 0.0),
                                            child: SvgPicture.asset(
                                              'assets/images/confirm.svg',
                                              width: 14.0,
                                              height: 14.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Это поле нужно заполнить',
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          setState(() {
                            _model.localVal = functions.newCustomFunction2(
                                containerSelectQuizRecord.type!,
                                _model.formTextController.text,
                                _model.localVal);
                          });
                          if (functions.isFillData(
                              _model.localVal,
                              containerSelectQuizRecord.type!,
                              _model.checkboxGroupValues?.toList(),
                              _model.textController2.text)) {
                            final ordersUpdateData = createOrdersRecordData(
                              quiz: getJsonField(
                                functions.orderQuizUpdate(
                                    getJsonField(
                                      functions.jsonEncodeQuiz(
                                          columnOrdersRecord.quiz!),
                                      r'''$''',
                                    ),
                                    containerSelectQuizRecord.title!,
                                    _model.localVal,
                                    widget.ref!),
                                r'''$''',
                              ).toString(),
                            );
                            await FFAppState()
                                .currentOrder!
                                .update(ordersUpdateData);
                            if (widget.index! <
                                functions.totaldecr(widget.total)) {
                              setState(() {
                                FFAppState().currentQuizIndex =
                                    FFAppState().currentQuizIndex + 1;
                              });
                            } else {
                              context.pushNamed('QuizSelectDate');
                            }
                          } else {
                            if (containerSelectQuizRecord.type == 'input') {
                              setState(() {
                                _model.showInputError = true;
                              });
                            } else {
                              setState(() {
                                _model.showTopError = true;
                              });
                              if (containerSelectQuizRecord.type == 'select') {
                                if (!functions.isSelectsInputErr(
                                    _model.radioButtonValue!,
                                    _model.textController1.text)) {
                                  setState(() {
                                    _model.showInputError = true;
                                  });
                                }
                              } else {
                                if (!functions.isMultiselectsInputErr(
                                    _model.checkboxGroupValues!.toList(),
                                    _model.textController2.text)) {
                                  setState(() {
                                    _model.showInputError = true;
                                  });
                                }
                              }
                            }
                          }
                        },
                        text: 'Продолжить',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 48.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Fira Sans',
                                    color: Colors.white,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
