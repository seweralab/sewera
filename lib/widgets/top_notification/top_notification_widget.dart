import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'top_notification_model.dart';
export 'top_notification_model.dart';

class TopNotificationWidget extends StatefulWidget {
  const TopNotificationWidget({
    Key? key,
    bool? isDisbaledHome,
    bool? isDisabledNotification,
  })  : this.isDisbaledHome = isDisbaledHome ?? false,
        this.isDisabledNotification = isDisabledNotification ?? false,
        super(key: key);

  final bool isDisbaledHome;
  final bool isDisabledNotification;

  @override
  _TopNotificationWidgetState createState() => _TopNotificationWidgetState();
}

class _TopNotificationWidgetState extends State<TopNotificationWidget> {
  late TopNotificationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopNotificationModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(),
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
                if (widget.isDisbaledHome) {
                  return;
                }

                context.pushNamed('HomePage2');
              },
              child: SvgPicture.asset(
                'assets/images/logo.svg',
                width: 26.0,
                height: 26.0,
                fit: BoxFit.cover,
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 2.0, 5.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (widget.isDisabledNotification) {
                        return;
                      }

                      context.pushNamed('NotificationsPage');
                    },
                    child: Icon(
                      Icons.notifications,
                      color: Color(0xFFB8BFC4),
                      size: 26.0,
                    ),
                  ),
                ),
                if (valueOrDefault<bool>(
                        currentUserDocument?.newNotification, false) ==
                    true)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 4.0, 0.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => Material(
                        color: Colors.transparent,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Container(
                          width: 10.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFEB5757),
                            borderRadius: BorderRadius.circular(6.0),
                            border: Border.all(
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              width: 0.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
