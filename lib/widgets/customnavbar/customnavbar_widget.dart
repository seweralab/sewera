import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/support/support_widget.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'customnavbar_model.dart';
export 'customnavbar_model.dart';

class CustomnavbarWidget extends StatefulWidget {
  const CustomnavbarWidget({
    Key? key,
    bool? supportactive,
    bool? homeactive,
    bool? orderactive,
    bool? profileactive,
  })  : this.supportactive = supportactive ?? false,
        this.homeactive = homeactive ?? false,
        this.orderactive = orderactive ?? false,
        this.profileactive = profileactive ?? false,
        super(key: key);

  final bool supportactive;
  final bool homeactive;
  final bool orderactive;
  final bool profileactive;

  @override
  _CustomnavbarWidgetState createState() => _CustomnavbarWidgetState();
}

class _CustomnavbarWidgetState extends State<CustomnavbarWidget> {
  late CustomnavbarModel _model;

  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomnavbarModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }
  }

  @override
  void dispose() {
    _model.maybeDispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Visibility(
      visible: !(isWeb
          ? MediaQuery.of(context).viewInsets.bottom > 0
          : _isKeyboardVisible),
      child: Material(
        color: Colors.transparent,
        elevation: 4.0,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 5.0,
                color: Color(0x14000000),
                offset: Offset(0.0, 0.0),
              )
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                height: 59.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (widget.homeactive) {
                      return;
                    }

                    context.pushNamed('HomePage2');
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                        child: Stack(
                          children: [
                            if (widget.homeactive)
                              SvgPicture.asset(
                                'assets/images/home_active.svg',
                                width: 20.0,
                                height: 20.0,
                                fit: BoxFit.cover,
                              ),
                            if (!widget.homeactive)
                              SvgPicture.asset(
                                'assets/images/home.svg',
                                width: 20.0,
                                height: 20.0,
                                fit: BoxFit.cover,
                              ),
                          ],
                        ),
                      ),
                      Text(
                        'Главный',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Fira Sans',
                              color: widget.homeactive
                                  ? FlutterFlowTheme.of(context).primary
                                  : Color(0xFF586A74),
                              fontSize: 10.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                height: 59.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (widget.orderactive) {
                      return;
                    }

                    context.pushNamed('ordersPage');
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                        child: Stack(
                          children: [
                            if (widget.orderactive)
                              SvgPicture.asset(
                                'assets/images/orders_active.svg',
                                width: 18.0,
                                height: 20.0,
                                fit: BoxFit.cover,
                              ),
                            if (!widget.orderactive)
                              SvgPicture.asset(
                                'assets/images/orders.svg',
                                width: 18.0,
                                height: 20.0,
                                fit: BoxFit.cover,
                              ),
                          ],
                        ),
                      ),
                      Text(
                        'Заказы',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Fira Sans',
                              color: widget.orderactive
                                  ? FlutterFlowTheme.of(context).primary
                                  : Color(0xFF586A74),
                              fontSize: 10.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                height: 59.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (widget.profileactive) {
                      return;
                    }

                    context.pushNamed('ProfilePage');
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                        child: Stack(
                          children: [
                            if (widget.profileactive)
                              SvgPicture.asset(
                                'assets/images/profile_active.svg',
                                width: 20.0,
                                height: 20.0,
                                fit: BoxFit.cover,
                              ),
                            if (!widget.profileactive)
                              SvgPicture.asset(
                                'assets/images/profile.svg',
                                width: 20.0,
                                height: 20.0,
                                fit: BoxFit.cover,
                              ),
                          ],
                        ),
                      ),
                      Text(
                        'Профиль',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Fira Sans',
                              color: widget.profileactive
                                  ? FlutterFlowTheme.of(context).primary
                                  : Color(0xFF586A74),
                              fontSize: 10.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                height: 59.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (widget.supportactive) {
                      Navigator.pop(context);
                    } else {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 1.0,
                              child: Scaffold(
                                body: GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                ),
                                backgroundColor: Colors.transparent,
                                bottomSheet: Container(
                                  color: Color(0xD900BB67),
                                  child: SupportWidget(),
                                ),
                              ),
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    }
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                        child: Stack(
                          children: [
                            if (widget.supportactive)
                              SvgPicture.asset(
                                'assets/images/support_active.svg',
                                width: 20.0,
                                height: 20.0,
                                fit: BoxFit.cover,
                              ),
                            if (!widget.supportactive)
                              SvgPicture.asset(
                                'assets/images/support.svg',
                                width: 20.0,
                                height: 20.0,
                                fit: BoxFit.cover,
                              ),
                          ],
                        ),
                      ),
                      Text(
                        'Поддержка',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Fira Sans',
                              color: widget.supportactive
                                  ? FlutterFlowTheme.of(context).primary
                                  : Color(0xFF586A74),
                              fontSize: 10.0,
                              fontWeight: FontWeight.w500,
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
    );
  }
}
