import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/quiz/quiz_form/quiz_form_widget.dart';
import '/widgets/top_notification/top_notification_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quiz_page_model.dart';
export 'quiz_page_model.dart';

class QuizPageWidget extends StatefulWidget {
  const QuizPageWidget({
    Key? key,
    this.serviceRef,
  }) : super(key: key);

  final DocumentReference? serviceRef;

  @override
  _QuizPageWidgetState createState() => _QuizPageWidgetState();
}

class _QuizPageWidgetState extends State<QuizPageWidget> {
  late QuizPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizPageModel());
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
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.topNotificationModel,
                    updateCallback: () => setState(() {}),
                    child: TopNotificationWidget(),
                  ),
                  FutureBuilder<int>(
                    future: queryQuizRecordCount(
                      parent: widget.serviceRef,
                    ),
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
                      int containerCount = snapshot.data!;
                      return Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: FutureBuilder<List<QuizRecord>>(
                          future: queryQuizRecordOnce(
                            parent: widget.serviceRef,
                            queryBuilder: (quizRecord) =>
                                quizRecord.orderBy('order'),
                          ),
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
                            List<QuizRecord> listViewQuizRecordList =
                                snapshot.data!;
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewQuizRecordList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewQuizRecord =
                                    listViewQuizRecordList[listViewIndex];
                                return Visibility(
                                  visible: FFAppState().currentQuizIndex ==
                                      listViewIndex,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.9,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: wrapWithModel(
                                          model: _model.quizFormModels.getModel(
                                            listViewIndex.toString(),
                                            listViewIndex,
                                          ),
                                          updateCallback: () => setState(() {}),
                                          updateOnChange: true,
                                          child: QuizFormWidget(
                                            key: Key(
                                              'Keywaf_${listViewIndex.toString()}',
                                            ),
                                            index: listViewIndex,
                                            ref: listViewQuizRecord.reference,
                                            total: containerCount,
                                            order: FFAppState().currentOrder,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      );
                    },
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
