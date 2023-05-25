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
import 'quiz_checkbox_model.dart';
export 'quiz_checkbox_model.dart';

class QuizCheckboxWidget extends StatefulWidget {
  const QuizCheckboxWidget({
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
  _QuizCheckboxWidgetState createState() => _QuizCheckboxWidgetState();
}

class _QuizCheckboxWidgetState extends State<QuizCheckboxWidget> {
  late QuizCheckboxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizCheckboxModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.quizType == 'multiselect') {
        setState(() {
          FFAppState().currentCheckQuiz = functions
              .setInitialCheckbox(widget.quizJSON!, widget.quizName!)!
              .toList();
          FFAppState().currentCheckInputQuiz = functions
              .setInitialCheckboxInput(widget.quizJSON!, widget.quizName!)!;
        });
        setState(() {
          _model.textController?.text = FFAppState().currentCheckInputQuiz;
        });
      }
    });

    _model.textController ??=
        TextEditingController(text: FFAppState().currentCheckInputQuiz);
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
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Builder(
          builder: (context) {
            final radios = widget.selects?.toList() ?? [];
            return ListView.builder(
              padding: EdgeInsets.zero,
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: radios.length,
              itemBuilder: (context, radiosIndex) {
                final radiosItem = radios[radiosIndex];
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (FFAppState()
                              .currentCheckQuiz
                              .contains(radiosItem)) {
                            setState(() {
                              FFAppState()
                                  .removeFromCurrentCheckQuiz(radiosItem);
                            });
                          } else {
                            setState(() {
                              FFAppState().addToCurrentCheckQuiz(radiosItem);
                              FFAppState().currentQuizTopErr = false;
                            });
                          }
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 2.0, 0.0),
                              child: Stack(
                                children: [
                                  if (!FFAppState()
                                      .currentCheckQuiz
                                      .contains(radiosItem))
                                    SvgPicture.asset(
                                      'assets/images/check.svg',
                                      width: 24.0,
                                      height: 24.0,
                                      fit: BoxFit.cover,
                                    ),
                                  if (FFAppState()
                                      .currentCheckQuiz
                                      .contains(radiosItem))
                                    SvgPicture.asset(
                                      'assets/images/check_active.svg',
                                      width: 24.0,
                                      height: 24.0,
                                      fit: BoxFit.cover,
                                    ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
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
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
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
              if (FFAppState()
                  .currentCheckQuiz
                  .contains(functions.defineInput())) {
                setState(() {
                  FFAppState().removeFromCurrentCheckQuiz('input');
                });
              } else {
                setState(() {
                  FFAppState().addToCurrentCheckQuiz('input');
                  FFAppState().currentQuizTopErr = false;
                });
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    if (!FFAppState()
                        .currentCheckQuiz
                        .contains(functions.defineInput()))
                      SvgPicture.asset(
                        'assets/images/check.svg',
                        width: 24.0,
                        height: 24.0,
                        fit: BoxFit.cover,
                      ),
                    if (FFAppState()
                        .currentCheckQuiz
                        .contains(functions.defineInput()))
                      SvgPicture.asset(
                        'assets/images/check_active.svg',
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
                            FFAppState().currentCheckInputQuiz =
                                _model.textController.text;
                            FFAppState().currentCheckInputQuizErr = false;
                            FFAppState().currentQuizTopErr = false;
                          });
                          if (!FFAppState()
                              .currentCheckQuiz
                              .contains(functions.defineInput())) {
                            setState(() {
                              FFAppState().addToCurrentCheckQuiz('input');
                            });
                          }
                        },
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Другое',
                        hintStyle: FlutterFlowTheme.of(context).bodySmall,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: functions.borderErrorColor(
                                FFAppState().currentCheckInputQuizErr),
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
        if (FFAppState().currentCheckInputQuizErr == true)
          Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(45.0, 0.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
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
    );
  }
}
