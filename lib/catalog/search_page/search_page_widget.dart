import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/top_notification/top_notification_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'search_page_model.dart';
export 'search_page_model.dart';

class SearchPageWidget extends StatefulWidget {
  const SearchPageWidget({Key? key}) : super(key: key);

  @override
  _SearchPageWidgetState createState() => _SearchPageWidgetState();
}

class _SearchPageWidgetState extends State<SearchPageWidget> {
  late SearchPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchPageModel());

    _model.searchFieldController ??= TextEditingController();
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 44, 0, 0),
              child: wrapWithModel(
                model: _model.topNotificationModel,
                updateCallback: () => setState(() {}),
                child: TopNotificationWidget(
                  isDisbaledHome: false,
                  isDisabledNotification: false,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(18, 10, 18, 10),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 18, 0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.safePop();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Color(0xFF586A74),
                          size: 26,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _model.searchFieldController,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.searchFieldController',
                          Duration(milliseconds: 10),
                          () async {
                            setState(() => _model.algoliaSearchResults = null);
                            await ServicesRecord.search(
                              term: _model.searchFieldController.text,
                              useCache: true,
                            )
                                .then((r) => _model.algoliaSearchResults = r)
                                .onError(
                                    (_, __) => _model.algoliaSearchResults = [])
                                .whenComplete(() => setState(() {}));
                          },
                        ),
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Найти услугу в каталоге',
                          hintStyle: FlutterFlowTheme.of(context).bodySmall,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: Color(0xFFF3F4F5),
                          suffixIcon: _model
                                  .searchFieldController!.text.isNotEmpty
                              ? InkWell(
                                  onTap: () async {
                                    _model.searchFieldController?.clear();
                                    setState(() =>
                                        _model.algoliaSearchResults = null);
                                    await ServicesRecord.search(
                                      term: _model.searchFieldController.text,
                                      useCache: true,
                                    )
                                        .then((r) =>
                                            _model.algoliaSearchResults = r)
                                        .onError((_, __) =>
                                            _model.algoliaSearchResults = [])
                                        .whenComplete(() => setState(() {}));

                                    setState(() {});
                                  },
                                  child: Icon(
                                    Icons.clear,
                                    color: Colors.black,
                                    size: 16,
                                  ),
                                )
                              : null,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        validator: _model.searchFieldControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onPanDown: (_) {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                        child: Builder(
                          builder: (context) {
                            if (_model.algoliaSearchResults == null) {
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
                            final searchResults =
                                _model.algoliaSearchResults?.toList() ?? [];
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(searchResults.length,
                                  (searchResultsIndex) {
                                final searchResultsItem =
                                    searchResults[searchResultsIndex];
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 16),
                                        child: Material(
                                          borderRadius: BorderRadius.circular(
                                              40), // Установите радиус закругления
                                          color: Color(0xFFF3F4F5),
                                          child: InkWell(
                                            onTap: () async {
                                              FFAppState().currentQuizIndex = 0;

                                              final ordersCreateData =
                                                  createOrdersRecordData(
                                                status: 'Создан',
                                                cost: 0,
                                                client: currentUserReference,
                                                service:
                                                    searchResultsItem.reference,
                                                servicename:
                                                    searchResultsItem.title,
                                                orderDate: getCurrentTimestamp,
                                                cashback:
                                                    searchResultsItem.cashback,
                                              );
                                              var ordersRecordReference =
                                                  OrdersRecord.collection.doc();
                                              await ordersRecordReference
                                                  .set(ordersCreateData);
                                              _model.newOrder = OrdersRecord
                                                  .getDocumentFromData(
                                                      ordersCreateData,
                                                      ordersRecordReference);
                                              FFAppState().currentOrder =
                                                  _model.newOrder!.reference;

                                              context.pushNamed(
                                                'QuizPage2',
                                                queryParams: {
                                                  'serviceRef': serializeParam(
                                                    searchResultsItem.reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );

                                              setState(() {});
                                            },
                                            borderRadius: BorderRadius.circular(
                                                40), // Установите радиус закругления
                                            splashColor: Colors
                                                .grey, // Установите цвет волны
                                            child: Container(
                                              width: double.infinity,
                                              height: 58,
                                              child: Align(
                                                alignment:
                                                    AlignmentDirectional(-1, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(23, 0, 0, 0),
                                                  child: AutoSizeText(
                                                    searchResultsItem.title,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )),
                                    if (searchResultsIndex ==
                                        functions.totaldecr(_model
                                            .algoliaSearchResults!.length))
                                      Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 16),
                                          child: Material(
                                            borderRadius: BorderRadius.circular(
                                                40), // Установите радиус закругления
                                            color: Color(0xFFF3F4F5),
                                            child: InkWell(
                                              onTap: () async {
                                                context.pushNamed(
                                                  'QuizNoService',
                                                  queryParams: {
                                                    'customServiceName':
                                                        serializeParam(
                                                      _model
                                                          .searchFieldController
                                                          .text,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .rightToLeft,
                                                    ),
                                                  },
                                                );
                                              },
                                              borderRadius: BorderRadius.circular(
                                                  40), // Установите радиус закругления
                                              splashColor: Colors
                                                  .grey, // Установите цвет волны
                                              child: Container(
                                                width: double.infinity,
                                                height: 58,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  23, 0, 0, 0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/noservice.svg',
                                                        width: 24,
                                                        height: 24,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1, 0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(12, 0,
                                                                    0, 0),
                                                        child: Text(
                                                          'Тут нет моей услуги',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )),
                                  ],
                                );
                              }),
                            );
                          },
                        ),
                      ),
                      if ((_model.searchFieldController.text != '') &&
                          (_model.algoliaSearchResults?.length == 0))
                        Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(18, 0, 18, 16),
                            child: Material(
                              borderRadius: BorderRadius.circular(
                                  40), // Установите радиус закругления
                              color: Color(0xFFF3F4F5),
                              child: InkWell(
                                onTap: () async {
                                  context.pushNamed(
                                    'QuizNoService',
                                    queryParams: {
                                      'customServiceName': serializeParam(
                                        _model.searchFieldController.text,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.rightToLeft,
                                      ),
                                    },
                                  );
                                },
                                borderRadius: BorderRadius.circular(
                                    40), // Установите радиус закругления
                                splashColor:
                                    Colors.grey, // Установите цвет волны
                                child: Container(
                                  width: double.infinity,
                                  height: 58,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            23, 0, 0, 0),
                                        child: SvgPicture.asset(
                                          'assets/images/noservice.svg',
                                          width: 24,
                                          height: 24,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 0, 0),
                                          child: Text(
                                            'Тут нет моей услуги',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
