import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/top_notification/top_notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'profile_page_model.dart';
export 'profile_page_model.dart';
import 'package:appmetrica_plugin/appmetrica_plugin.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({Key? key}) : super(key: key);

  @override
  _ProfilePageWidgetState createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  late ProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    AppMetrica.activate(
        AppMetricaConfig("19fafed6-7366-4d54-8cdb-e1a38da6e996"));
    AppMetrica.reportEvent('openProfilePage');
    super.initState();
    _model = createModel(context, () => ProfilePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 44, 0, 0),
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(18, 18, 18, 0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Stack(
                                        children: [
                                          if (valueOrDefault(
                                                  currentUserDocument?.photo,
                                                  '') ==
                                              '')
                                            AuthUserStreamWidget(
                                              builder: (context) => ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.asset(
                                                  'assets/images/no-photo.png',
                                                  width: 48,
                                                  height: 48,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          if (valueOrDefault(
                                                  currentUserDocument?.photo,
                                                  '') !=
                                              '')
                                            AuthUserStreamWidget(
                                              builder: (context) => InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await Navigator.push(
                                                    context,
                                                    PageTransition(
                                                      type: PageTransitionType
                                                          .fade,
                                                      child:
                                                          FlutterFlowExpandedImageView(
                                                        image: Image.network(
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.photo,
                                                              ''),
                                                          fit: BoxFit.contain,
                                                        ),
                                                        allowRotation: false,
                                                        tag: valueOrDefault(
                                                            currentUserDocument
                                                                ?.photo,
                                                            ''),
                                                        useHeroAnimation: true,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Hero(
                                                  tag: valueOrDefault(
                                                      currentUserDocument
                                                          ?.photo,
                                                      ''),
                                                  transitionOnUserGestures:
                                                      true,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.network(
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.photo,
                                                          ''),
                                                      width: 48,
                                                      height: 48,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'EditProfilePage',
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: false,
                                                ),
                                              },
                                            );
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.65,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: AuthUserStreamWidget(
                                                    builder: (context) => Text(
                                                      () {
                                                        if (currentUserDisplayName !=
                                                                null &&
                                                            currentUserDisplayName !=
                                                                '') {
                                                          return currentUserDisplayName;
                                                        } else if (valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.surname,
                                                                    '') !=
                                                                null &&
                                                            valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.surname,
                                                                    '') !=
                                                                '') {
                                                          return valueOrDefault(
                                                              currentUserDocument
                                                                  ?.surname,
                                                              '');
                                                        } else if (valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.patronymic,
                                                                    '') !=
                                                                null &&
                                                            valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.patronymic,
                                                                    '') !=
                                                                '') {
                                                          return valueOrDefault(
                                                              currentUserDocument
                                                                  ?.patronymic,
                                                              '');
                                                        } else {
                                                          return 'Гость';
                                                        }
                                                      }(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .displaySmall,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'Управление аккаунтом',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Fira Sans',
                                                      color: Color(0x81102938),
                                                      fontSize: 12,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('EditProfilePage');
                                    },
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      alignment: AlignmentDirectional(1, 0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: SvgPicture.asset(
                                          'assets/images/arr_right.svg',
                                          width: 10,
                                          height: 11,
                                          fit: BoxFit.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 48, 0, 25),
                            child: Container(
                              width: double.infinity,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Color(0xFFF3F4F5),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.home,
                                        color: Color(0xFF00BB67),
                                        size: 15,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            7, 2, 0, 0),
                                        child: Text(
                                          'Мой дом',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Fira Sans',
                                                color: Color(0xFF00BB67),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 24),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Text(
                                          valueOrDefault(
                                                      currentUserDocument
                                                          ?.mdName,
                                                      '') !=
                                                  ''
                                              ? valueOrDefault(
                                                  currentUserDocument?.mdName,
                                                  '')
                                              : 'Укажите название',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Fira Sans',
                                                fontSize: 22,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if ((valueOrDefault(
                                                  currentUserDocument?.mdType,
                                                  '') !=
                                              null &&
                                          valueOrDefault(
                                                  currentUserDocument?.mdType,
                                                  '') !=
                                              '') ||
                                      (valueOrDefault(currentUserDocument?.addr,
                                                  '') !=
                                              null &&
                                          valueOrDefault(
                                                  currentUserDocument?.addr,
                                                  '') !=
                                              '') ||
                                      (valueOrDefault(
                                                  currentUserDocument?.mdArea,
                                                  '') !=
                                              null &&
                                          valueOrDefault(
                                                  currentUserDocument?.mdArea,
                                                  '') !=
                                              '') ||
                                      (valueOrDefault(
                                                  currentUserDocument?.mdSeptic,
                                                  '') !=
                                              null &&
                                          valueOrDefault(
                                                  currentUserDocument?.mdSeptic,
                                                  '') !=
                                              ''))
                                    AuthUserStreamWidget(
                                      builder: (context) => Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 24),
                                            child: Container(
                                              width: double.infinity,
                                              height: 1,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFE8EAEC),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                if (valueOrDefault(
                                                        currentUserDocument
                                                            ?.mdType,
                                                        '') !=
                                                    '')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 18),
                                                    child: Text(
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.mdType,
                                                          ''),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Fira Sans',
                                                                fontSize: 14,
                                                              ),
                                                    ),
                                                  ),
                                                if (valueOrDefault(
                                                        currentUserDocument
                                                            ?.addr,
                                                        '') !=
                                                    '')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 18),
                                                    child: Text(
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.addr,
                                                          ''),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Fira Sans',
                                                                fontSize: 14,
                                                              ),
                                                    ),
                                                  ),
                                                if (valueOrDefault(
                                                        currentUserDocument
                                                            ?.mdArea,
                                                        '') !=
                                                    '')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 18),
                                                    child: Text(
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.mdArea,
                                                          ''),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Fira Sans',
                                                                fontSize: 14,
                                                              ),
                                                    ),
                                                  ),
                                                if (valueOrDefault(
                                                        currentUserDocument
                                                            ?.mdSeptic,
                                                        '') !=
                                                    '')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 24),
                                                    child: Text(
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.mdSeptic,
                                                          ''),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Fira Sans',
                                                                fontSize: 14,
                                                              ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed('EditMDPage');
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1, 0),
                                                    child: Icon(
                                                      Icons.mode_edit,
                                                      color: Color(0xFF586A74),
                                                      size: 18,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 0, 0, 0),
                                                    child: Text(
                                                      'Редактировать',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Fira Sans',
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
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
                                  if (!((valueOrDefault(
                                                  currentUserDocument?.mdType,
                                                  '') !=
                                              null &&
                                          valueOrDefault(
                                                  currentUserDocument?.mdType,
                                                  '') !=
                                              '') ||
                                      (valueOrDefault(currentUserDocument?.addr,
                                                  '') !=
                                              null &&
                                          valueOrDefault(
                                                  currentUserDocument?.addr,
                                                  '') !=
                                              '') ||
                                      (valueOrDefault(
                                                  currentUserDocument?.mdArea,
                                                  '') !=
                                              null &&
                                          valueOrDefault(
                                                  currentUserDocument?.mdArea,
                                                  '') !=
                                              '') ||
                                      (valueOrDefault(
                                                  currentUserDocument?.mdSeptic,
                                                  '') !=
                                              null &&
                                          valueOrDefault(
                                                  currentUserDocument?.mdSeptic,
                                                  '') !=
                                              '')))
                                    AuthUserStreamWidget(
                                      builder: (context) => FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed('EditMDPage');
                                        },
                                        text: 'Заполнить данные',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 48,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Fira Sans',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 31, 0, 0),
                            child: Container(
                              width: double.infinity,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Color(0xFFF3F4F5),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await launchURL(
                                  'https://sewera.ru/confidential/app');
                            },
                            child: Container(
                              width: double.infinity,
                              height: 60,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      18, 0, 0, 0),
                                  child: Text(
                                    'Пользовательское соглашение',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Fira Sans',
                                          fontSize: 14,
                                          lineHeight: 1.2,
                                        ),
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
