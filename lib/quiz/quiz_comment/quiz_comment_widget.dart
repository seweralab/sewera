import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/widgets/close_quiz/close_quiz_widget.dart';
import '/widgets/top_notification/top_notification_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'quiz_comment_model.dart';
export 'quiz_comment_model.dart';

class QuizCommentWidget extends StatefulWidget {
  const QuizCommentWidget({
    Key? key,
    this.customServiceName,
  }) : super(key: key);

  final String? customServiceName;

  @override
  _QuizCommentWidgetState createState() => _QuizCommentWidgetState();
}

class _QuizCommentWidgetState extends State<QuizCommentWidget> {
  late QuizCommentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizCommentModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<OrdersRecord>(
      future: (_model.documentRequestCompleter ??= Completer<OrdersRecord>()
            ..complete(
                OrdersRecord.getDocumentOnce(FFAppState().currentOrder!)))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: CircularProgressIndicator(
                  color: FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        final quizCommentOrdersRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
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
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                18.0, 16.0, 18.0, 14.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.goNamed('QuizSelectAddr');
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
                                        child: Icon(
                                          Icons.arrow_back_sharp,
                                          color: Colors.black,
                                          size: 24.0,
                                        ),
                                      ),
                                      Text(
                                        'Остались пожелания?',
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
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () =>
                                                  FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode),
                                              child: Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: Scaffold(
                                                  body: GestureDetector(
                                                    onTap: () =>
                                                        Navigator.pop(context),
                                                  ),
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  bottomSheet: Container(
                                                    color: Colors.transparent,
                                                    child: CloseQuizWidget(),
                                                  ),
                                                ),
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                18.0, 0.0, 18.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF3F4F5),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 16.0),
                                        child: TextFormField(
                                          controller: _model.textController ??=
                                              TextEditingController(
                                            text:
                                                quizCommentOrdersRecord.comment,
                                          ),
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText:
                                                'Важные вещи о заказе, которые следует знать исполнителю',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall,
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          maxLines: 6,
                                          validator: _model
                                              .textControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: Text(
                                        'Загрузите фото, которые помогут нам понять в чем проблема',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Fira Sans',
                                              color: Color(0xFF586A74),
                                              fontSize: 14.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Builder(
                                        builder: (context) {
                                          final mdPhotosEdit = functions
                                              .propImagesList(
                                                  quizCommentOrdersRecord.photos
                                                      .toList())
                                              .toList();
                                          return GridView.builder(
                                            padding: EdgeInsets.zero,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              crossAxisSpacing: 10.0,
                                              mainAxisSpacing: 10.0,
                                              childAspectRatio: 1.0,
                                            ),
                                            primary: false,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: mdPhotosEdit.length,
                                            itemBuilder:
                                                (context, mdPhotosEditIndex) {
                                              final mdPhotosEditItem =
                                                  mdPhotosEdit[
                                                      mdPhotosEditIndex];
                                              return Container(
                                                width: 90.0,
                                                child: Stack(
                                                  children: [
                                                    if (mdPhotosEditItem !=
                                                            null &&
                                                        mdPhotosEditItem != '')
                                                      Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 0.0,
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Stack(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            4.0,
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
                                                                    await Navigator
                                                                        .push(
                                                                      context,
                                                                      PageTransition(
                                                                        type: PageTransitionType
                                                                            .fade,
                                                                        child:
                                                                            FlutterFlowExpandedImageView(
                                                                          image:
                                                                              CachedNetworkImage(
                                                                            imageUrl:
                                                                                mdPhotosEditItem,
                                                                            fit:
                                                                                BoxFit.contain,
                                                                          ),
                                                                          allowRotation:
                                                                              false,
                                                                          tag:
                                                                              mdPhotosEditItem,
                                                                          useHeroAnimation:
                                                                              true,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  child: Hero(
                                                                    tag:
                                                                        mdPhotosEditItem,
                                                                    transitionOnUserGestures:
                                                                        true,
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        imageUrl:
                                                                            mdPhotosEditItem,
                                                                        width:
                                                                            100.0,
                                                                        height:
                                                                            100.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        -1.0),
                                                                child: Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation:
                                                                      4.0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            9.0),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    width: 18.0,
                                                                    height:
                                                                        18.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBtnText,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              9.0),
                                                                    ),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await quizCommentOrdersRecord
                                                                            .reference
                                                                            .update({
                                                                          'photos':
                                                                              FieldValue.arrayRemove([
                                                                            mdPhotosEditItem
                                                                          ]),
                                                                        });
                                                                        setState(() =>
                                                                            _model.documentRequestCompleter =
                                                                                null);
                                                                        await _model
                                                                            .waitForDocumentRequestCompleted();
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .close_sharp,
                                                                        color: Colors
                                                                            .black,
                                                                        size:
                                                                            10.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    if (mdPhotosEditItem ==
                                                            null ||
                                                        mdPhotosEditItem == '')
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    4.0,
                                                                    0.0),
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
                                                            final selectedMedia =
                                                                await selectMediaWithSourceBottomSheet(
                                                              context: context,
                                                              imageQuality: 40,
                                                              allowPhoto: true,
                                                            );
                                                            if (selectedMedia !=
                                                                    null &&
                                                                selectedMedia.every((m) =>
                                                                    validateFileFormat(
                                                                        m.storagePath,
                                                                        context))) {
                                                              setState(() =>
                                                                  _model.isDataUploading =
                                                                      true);
                                                              var selectedUploadedFiles =
                                                                  <FFUploadedFile>[];
                                                              var downloadUrls =
                                                                  <String>[];
                                                              try {
                                                                selectedUploadedFiles =
                                                                    selectedMedia
                                                                        .map((m) =>
                                                                            FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                            ))
                                                                        .toList();

                                                                downloadUrls = (await Future
                                                                        .wait(
                                                                  selectedMedia
                                                                      .map(
                                                                    (m) async =>
                                                                        await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                  ),
                                                                ))
                                                                    .where((u) =>
                                                                        u !=
                                                                        null)
                                                                    .map((u) =>
                                                                        u!)
                                                                    .toList();
                                                              } finally {
                                                                _model.isDataUploading =
                                                                    false;
                                                              }
                                                              if (selectedUploadedFiles
                                                                          .length ==
                                                                      selectedMedia
                                                                          .length &&
                                                                  downloadUrls
                                                                          .length ==
                                                                      selectedMedia
                                                                          .length) {
                                                                setState(() {
                                                                  _model.uploadedLocalFile =
                                                                      selectedUploadedFiles
                                                                          .first;
                                                                  _model.uploadedFileUrl =
                                                                      downloadUrls
                                                                          .first;
                                                                });
                                                              } else {
                                                                setState(() {});
                                                                return;
                                                              }
                                                            }

                                                            await quizCommentOrdersRecord
                                                                .reference
                                                                .update({
                                                              'photos': FieldValue
                                                                  .arrayUnion([
                                                                _model
                                                                    .uploadedFileUrl
                                                              ]),
                                                            });
                                                            setState(() => _model
                                                                    .documentRequestCompleter =
                                                                null);
                                                            await _model
                                                                .waitForDocumentRequestCompleted();
                                                          },
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 0.0,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 100.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: Image
                                                                      .asset(
                                                                    'assets/images/attach.png',
                                                                  ).image,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                shape: BoxShape
                                                                    .rectangle,
                                                              ),
                                                            ),
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
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 30.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await quizCommentOrdersRecord.reference
                          .update(createOrdersRecordData(
                        comment: _model.textController.text,
                      ));

                      context.goNamed('QuizSendOrder');
                    },
                    text: 'Продолжить',
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
          ),
        );
      },
    );
  }
}
