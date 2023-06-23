import '/auth/base_auth_user_provider.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'on_boarding_page_model.dart';
export 'on_boarding_page_model.dart';

class OnBoardingPageWidget extends StatefulWidget {
  const OnBoardingPageWidget({Key? key}) : super(key: key);

  @override
  _OnBoardingPageWidgetState createState() => _OnBoardingPageWidgetState();
}

class _OnBoardingPageWidgetState extends State<OnBoardingPageWidget> {
  late OnBoardingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnBoardingPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/gradbg.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 1.0,
                      child: Stack(
                        children: [
                          PageView(
                            controller: _model.pageViewController ??=
                                PageController(initialPage: 0),
                            onPageChanged: (_) async {
                              if (_model.pageViewCurrentIndex == 3) {
                                if (loggedIn == true) {
                                  context.pushNamed('HomePage2');

                                  return;
                                } else {
                                  context.pushNamed('StartPage');

                                  return;
                                }
                              }
                            },
                            scrollDirection: Axis.horizontal,
                            children: [
                              Stack(
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 500.0,
                                        decoration: BoxDecoration(),
                                        child: Image.asset(
                                          'assets/images/slide_1.png',
                                          width: double.infinity,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.6,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: Text(
                                            'Добро пожаловать  в приложение Sewera!',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Fira Sans',
                                                  fontSize: 22.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            18.0, 0.0, 18.0, 0.0),
                                        child: Text(
                                          'Узнайте больше о преимуществах использования мобильного приложения!',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Fira Sans',
                                                color: Color(0xB3102938),
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Hero(
                                        tag: 'в',
                                        transitionOnUserGestures: true,
                                        child: Image.asset(
                                          'assets/images/slide_2.png',
                                          width: double.infinity,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: Text(
                                            'Это удобно!',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Fira Sans',
                                                  fontSize: 22.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            18.0, 0.0, 18.0, 0.0),
                                        child: Text(
                                          'Здесь вы можете поручить специалистам Sewera разные бытовые задачи. \nНапример, постричь газон  или обслужить бойлер',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Fira Sans',
                                                color: Color(0xB3102938),
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/slide_3.png',
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: Text(
                                            'Не пропустите важное',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Fira Sans',
                                                  fontSize: 22.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            18.0, 0.0, 18.0, 36.0),
                                        child: Text(
                                          'Включите уведомления и будьте уверены, что не пропустите дату обслуживания вашего септика или выгодную скидку.',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Fira Sans',
                                                color: Color(0xB3102938),
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/slide_4.png',
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: Text(
                                            'Бонусы и скидки',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Fira Sans',
                                                  fontSize: 22.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            18.0, 0.0, 18.0, 0.0),
                                        child: Text(
                                          'Получите скидку 1000₽  на первый заказ!',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Fira Sans',
                                                color: Color(0xB3102938),
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.95),
                            child: smooth_page_indicator.SmoothPageIndicator(
                              controller: _model.pageViewController ??=
                                  PageController(initialPage: 0),
                              count: 4,
                              axisDirection: Axis.horizontal,
                              onDotClicked: (i) async {
                                await _model.pageViewController!.animateToPage(
                                  i,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                              effect: smooth_page_indicator.SlideEffect(
                                spacing: 8.0,
                                radius: 16.0,
                                dotWidth: 75.0,
                                dotHeight: 3.0,
                                dotColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                activeDotColor:
                                    FlutterFlowTheme.of(context).primary,
                                paintStyle: PaintingStyle.fill,
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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 48.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await _model.pageViewController?.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.12,
                    height: double.infinity,
                    decoration: BoxDecoration(),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (_model.pageViewCurrentIndex < 3) {
                      await _model.pageViewController?.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    } else {
                      if (loggedIn == true) {
                        context.pushNamed('HomePage2');

                        return;
                      } else {
                        context.pushNamed('StartPage');

                        return;
                      }
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.12,
                    height: double.infinity,
                    decoration: BoxDecoration(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 20.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (loggedIn == true) {
                      context.goNamed('HomePage2');

                      return;
                    } else {
                      context.goNamed('StartPage');

                      return;
                    }
                  },
                  child: Container(
                    width: 60.0,
                    height: 65.0,
                    decoration: BoxDecoration(),
                    child: Align(
                      alignment: AlignmentDirectional(1.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 20.0, 0.0),
                        child: Icon(
                          Icons.close,
                          color: Color(0xFF526970),
                          size: 24.0,
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
    );
  }
}
