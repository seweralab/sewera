import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          params: parameterData.params,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).primaryBtnText,
          child: Center(
            child: Image.asset(
              'assets/images/splash.png',
              width: MediaQuery.of(context).size.width * 0.7,
              fit: BoxFit.contain,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get params => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'StartPage': (data) async => ParameterData(
        allParams: {
          'phone': getParameter<String>(data, 'phone'),
        },
      ),
  'SMSPage': (data) async => ParameterData(
        allParams: {
          'phone': getParameter<String>(data, 'phone'),
        },
      ),
  'ProfilePage': ParameterData.none(),
  'CatalogItemsPage': (data) async => ParameterData(
        allParams: {
          'catalog': getParameter<String>(data, 'catalog'),
        },
      ),
  'QuizSelectAddr': (data) async => ParameterData(
        allParams: {
          'customServiceName': getParameter<String>(data, 'customServiceName'),
          'coordinates': getParameter<LatLng>(data, 'coordinates'),
        },
      ),
  'SearchPage': ParameterData.none(),
  'QuizPage2': (data) async => ParameterData(
        allParams: {
          'quizCurrentIndex': getParameter<int>(data, 'quizCurrentIndex'),
          'serviceRef': getParameter<DocumentReference>(data, 'serviceRef'),
        },
      ),
  'EditProfilePage': ParameterData.none(),
  'EditProfileNamePage': ParameterData.none(),
  'EditProfileEmailPage': ParameterData.none(),
  'EditProfileBirthdayPage': ParameterData.none(),
  'EditProfilePhonePage': ParameterData.none(),
  'EditMDPage': ParameterData.none(),
  'EditMDNamePage': ParameterData.none(),
  'EditMDAreaPage': ParameterData.none(),
  'EditMDTypePage': ParameterData.none(),
  'EditMDSepticPage': ParameterData.none(),
  'EditMDAddrPage': ParameterData.none(),
  'ordersPage': ParameterData.none(),
  'QuizComment': (data) async => ParameterData(
        allParams: {
          'customServiceName': getParameter<String>(data, 'customServiceName'),
        },
      ),
  'QuizSendOrder': ParameterData.none(),
  'orderItemPage': (data) async => ParameterData(
        allParams: {
          'order': getParameter<DocumentReference>(data, 'order'),
        },
      ),
  'NotificationConfigPage': ParameterData.none(),
  'NotificationsPage': ParameterData.none(),
  'NotificationPage': (data) async => ParameterData(
        allParams: {
          'notication': getParameter<DocumentReference>(data, 'notication'),
        },
      ),
  'QuizNoService': (data) async => ParameterData(
        allParams: {
          'customServiceName': getParameter<String>(data, 'customServiceName'),
        },
      ),
  'cancelOrderPage': (data) async => ParameterData(
        allParams: {
          'order': await getDocumentParameter<OrdersRecord>(
              data, 'order', OrdersRecord.fromSnapshot),
        },
      ),
  'orderSubmittedPage': ParameterData.none(),
  'QuizPage2EditDate': ParameterData.none(),
  'QuizSelectAddrEdit': (data) async => ParameterData(
        allParams: {
          'customServiceName': getParameter<String>(data, 'customServiceName'),
          'coordinates': getParameter<LatLng>(data, 'coordinates'),
        },
      ),
  'QuizNoServiceEdit': (data) async => ParameterData(
        allParams: {
          'customServiceName': getParameter<String>(data, 'customServiceName'),
        },
      ),
  'onBoardingPage': ParameterData.none(),
  'test': ParameterData.none(),
  'HomePage2': ParameterData.none(),
  'QuizPage2EditOrder': (data) async => ParameterData(
        allParams: {
          'serviceRef': getParameter<DocumentReference>(data, 'serviceRef'),
          'quiztitle': getParameter<String>(data, 'quiztitle'),
        },
      ),
  'QuizPage2NoServiceDate': (data) async => ParameterData(
        allParams: {
          'quizCurrentIndex': getParameter<int>(data, 'quizCurrentIndex'),
          'serviceRef': getParameter<DocumentReference>(data, 'serviceRef'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
