import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/top_notification/top_notification_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
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
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePage2Model());
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 46, 0, 0),
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
                        padding: EdgeInsetsDirectional.fromSTEB(18, 10, 18, 0),
                        child: Container(
                          width: double.infinity,
                          height: 51,
                          decoration: BoxDecoration(
                            color: Color(0xFFF3F4F5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('SearchPage');
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 0, 0),
                                  child: Text(
                                    'Найти услугу в каталоге',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Fira Sans',
                                          color: Color(0xB3102938),
                                          fontSize: 14,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 12, 0),
                                  child: Icon(
                                    Icons.search,
                                    color: Color(0xFF526970),
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(18, 16, 18, 16),
                        child: StreamBuilder<List<NotificationsRecord>>(
                          stream: queryNotificationsRecord(
                            queryBuilder: (notificationsRecord) =>
                                notificationsRecord
                                    .where('viewed', isEqualTo: false)
                                    .orderBy('date', descending: true),
                            singleRecord: true,
                          ),
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
                            List<NotificationsRecord>
                                notificationsNotificationsRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final notificationsNotificationsRecord =
                                notificationsNotificationsRecordList.isNotEmpty
                                    ? notificationsNotificationsRecordList.first
                                    : null;
                            return Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.colorNotification(
                                      notificationsNotificationsRecord!.type),
                                  Color(0xFFD0FFA1),
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8, 16, 8, 16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(1, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 16, 0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            final notificationsUpdateData =
                                                createNotificationsRecordData(
                                              viewed: true,
                                            );
                                            await notificationsNotificationsRecord!
                                                .reference
                                                .update(
                                                    notificationsUpdateData);
                                          },
                                          child: Icon(
                                            Icons.close,
                                            color: Colors.black,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(-1, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 0, 16, 0),
                                        child: Text(
                                          notificationsNotificationsRecord!
                                              .text,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ),
                                    if (notificationsNotificationsRecord!
                                            .service !=
                                        null)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 13, 16, 0),
                                        child: FutureBuilder<ServicesRecord>(
                                          future: ServicesRecord.getDocumentOnce(
                                              notificationsNotificationsRecord!
                                                  .service!),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 40,
                                                  height: 40,
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                ),
                                              );
                                            }
                                            final buttonServicesRecord =
                                                snapshot.data!;
                                            return FFButtonWidget(
                                              onPressed: () async {
                                                FFAppState().currentQuizIndex =
                                                    0;

                                                final ordersCreateData =
                                                    createOrdersRecordData(
                                                  status: 'Не оформлен',
                                                  cost: 0,
                                                  client: currentUserReference,
                                                  service:
                                                      notificationsNotificationsRecord!
                                                          .service,
                                                  servicename:
                                                      buttonServicesRecord
                                                          .title,
                                                  orderDate:
                                                      getCurrentTimestamp,
                                                );
                                                var ordersRecordReference =
                                                    OrdersRecord.collection
                                                        .doc();
                                                await ordersRecordReference
                                                    .set(ordersCreateData);
                                                _model.newOrderfromNotificationMainPage =
                                                    OrdersRecord
                                                        .getDocumentFromData(
                                                            ordersCreateData,
                                                            ordersRecordReference);
                                                FFAppState().currentOrder = _model
                                                    .newOrderfromNotificationMainPage!
                                                    .reference;

                                                context.pushNamed('QuizPage2');

                                                setState(() {});
                                              },
                                              text: 'Оставить заявку',
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 40,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(0, 0, 0, 0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Fira Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
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
                      StreamBuilder<List<OrdersRecord>>(
                        stream: queryOrdersRecord(
                          queryBuilder: (ordersRecord) => ordersRecord
                              .where('client', isEqualTo: currentUserReference)
                              .where('status', isEqualTo: 'Не оформлен')
                              .orderBy('order_date', descending: true),
                          limit: 5,
                        ),
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
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          18, 0, 18, 12),
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
                                                  fontSize: 12,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    6, 0, 0, 2),
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
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 1,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE8EAEC),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 24),
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
                                              alignment:
                                                  AlignmentDirectional(0, 1),
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
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
                                                        context.pushNamed(
                                                          'QuizPage2',
                                                          queryParams: {
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
                                                        context.pushNamed(
                                                          'QuizNoService',
                                                          queryParams: {
                                                            'customServiceName':
                                                                serializeParam(
                                                              unformedItem
                                                                  .servicename,
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      }
                                                    },
                                                    child: Slidable(
                                                      endActionPane: ActionPane(
                                                        motion:
                                                            const ScrollMotion(),
                                                        extentRatio: 0.25,
                                                        children: [
                                                          SlidableAction(
                                                            label: 'null',
                                                            backgroundColor:
                                                                Color(
                                                                    0xFFF3F4F5),
                                                            icon: Icons.delete,
                                                            onPressed:
                                                                (_) async {
                                                              await unformedItem
                                                                  .reference
                                                                  .delete();
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
                                                                fontSize: 14,
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
                                                          size: 20,
                                                        ),
                                                        tileColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        dense: false,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 1,
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
                      StreamBuilder<List<CatalogRecord>>(
                        stream: queryCatalogRecord(),
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
                          List<CatalogRecord> columnCatalogRecordList =
                              snapshot.data!;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                                columnCatalogRecordList.length, (columnIndex) {
                              final columnCatalogRecord =
                                  columnCatalogRecordList[columnIndex];
                              return Container(
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
                                          18, 0, 0, 15),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'CatalogItemsPage',
                                            queryParams: {
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 16, 0),
                                              child: Image.network(
                                                columnCatalogRecord
                                                    .icon.first.downloadURL,
                                                width: 20,
                                                height: 20,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Text(
                                              columnCatalogRecord.title,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Fira Sans',
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 190,
                                      constraints: BoxConstraints(
                                        minHeight: 190,
                                        maxHeight: 210,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child:
                                          StreamBuilder<List<ServicesRecord>>(
                                        stream: queryServicesRecord(
                                          queryBuilder: (servicesRecord) =>
                                              servicesRecord
                                                  .where('popular',
                                                      isEqualTo: true)
                                                  .where('category',
                                                      arrayContains:
                                                          columnCatalogRecord
                                                              .title)
                                                  .orderBy('order'),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 40,
                                                height: 40,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                              ),
                                            );
                                          }
                                          List<ServicesRecord>
                                              listViewInnerServicesRecordList =
                                              snapshot.data!;
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                listViewInnerServicesRecordList
                                                    .length,
                                            itemBuilder:
                                                (context, listViewInnerIndex) {
                                              final listViewInnerServicesRecord =
                                                  listViewInnerServicesRecordList[
                                                      listViewInnerIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(4, 0, 0, 0),
                                                child: Container(
                                                  width: 146,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      if (listViewInnerServicesRecord
                                                              .title ==
                                                          functions
                                                              .defineAllServicesText())
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0, -1),
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
                                                              context.pushNamed(
                                                                'CatalogItemsPage',
                                                                queryParams: {
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
                                                              width: 130,
                                                              height: 130,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16),
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
                                                                            0,
                                                                            0.2),
                                                                    child: Icon(
                                                                      Icons
                                                                          .arrow_forward_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBtnText,
                                                                      size: 51,
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            10,
                                                                            0,
                                                                            18),
                                                                    child: Text(
                                                                      'Все услуги',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Fira Sans',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBtnText,
                                                                            fontSize:
                                                                                12,
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
                                                      if (listViewInnerServicesRecord
                                                              .title !=
                                                          functions
                                                              .defineAllServicesText())
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            var _shouldSetState =
                                                                false;
                                                            if (FFAppState()
                                                                    .currentOrder ==
                                                                null) {
                                                              FFAppState()
                                                                  .currentQuizIndex = 0;

                                                              final ordersCreateData =
                                                                  createOrdersRecordData(
                                                                status:
                                                                    'Создан',
                                                                cost: 0,
                                                                client:
                                                                    currentUserReference,
                                                                service:
                                                                    listViewInnerServicesRecord
                                                                        .reference,
                                                                servicename:
                                                                    listViewInnerServicesRecord
                                                                        .title,
                                                                orderDate:
                                                                    getCurrentTimestamp,
                                                                cashback:
                                                                    listViewInnerServicesRecord
                                                                        .cashback,
                                                              );
                                                              var ordersRecordReference =
                                                                  OrdersRecord
                                                                      .collection
                                                                      .doc();
                                                              await ordersRecordReference
                                                                  .set(
                                                                      ordersCreateData);
                                                              _model.newOrder =
                                                                  OrdersRecord.getDocumentFromData(
                                                                      ordersCreateData,
                                                                      ordersRecordReference);
                                                              _shouldSetState =
                                                                  true;
                                                              FFAppState()
                                                                      .currentOrder =
                                                                  _model
                                                                      .newOrder!
                                                                      .reference;

                                                              context.pushNamed(
                                                                'QuizPage2',
                                                                queryParams: {
                                                                  'serviceRef':
                                                                      serializeParam(
                                                                    listViewInnerServicesRecord
                                                                        .reference,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                }.withoutNulls,
                                                              );

                                                              if (_shouldSetState)
                                                                setState(() {});
                                                              return;
                                                            } else {
                                                              if (_shouldSetState)
                                                                setState(() {});
                                                              return;
                                                            }

                                                            if (_shouldSetState)
                                                              setState(() {});
                                                          },
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Stack(
                                                                children: [
                                                                  if (listViewInnerServicesRecord
                                                                              .img
                                                                              .first
                                                                              .downloadURL !=
                                                                          null &&
                                                                      listViewInnerServicesRecord
                                                                              .img
                                                                              .first
                                                                              .downloadURL !=
                                                                          '')
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                      child: Image
                                                                          .network(
                                                                        listViewInnerServicesRecord
                                                                            .img
                                                                            .first
                                                                            .downloadURL,
                                                                        width:
                                                                            130,
                                                                        height:
                                                                            130,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  if (listViewInnerServicesRecord
                                                                              .img
                                                                              .first
                                                                              .downloadURL ==
                                                                          null ||
                                                                      listViewInnerServicesRecord
                                                                              .img
                                                                              .first
                                                                              .downloadURL ==
                                                                          '')
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                      child: Image
                                                                          .asset(
                                                                        'assets/images/no_service.png',
                                                                        width:
                                                                            130,
                                                                        height:
                                                                            130,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1, 0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          8,
                                                                          0,
                                                                          0),
                                                                  child: Text(
                                                                    listViewInnerServicesRecord
                                                                        .title,
                                                                    maxLines: 3,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Fira Sans',
                                                                          fontSize:
                                                                              14,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      if (listViewInnerServicesRecord
                                                              .cashback >
                                                          0)
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1, -1),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        8,
                                                                        0),
                                                            child: Container(
                                                              width: 64,
                                                              decoration:
                                                                  BoxDecoration(
                                                                gradient:
                                                                    LinearGradient(
                                                                  colors: [
                                                                    Color(
                                                                        0xFF7556FE),
                                                                    Color(
                                                                        0xFFFC56C9),
                                                                    Color(
                                                                        0xFFFEC121)
                                                                  ],
                                                                  stops: [
                                                                    0,
                                                                    0.3,
                                                                    1
                                                                  ],
                                                                  begin:
                                                                      AlignmentDirectional(
                                                                          -0.03,
                                                                          -1),
                                                                  end:
                                                                      AlignmentDirectional(
                                                                          0.03,
                                                                          1),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          8),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          8),
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            5,
                                                                            8,
                                                                            5),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              2,
                                                                              0),
                                                                      child: SvgPicture
                                                                          .asset(
                                                                        'assets/images/Union.svg',
                                                                        width:
                                                                            12,
                                                                        height:
                                                                            12,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      listViewInnerServicesRecord
                                                                          .cashback
                                                                          .toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Fira Sans',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBtnText,
                                                                            fontWeight:
                                                                                FontWeight.w800,
                                                                            fontStyle:
                                                                                FontStyle.italic,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      '%',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Fira Sans',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBtnText,
                                                                            fontWeight:
                                                                                FontWeight.w800,
                                                                            fontStyle:
                                                                                FontStyle.italic,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
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
      ),
    );
  }
}
