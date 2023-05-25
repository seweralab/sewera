import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quiz_radio_model.dart';
export 'quiz_radio_model.dart';

class QuizRadioWidget extends StatefulWidget {
  const QuizRadioWidget({
    Key? key,
    this.selects,
    this.quizJSON,
    this.quizName,
    this.quizType,
  }) : super(key: key);

  final List<String>? selects;
  final String? quizJSON;
  final String? quizName;
  final String? quizType;

  @override
  _QuizRadioWidgetState createState() => _QuizRadioWidgetState();
}

class _QuizRadioWidgetState extends State<QuizRadioWidget> {
  late QuizRadioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizRadioModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.quizType == 'select') {
        setState(() {
          FFAppState().currentRadioQuiz = functions.currentQuizRadioToAppState(
              widget.quizJSON, widget.quizName)!;
          FFAppState().currentQuizRadioInput = functions.setInitialRadioInput(
              widget.quizJSON!, widget.quizName!)!;
        });
      } else {
        return;
      }
    });

    _model.textController ??=
        TextEditingController(text: FFAppState().currentQuizRadioInput);
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Builder(
            builder: (context) {
              final radios = widget.selects?.toList() ?? [];
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(radios.length, (radiosIndex) {
                    final radiosItem = radios[radiosIndex];
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 10.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                FFAppState().currentRadioQuiz = radiosItem;
                                FFAppState().currentQuizTopErr = false;
                              });
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    if (radiosItem !=
                                        FFAppState().currentRadioQuiz)
                                      SvgPicture.asset(
                                        'assets/images/radio_clear.svg',
                                        width: 24.0,
                                        height: 24.0,
                                        fit: BoxFit.cover,
                                      ),
                                    if (radiosItem ==
                                        FFAppState().currentRadioQuiz)
                                      SvgPicture.asset(
                                        'assets/images/radio_check.svg',
                                        width: 24.0,
                                        height: 24.0,
                                        fit: BoxFit.cover,
                                      ),
                                  ],
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 5.0, 0.0, 5.0),
                                    child: AutoSizeText(
                                      radiosItem,
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                setState(() {
                  FFAppState().currentRadioQuiz = 'input';
                  FFAppState().currentQuizTopErr = false;
                });
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      if (FFAppState().currentRadioQuiz != 'input')
                        SvgPicture.asset(
                          'assets/images/radio_clear.svg',
                          width: 24.0,
                          height: 24.0,
                          fit: BoxFit.cover,
                        ),
                      if (FFAppState().currentRadioQuiz == 'input')
                        SvgPicture.asset(
                          'assets/images/radio_check.svg',
                          width: 24.0,
                          height: 24.0,
                          fit: BoxFit.cover,
                        ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                      child: TextFormField(
                        controller: _model.textController,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController',
                          Duration(milliseconds: 100),
                          () async {
                            setState(() {
                              FFAppState().currentQuizRadioInput =
                                  _model.textController.text;
                              FFAppState().currentQuizRadieInputErr = false;
                              FFAppState().currentRadioQuiz = 'input';
                              FFAppState().currentQuizTopErr = false;
                            });
                          },
                        ),
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Другое',
                          hintStyle: FlutterFlowTheme.of(context).bodySmall,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: functions.borderErrorColor(
                                  FFAppState().currentQuizRadieInputErr),
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
                          fillColor: Color(0xFFF3F4F5),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (FFAppState().currentQuizRadieInputErr == true)
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(45.0, 0.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                      child: SvgPicture.asset(
                        'assets/images/confirm.svg',
                        width: 14.0,
                        height: 14.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                      child: Text(
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
    );
  }
}
