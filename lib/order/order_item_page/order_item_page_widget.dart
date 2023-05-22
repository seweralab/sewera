import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/radio_cashback_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/top_notification/top_notification_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'order_item_page_model.dart';
export 'order_item_page_model.dart';

class OrderItemPageWidget extends StatefulWidget {
  const OrderItemPageWidget({
    Key? key,
    this.order,
  }) : super(key: key);

  final DocumentReference? order;

  @override
  _OrderItemPageWidgetState createState() => _OrderItemPageWidgetState();
}

class _OrderItemPageWidgetState extends State<OrderItemPageWidget> {
  late OrderItemPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderItemPageModel());
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

    return StreamBuilder<OrdersRecord>(
      stream: OrdersRecord.getDocument(widget.order!),
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
        final orderItemPageOrdersRecord = snapshot.data!;
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
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
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Text(
                                          orderItemPageOrdersRecord.servicename,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Fira Sans',
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.black,
                                      size: 24.0,
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
                                  if ((orderItemPageOrdersRecord
                                              .changedFields.length >
                                          0) &&
                                      (_model.showInfoChanged == true))
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 26.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFFEE83),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 12.0, 16.0, 12.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Мы изменили детали заказа.',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Fira Sans',
                                                        fontSize: 14.0,
                                                      ),
                                                ),
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
                                                    setState(() {
                                                      _model.showInfoChanged =
                                                          false;
                                                    });
                                                  },
                                                  child: Icon(
                                                    Icons.close,
                                                    color: Colors.black,
                                                    size: 12.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (orderItemPageOrdersRecord.status ==
                                            'В обработке')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 24.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 8.0, 0.0),
                                                  child: SvgPicture.asset(
                                                    'assets/images/process.svg',
                                                    width: 16.0,
                                                    height: 16.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Text(
                                                  'В обработке',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Fira Sans',
                                                        color:
                                                            Color(0xFF88959C),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        if (orderItemPageOrdersRecord.status ==
                                            'Подтвердите')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 24.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 8.0, 0.0),
                                                  child: SvgPicture.asset(
                                                    'assets/images/confirm.svg',
                                                    width: 16.0,
                                                    height: 16.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Text(
                                                  'Подтвердите заказ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Fira Sans',
                                                        color:
                                                            Color(0xFFFFB306),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        if (orderItemPageOrdersRecord.status ==
                                            'Подтверждён')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 24.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 8.0, 0.0),
                                                  child: SvgPicture.asset(
                                                    'assets/images/confirmed.svg',
                                                    width: 16.0,
                                                    height: 16.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Text(
                                                  'Заказ подтверждён',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Fira Sans',
                                                        color:
                                                            Color(0xFF04AB51),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        if (orderItemPageOrdersRecord.status ==
                                            'Выполнен')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 24.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 8.0, 0.0),
                                                  child: SvgPicture.asset(
                                                    'assets/images/complete.svg',
                                                    width: 16.0,
                                                    height: 16.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Text(
                                                  'Выполнен',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Fira Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        if (orderItemPageOrdersRecord.status ==
                                            'Отменен')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 24.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 8.0, 0.0),
                                                  child: SvgPicture.asset(
                                                    'assets/images/canceled.svg',
                                                    width: 16.0,
                                                    height: 16.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Text(
                                                  'Отменен',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Fira Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  if (orderItemPageOrdersRecord.deadline !=
                                          null &&
                                      orderItemPageOrdersRecord.deadline != '')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 24.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.calendar_today,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 18.0,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    14.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              orderItemPageOrdersRecord
                                                  .deadline,
                                              maxLines: 3,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Fira Sans',
                                                        fontSize: 14.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (orderItemPageOrdersRecord.addr != null &&
                                      orderItemPageOrdersRecord.addr != '')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 24.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.place_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 18.0,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    14.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              orderItemPageOrdersRecord.addr,
                                              maxLines: 3,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Fira Sans',
                                                        fontSize: 14.0,
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
                                18.0, 0.0, 18.0, 24.0),
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
                                18.0, 0.0, 18.0, 12.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  _model.showDetails = valueOrDefault<bool>(
                                    functions.inverseBool(_model.showDetails),
                                    true,
                                  );
                                });
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Детали заказа ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Fira Sans',
                                          fontSize: 14.0,
                                        ),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: Color(0xFF586A74),
                                    size: 24.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (_model.showDetails == true)
                            AnimatedContainer(
                              duration: Duration(milliseconds: 100),
                              curve: Curves.easeOut,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (orderItemPageOrdersRecord.quiz != null &&
                                      orderItemPageOrdersRecord.quiz != '')
                                    Builder(
                                      builder: (context) {
                                        final listDetails = functions
                                            .listQuizItems(
                                                orderItemPageOrdersRecord.quiz)
                                            .map((e) => e)
                                            .toList();
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children:
                                              List.generate(listDetails.length,
                                                  (listDetailsIndex) {
                                            final listDetailsItem =
                                                listDetails[listDetailsIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 8.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: functions
                                                      .orderChangedColor(
                                                          functions.jsonMDecode(
                                                              listDetailsItem,
                                                              'name'),
                                                          orderItemPageOrdersRecord
                                                              .changedFields
                                                              .toList()),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          18.0, 8.0, 18.0, 8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.8,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              functions.jsonMDecode(
                                                                  listDetailsItem,
                                                                  'name'),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Fira Sans',
                                                                    color: Color(
                                                                        0xFF88959C),
                                                                  ),
                                                            ),
                                                            Text(
                                                              functions.jsonMDecode(
                                                                  listDetailsItem,
                                                                  'title'),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      if (functions.isOrderQuizFieldChanged(
                                                              orderItemPageOrdersRecord
                                                                  .changedFields
                                                                  .toList(),
                                                              functions.jsonMDecode(
                                                                  listDetailsItem,
                                                                  'name')) ==
                                                          true)
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        2.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 6.0,
                                                              height: 6.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFFFB306),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 8.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: functions.orderChangedColor(
                                            'deadline',
                                            orderItemPageOrdersRecord
                                                .changedFields
                                                .toList()),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            18.0, 8.0, 18.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.8,
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Когда нужно оказать услугу',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Fira Sans',
                                                          color:
                                                              Color(0xFF88959C),
                                                        ),
                                                  ),
                                                  Text(
                                                    orderItemPageOrdersRecord
                                                        .deadline,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if (functions
                                                    .isOrderQuizFieldChanged(
                                                        orderItemPageOrdersRecord
                                                            .changedFields
                                                            .toList(),
                                                        'deadline') ==
                                                true)
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 2.0, 0.0),
                                                  child: Container(
                                                    width: 6.0,
                                                    height: 6.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFFFB306),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 8.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: functions.orderChangedColor(
                                            'addr',
                                            orderItemPageOrdersRecord
                                                .changedFields
                                                .toList()),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            18.0, 8.0, 18.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.8,
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Адрес',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Fira Sans',
                                                          color:
                                                              Color(0xFF88959C),
                                                        ),
                                                  ),
                                                  Text(
                                                    orderItemPageOrdersRecord
                                                        .addr,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if (functions
                                                    .isOrderQuizFieldChanged(
                                                        orderItemPageOrdersRecord
                                                            .changedFields
                                                            .toList(),
                                                        'addr') ==
                                                true)
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 2.0, 0.0),
                                                  child: Container(
                                                    width: 6.0,
                                                    height: 6.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFFFB306),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (orderItemPageOrdersRecord.description !=
                                          null &&
                                      orderItemPageOrdersRecord.description !=
                                          '')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 8.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: functions.orderChangedColor(
                                              'description',
                                              orderItemPageOrdersRecord
                                                  .changedFields
                                                  .toList()),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  18.0, 8.0, 18.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.8,
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Описание',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Fira Sans',
                                                                color: Color(
                                                                    0xFF88959C),
                                                              ),
                                                    ),
                                                    Text(
                                                      orderItemPageOrdersRecord
                                                          .description,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              if (functions
                                                      .isOrderQuizFieldChanged(
                                                          orderItemPageOrdersRecord
                                                              .changedFields
                                                              .toList(),
                                                          'description') ==
                                                  true)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                2.0, 0.0),
                                                    child: Container(
                                                      width: 6.0,
                                                      height: 6.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFFFB306),
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (orderItemPageOrdersRecord.comment !=
                                          null &&
                                      orderItemPageOrdersRecord.comment != '')
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: functions.orderChangedColor(
                                            'comment',
                                            orderItemPageOrdersRecord
                                                .changedFields
                                                .toList()),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            18.0, 8.0, 18.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.8,
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Пожелания',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Fira Sans',
                                                          color:
                                                              Color(0xFF88959C),
                                                        ),
                                                  ),
                                                  Text(
                                                    orderItemPageOrdersRecord
                                                        .comment,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if (functions
                                                    .isOrderQuizFieldChanged(
                                                        orderItemPageOrdersRecord
                                                            .changedFields
                                                            .toList(),
                                                        'comment') ==
                                                true)
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 2.0, 0.0),
                                                  child: Container(
                                                    width: 6.0,
                                                    height: 6.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFFFB306),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  if (orderItemPageOrdersRecord.photos.length >
                                      0)
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            18.0, 12.0, 18.0, 24.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Фотографии и документы',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Fira Sans',
                                                        color:
                                                            Color(0xFF88959C),
                                                      ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Builder(
                                                  builder: (context) {
                                                    final mdPhotosEdit = functions
                                                        .propImagesList(
                                                            orderItemPageOrdersRecord
                                                                .photos
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
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          mdPhotosEdit.length,
                                                      itemBuilder: (context,
                                                          mdPhotosEditIndex) {
                                                        final mdPhotosEditItem =
                                                            mdPhotosEdit[
                                                                mdPhotosEditIndex];
                                                        return Padding(
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
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await Navigator
                                                                  .push(
                                                                context,
                                                                PageTransition(
                                                                  type:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  child:
                                                                      FlutterFlowExpandedImageView(
                                                                    image: Image
                                                                        .network(
                                                                      mdPhotosEditItem,
                                                                      fit: BoxFit
                                                                          .contain,
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
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  mdPhotosEditItem,
                                                                  width: 100.0,
                                                                  height: 100.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                18.0, 12.0, 18.0, 24.0),
                            child: Container(
                              width: double.infinity,
                              height: 1.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFE8EAEC),
                              ),
                            ),
                          ),
                          if (orderItemPageOrdersRecord.status == 'В обработке')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  18.0, 0.0, 18.0, 24.0),
                              child: Text(
                                'Сейчас заказ обрабатывает менеджер.\n\nКогда заказ обработают, вам придет уведомление. А еще менеджер может связаться с вами для уточнения деталей. ',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          if (orderItemPageOrdersRecord.status == 'Подтверждён')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  18.0, 0.0, 18.0, 18.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
                                    child: Text(
                                      'Сумма: ${functions.calcOrderPrice(orderItemPageOrdersRecord.cost, orderItemPageOrdersRecord.cachbackUsed).toString()} ₽',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Fira Sans',
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if ((orderItemPageOrdersRecord.cost > 0) &&
                              (orderItemPageOrdersRecord.status ==
                                  'Подтвердите'))
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
                                          0.0, 0.0, 0.0, 6.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: Text(
                                              'Сумма: ${_model.radioCashbackModel.localOldPrice > 0 ? _model.radioCashbackModel.localOldPrice.toString() : orderItemPageOrdersRecord.cost.toString()} ₽',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Fira Sans',
                                                        fontSize: 24.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                          if (_model.radioCashbackModel
                                                  .localOldPrice >
                                              0)
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF2FBF6),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 2.0, 10.0, 2.0),
                                                child: Text(
                                                  '${orderItemPageOrdersRecord.cost.toString()} ₽',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Fira Sans',
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                      ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    if (valueOrDefault<bool>(
                                        currentUserDocument?.noOrders, false))
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 12.0),
                                          child: AuthUserStreamWidget(
                                            builder: (context) => Text(
                                              'Минус 10% за первый заказ',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Fira Sans',
                                                    color: Color(0xFF82959C),
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (orderItemPageOrdersRecord.status ==
                                        'Подтвердите')
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          child: Stack(
                                            alignment:
                                                AlignmentDirectional(0.0, -1.0),
                                            children: [
                                              AuthUserStreamWidget(
                                                builder: (context) =>
                                                    wrapWithModel(
                                                  model:
                                                      _model.radioCashbackModel,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  updateOnChange: true,
                                                  child: RadioCashbackWidget(
                                                    cost:
                                                        orderItemPageOrdersRecord
                                                            .cost,
                                                    cashback:
                                                        orderItemPageOrdersRecord
                                                            .cashback,
                                                    radioCashback: functions
                                                        .orderCachbackOptions(
                                                            orderItemPageOrdersRecord
                                                                .cost,
                                                            orderItemPageOrdersRecord
                                                                .cashback,
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.cashback,
                                                                0))
                                                        .first,
                                                  ),
                                                ),
                                              ),
                                              if (orderItemPageOrdersRecord
                                                      .cashback >
                                                  0)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.95, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: 64.0,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Color(0xFF7556FE),
                                                            Color(0xFFFC56C9),
                                                            Color(0xFFFEC121)
                                                          ],
                                                          stops: [
                                                            0.0,
                                                            0.3,
                                                            1.0
                                                          ],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  -0.03, -1.0),
                                                          end:
                                                              AlignmentDirectional(
                                                                  0.03, 1.0),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  0.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  8.0),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    5.0,
                                                                    8.0,
                                                                    5.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          2.0,
                                                                          0.0),
                                                              child: SvgPicture
                                                                  .asset(
                                                                'assets/images/Union.svg',
                                                                width: 12.0,
                                                                height: 12.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Text(
                                                              orderItemPageOrdersRecord
                                                                  .cashback
                                                                  .toString()
                                                                  .maybeHandleOverflow(
                                                                      maxChars:
                                                                          2),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Fira Sans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBtnText,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic,
                                                                  ),
                                                            ),
                                                            Text(
                                                              '%',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Fira Sans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBtnText,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic,
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
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          if (orderItemPageOrdersRecord.status == 'Подтвердите')
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
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
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-0.95, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              'Способ оплаты',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Fira Sans',
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 30.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 90.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF2FBF6),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color: Color(0xFF00BB67),
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 13.0),
                                                  child: SvgPicture.asset(
                                                    'assets/images/fiat.svg',
                                                    width: 23.0,
                                                    height: 17.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Text(
                                                  'Оплата наличными в день заказа',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Fira Sans',
                                                        fontSize: 12.0,
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
                              ],
                            ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (orderItemPageOrdersRecord.status == 'Подтвердите')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                18.0, 0.0, 18.0, 25.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                final ordersUpdateData = {
                                  ...createOrdersRecordData(
                                    status: 'Подтверждён',
                                    cachbackSelect: _model
                                        .radioCashbackModel.localRadioCashback,
                                    cachbackUsed: functions.cashBackUsed(
                                        _model.radioCashbackModel
                                            .localRadioCashback!,
                                        valueOrDefault(
                                            currentUserDocument?.cashback, 0)),
                                  ),
                                  'changed_fields': FieldValue.delete(),
                                };
                                await orderItemPageOrdersRecord.reference
                                    .update(ordersUpdateData);

                                final usersUpdateData = createUsersRecordData(
                                  cashback: functions.cashbackUserUser(
                                      _model.radioCashbackModel
                                          .localRadioCashback!,
                                      valueOrDefault(
                                          currentUserDocument?.cashback, 0),
                                      functions.addcashback(
                                          orderItemPageOrdersRecord.cost,
                                          orderItemPageOrdersRecord.cashback)),
                                );
                                await currentUserReference!
                                    .update(usersUpdateData);

                                context.pushNamed('ordersPage');
                              },
                              text: 'Подтвердите заказ',
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
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        if (orderItemPageOrdersRecord.status == 'Подтвердите')
                          Container(
                            width: double.infinity,
                            height: 8.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFF3F4F5),
                            ),
                          ),
                        if (orderItemPageOrdersRecord.status == 'Подтвердите')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                18.0, 20.0, 18.0, 20.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  'cancelOrderPage',
                                  queryParams: {
                                    'order': serializeParam(
                                      orderItemPageOrdersRecord,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'order': orderItemPageOrdersRecord,
                                  },
                                );
                              },
                              text: 'Отменить заказ',
                              icon: FaIcon(
                                FontAwesomeIcons.trash,
                                color: Color(0xFF586A74),
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 48.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Fira Sans',
                                      color: Color(0xFF586A74),
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
                        if ((orderItemPageOrdersRecord.status == 'Выполнен') ||
                            (orderItemPageOrdersRecord.status == 'Отменен'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                18.0, 0.0, 18.0, 32.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                final ordersCreateData = createOrdersRecordData(
                                  status: 'Не оформлен',
                                  cost: 0,
                                  servicename:
                                      orderItemPageOrdersRecord.servicename,
                                  client: currentUserReference,
                                  quiz: orderItemPageOrdersRecord.quiz,
                                  description:
                                      orderItemPageOrdersRecord.description,
                                  orderDate: getCurrentTimestamp,
                                  service: orderItemPageOrdersRecord.service,
                                );
                                var ordersRecordReference =
                                    OrdersRecord.collection.doc();
                                await ordersRecordReference
                                    .set(ordersCreateData);
                                _model.reorder =
                                    OrdersRecord.getDocumentFromData(
                                        ordersCreateData,
                                        ordersRecordReference);
                                setState(() {
                                  FFAppState().currentOrder =
                                      _model.reorder!.reference;
                                  FFAppState().currentQuizIndex = 0;
                                });

                                context.pushNamed(
                                  'QuizPage2',
                                  queryParams: {
                                    'serviceRef': serializeParam(
                                      orderItemPageOrdersRecord.service,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                );

                                setState(() {});
                              },
                              text: 'Повторить заказ',
                              icon: Icon(
                                Icons.refresh,
                                size: 16.0,
                              ),
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
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              showLoadingIndicator: false,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
