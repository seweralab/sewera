import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/top_notification/top_notification_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page2_model.dart';
export 'home_page2_model.dart';

class HomePage2Widget extends StatefulWidget {
  const HomePage2Widget({Key? key}) : super(key: key);

  @override
  _HomePage2WidgetState createState() => _HomePage2WidgetState();
}

class _HomePage2WidgetState extends State<HomePage2Widget> {
  late HomePage2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePage2Model());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
                      child: wrapWithModel(
                        model: _model.topNotificationModel,
                        updateCallback: () => setState(() {}),
                        child: TopNotificationWidget(
                          isDisbaledHome: true,
                          isDisabledNotification: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(18.0, 10.0, 18.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 51.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFF3F4F5),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.goNamed('SearchPage');
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Найти услугу в каталоге',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Fira Sans',
                                        color: Color(0xB3102938),
                                        fontSize: 14.0,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 13.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: SvgPicture.asset(
                                    'assets/images/Vector_(1).svg',
                                    width: 18.0,
                                    height: 18.0,
                                    fit: BoxFit.cover,
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
                          EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: FutureBuilder<List<OrdersRecord>>(
                        future: (_model.firestoreRequestCompleter ??=
                                Completer<List<OrdersRecord>>()
                                  ..complete(queryOrdersRecordOnce(
                                    queryBuilder: (ordersRecord) => ordersRecord
                                        .where('client',
                                            isEqualTo: currentUserReference)
                                        .where('status',
                                            isEqualTo: 'Не оформлен')
                                        .orderBy('order_date',
                                            descending: true),
                                    limit: 5,
                                  )))
                            .future,
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
                          List<OrdersRecord> unformordersOrdersRecordList =
                              snapshot.data!;
                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Visibility(
                              visible: unformordersOrdersRecordList.length > 0,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          18.0, 0.0, 18.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Вы не окончили оформление заказа',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Fira Sans',
                                                  color: Color(0xFF586A74),
                                                  fontSize: 12.0,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 0.0, 0.0, 2.0),
                                            child: Text(
                                              '●',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Fira Sans',
                                                        color:
                                                            Color(0xFFEB5757),
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 1.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE8EAEC),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 34.0),
                                    child: Builder(
                                      builder: (context) {
                                        final unformed =
                                            unformordersOrdersRecordList
                                                .toList();
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              unformed.length, (unformedIndex) {
                                            final unformedItem =
                                                unformed[unformedIndex];
                                            return Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(2.0, 0.0,
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
                                                        setState(() {
                                                          FFAppState()
                                                              .currentQuizIndex = 0;
                                                          FFAppState()
                                                                  .currentOrder =
                                                              unformedItem
                                                                  .reference;
                                                        });
                                                        if (unformedItem
                                                                .service !=
                                                            null) {
                                                          if (Navigator.of(
                                                                  context)
                                                              .canPop()) {
                                                            context.pop();
                                                          }
                                                          context.pushNamed(
                                                            'QuizPage2',
                                                            queryParameters: {
                                                              'serviceRef':
                                                                  serializeParam(
                                                                unformedItem
                                                                    .service,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        } else {
                                                          if (Navigator.of(
                                                                  context)
                                                              .canPop()) {
                                                            context.pop();
                                                          }
                                                          context.pushNamed(
                                                            'QuizNoService',
                                                            queryParameters: {
                                                              'customServiceName':
                                                                  serializeParam(
                                                                unformedItem
                                                                    .servicename,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        }
                                                      },
                                                      child: Slidable(
                                                        endActionPane:
                                                            ActionPane(
                                                          motion:
                                                              const ScrollMotion(),
                                                          extentRatio: 0.25,
                                                          children: [
                                                            SlidableAction(
                                                              // label: 'null',
                                                              backgroundColor:
                                                                  Color(
                                                                      0xFFF3F4F5),
                                                              icon:
                                                                  Icons.delete,
                                                              onPressed:
                                                                  (_) async {
                                                                await unformedItem
                                                                    .reference
                                                                    .delete();
                                                                setState(() =>
                                                                    _model.firestoreRequestCompleter =
                                                                        null);
                                                                await _model
                                                                    .waitForFirestoreRequestCompleted();
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                        child: ListTile(
                                                          title: Text(
                                                            unformedItem
                                                                .servicename,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Fira Sans',
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                          trailing: Icon(
                                                            Icons
                                                                .arrow_forward_ios,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent2,
                                                            size: 20.0,
                                                          ),
                                                          tileColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          dense: false,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 1.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFE8EAEC),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    FutureBuilder<List<CatalogRecord>>(
                      future: queryCatalogRecordOnce(),
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
                        List<CatalogRecord> columnCatalogRecordList =
                            snapshot.data!;
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(
                              columnCatalogRecordList.length, (columnIndex) {
                            final columnCatalogRecord =
                                columnCatalogRecordList[columnIndex];
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      18.0, 0.0, 0.0, 15.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'CatalogItemsPage',
                                        queryParameters: {
                                          'catalog': serializeParam(
                                            columnCatalogRecord.title,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 16.0, 0.0),
                                          child: Image.network(
                                            columnCatalogRecord
                                                .icon.first.downloadURL,
                                            width: 20.0,
                                            height: 20.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text(
                                          columnCatalogRecord.title,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Fira Sans',
                                                fontSize: 17.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                FutureBuilder<List<ServicesRecord>>(
                                  future: queryServicesRecordOnce(
                                    queryBuilder: (servicesRecord) =>
                                        servicesRecord
                                            .where('popular', isEqualTo: true)
                                            .where(
                                                'category',
                                                arrayContains:
                                                    columnCatalogRecord.title)
                                            .orderBy('order'),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 130.0,
                                          height: 160.0,
                                          // child: CircularProgressIndicator(
                                          //   color: FlutterFlowTheme.of(context)
                                          //       .primary,
                                          // ),
                                        ),
                                      );
                                    }
                                    List<ServicesRecord> rowServicesRecordList =
                                        snapshot.data!;
                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: List.generate(
                                            rowServicesRecordList.length,
                                            (rowIndex) {
                                          final rowServicesRecord =
                                              rowServicesRecordList[rowIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 30.0),
                                            child: Container(
                                              width: 150.0,
                                              child: Stack(
                                                alignment: AlignmentDirectional(
                                                    -1.0, -1.0),
                                                children: [
                                                  if (rowServicesRecord.title ==
                                                      functions
                                                          .defineAllServicesText())
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
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
                                                          context.pushNamed(
                                                            'CatalogItemsPage',
                                                            queryParameters: {
                                                              'catalog':
                                                                  serializeParam(
                                                                columnCatalogRecord
                                                                    .title,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Container(
                                                          width: 130.0,
                                                          height: 130.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.2),
                                                                child: Icon(
                                                                  Icons
                                                                      .arrow_forward_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBtnText,
                                                                  size: 51.0,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        18.0),
                                                                child: Text(
                                                                  'Все услуги',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Fira Sans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                        fontSize:
                                                                            12.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (rowServicesRecord.title !=
                                                      functions
                                                          .defineAllServicesText())
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        var _shouldSetState =
                                                            false;
                                                        if (FFAppState()
                                                                .currentOrder ==
                                                            null) {
                                                          var ordersRecordReference =
                                                              OrdersRecord
                                                                  .collection
                                                                  .doc();
                                                          await ordersRecordReference
                                                              .set(
                                                                  createOrdersRecordData(
                                                            status: 'Создан',
                                                            client:
                                                                currentUserReference,
                                                            service:
                                                                rowServicesRecord
                                                                    .reference,
                                                            servicename:
                                                                rowServicesRecord
                                                                    .title,
                                                            orderDate:
                                                                getCurrentTimestamp,
                                                          ));
                                                          _model.newOrder2 = OrdersRecord
                                                              .getDocumentFromData(
                                                                  createOrdersRecordData(
                                                                    status:
                                                                        'Создан',
                                                                    client:
                                                                        currentUserReference,
                                                                    service:
                                                                        rowServicesRecord
                                                                            .reference,
                                                                    servicename:
                                                                        rowServicesRecord
                                                                            .title,
                                                                    orderDate:
                                                                        getCurrentTimestamp,
                                                                  ),
                                                                  ordersRecordReference);
                                                          _shouldSetState =
                                                              true;
                                                          FFAppState()
                                                                  .currentOrder =
                                                              _model.newOrder2!
                                                                  .reference;
                                                          FFAppState()
                                                              .currentQuizIndex = 0;

                                                          context.goNamed(
                                                            'QuizPage2',
                                                            queryParameters: {
                                                              'serviceRef':
                                                                  serializeParam(
                                                                rowServicesRecord
                                                                    .reference,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                            }.withoutNulls,
                                                          );

                                                          if (_shouldSetState)
                                                            setState(() {});
                                                          return;
                                                        }
                                                        if (_shouldSetState)
                                                          setState(() {});
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Stack(
                                                            children: [
                                                              if (rowServicesRecord
                                                                          .img
                                                                          .first
                                                                          .downloadURL !=
                                                                      null &&
                                                                  rowServicesRecord
                                                                          .img
                                                                          .first
                                                                          .downloadURL !=
                                                                      '')
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child:
                                                                      CachedNetworkImage(
                                                                    imageUrl: rowServicesRecord
                                                                        .img
                                                                        .first
                                                                        .downloadURL,
                                                                    width:
                                                                        130.0,
                                                                    height:
                                                                        130.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              if (rowServicesRecord
                                                                          .img
                                                                          .first
                                                                          .downloadURL ==
                                                                      null ||
                                                                  rowServicesRecord
                                                                          .img
                                                                          .first
                                                                          .downloadURL ==
                                                                      '')
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/no_service.png',
                                                                    width:
                                                                        130.0,
                                                                    height:
                                                                        130.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                rowServicesRecord
                                                                    .title,
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
                                                        ],
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }).divide(SizedBox(width: 0.0)),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            );
                          }),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
