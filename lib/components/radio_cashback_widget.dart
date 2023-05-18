import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'radio_cashback_model.dart';
export 'radio_cashback_model.dart';

class RadioCashbackWidget extends StatefulWidget {
  const RadioCashbackWidget({
    Key? key,
    required this.cost,
    required this.cashback,
    required this.radioCashback,
  }) : super(key: key);

  final int? cost;
  final int? cashback;
  final String? radioCashback;

  @override
  _RadioCashbackWidgetState createState() => _RadioCashbackWidgetState();
}

class _RadioCashbackWidgetState extends State<RadioCashbackWidget> {
  late RadioCashbackModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RadioCashbackModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.localRadioCashback = widget.radioCashback;
      });
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return AuthUserStreamWidget(
      builder: (context) => Builder(
        builder: (context) {
          final radios = functions
              .orderCachbackOptions(widget.cost!, widget.cashback,
                  valueOrDefault(currentUserDocument?.cashback, 0))
              .toList();
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: List.generate(radios.length, (radiosIndex) {
              final radiosItem = radios[radiosIndex];
              return Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    setState(() {
                      _model.localRadioCashback = radiosItem;
                      _model.localOldPrice = functions.updateOldPrice(
                          radiosItem,
                          valueOrDefault(currentUserDocument?.cashback, 0),
                          widget.cost);
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          if (radiosItem != _model.localRadioCashback)
                            SvgPicture.asset(
                              'assets/images/radio_clear.svg',
                              width: 24.0,
                              height: 24.0,
                              fit: BoxFit.cover,
                            ),
                          if ((radiosItem == _model.localRadioCashback) &&
                              functions.isRadioContainsValue(
                                  radiosItem, 'Получить'))
                            SvgPicture.asset(
                              'assets/images/radio_cashactive.svg',
                              width: 24.0,
                              height: 24.0,
                              fit: BoxFit.cover,
                            ),
                          if ((radiosItem == _model.localRadioCashback) &&
                              !functions.isRadioContainsValue(
                                  radiosItem, 'Получить'))
                            SvgPicture.asset(
                              'assets/images/radio_check.svg',
                              width: 24.0,
                              height: 24.0,
                              fit: BoxFit.cover,
                            ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 0.0),
                            child: AutoSizeText(
                              radiosItem,
                              maxLines: 2,
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
