import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '../../auth/base_auth_user_provider.dart';
import '../../backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) =>
          appStateNotifier.loggedIn ? NavBarPage() : OnBoardingPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : OnBoardingPageWidget(),
        ),
        FFRoute(
          name: 'StartPage',
          path: '/startPage',
          builder: (context, params) => StartPageWidget(
            phone: params.getParam('phone', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'SMSPage',
          path: '/sMSPage',
          builder: (context, params) => SMSPageWidget(
            phone: params.getParam('phone', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'ProfilePage',
          path: '/profilePage',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'ProfilePage')
              : ProfilePageWidget(),
        ),
        FFRoute(
          name: 'CatalogItemsPage',
          path: '/catalogItemsPage',
          builder: (context, params) => CatalogItemsPageWidget(
            catalog: params.getParam('catalog', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'QuizSelectAddr',
          path: '/quizSelectAddr',
          builder: (context, params) => QuizSelectAddrWidget(
            customServiceName:
                params.getParam('customServiceName', ParamType.String),
            coordinates: params.getParam('coordinates', ParamType.LatLng),
          ),
        ),
        FFRoute(
          name: 'SearchPage',
          path: '/searchPage',
          builder: (context, params) => SearchPageWidget(),
        ),
        FFRoute(
          name: 'QuizPage2',
          path: '/quizPage2',
          builder: (context, params) => QuizPage2Widget(
            quizCurrentIndex:
                params.getParam('quizCurrentIndex', ParamType.int),
            serviceRef: params.getParam(
                'serviceRef', ParamType.DocumentReference, false, ['services']),
          ),
        ),
        FFRoute(
          name: 'EditProfilePage',
          path: '/editProfilePage',
          // builder: (context, params) => EditProfilePageWidget(),
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'EditProfilePage')
              : EditProfilePageWidget(),
        ),
        FFRoute(
          name: 'EditProfileNamePage',
          path: '/editProfileNamePage',
          // builder: (context, params) => EditProfileNamePageWidget(),
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'EditProfileNamePage')
              : EditProfileNamePageWidget(),
        ),
        FFRoute(
          name: 'EditProfileEmailPage',
          path: '/editProfileEmailPage',
          // builder: (context, params) => EditProfileEmailPageWidget(),
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'EditProfileEmailPage')
              : EditProfileEmailPageWidget(),
        ),
        FFRoute(
          name: 'EditProfileBirthdayPage',
          path: '/editProfileBirthdayPage',
          // builder: (context, params) => EditProfileBirthdayPageWidget(),
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'EditProfileBirthdayPage')
              : EditProfileBirthdayPageWidget(),
        ),
        FFRoute(
          name: 'EditProfilePhonePage',
          path: '/editProfilePhonePage',
          // builder: (context, params) => EditProfilePhonePageWidget(),
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'EditProfilePhonePage')
              : EditProfilePhonePageWidget(),
        ),
        FFRoute(
          name: 'EditMDPage',
          path: '/editMDPage',
          // builder: (context, params) => EditMDPageWidget(),
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'EditMDPage')
              : EditMDPageWidget(),
        ),
        FFRoute(
          name: 'EditMDNamePage',
          path: '/editMDNamePage',
          // builder: (context, params) => EditMDNamePageWidget(),
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'EditMDNamePage')
              : EditMDNamePageWidget(),
        ),
        FFRoute(
          name: 'EditMDAreaPage',
          path: '/editMDAreaPage',
          // builder: (context, params) => EditMDAreaPageWidget(),
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'EditMDAreaPage')
              : EditMDAreaPageWidget(),
        ),
        FFRoute(
          name: 'EditMDTypePage',
          path: '/editMDTypePage',
          // builder: (context, params) => EditMDTypePageWidget(),
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'EditMDTypePage')
              : EditMDTypePageWidget(),
        ),
        FFRoute(
          name: 'EditMDSepticPage',
          path: '/editMDSepticPage',
          // builder: (context, params) => EditMDSepticPageWidget(),
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'EditMDSepticPage')
              : EditMDSepticPageWidget(),
        ),
        FFRoute(
          name: 'EditMDAddrPage',
          path: '/editMDAddrPage',
          // builder: (context, params) => EditMDAddrPageWidget(),
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'EditMDAddrPage')
              : EditMDAddrPageWidget(),
        ),
        FFRoute(
          name: 'ordersPage',
          path: '/ordersPage',
          // builder: (context, params) => OrdersPageWidget(),
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'OrdersPage')
              : OrdersPageWidget(),
        ),
        FFRoute(
          name: 'QuizComment',
          path: '/quizComment',
          builder: (context, params) => QuizCommentWidget(
            customServiceName:
                params.getParam('customServiceName', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'QuizSendOrder',
          path: '/quizSendOrder',
          builder: (context, params) => QuizSendOrderWidget(),
          // builder: (context, params) => params.isEmpty
          //     ? NavBarPage(initialPage: 'QuizSendOrder')
          //     : QuizSendOrderWidget(),
        ),
        FFRoute(
          name: 'orderItemPage',
          path: '/orderItemPage',
          builder: (context, params) => OrderItemPageWidget(
            order: params.getParam(
                'order', ParamType.DocumentReference, false, ['orders']),
          ),
        ),
        FFRoute(
          name: 'NotificationConfigPage',
          path: '/notificationConfigPage',
          // builder: (context, params) => NotificationConfigPageWidget(),
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'NotificationConfigPage')
              : NotificationConfigPageWidget(),
        ),
        FFRoute(
          name: 'NotificationsPage',
          path: '/notificationsPage',
          // builder: (context, params) => NotificationsPageWidget(),
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'NotificationsPage')
              : NotificationsPageWidget(),
        ),
        FFRoute(
          name: 'NotificationPage',
          path: '/notificationPage',
          builder: (context, params) => NotificationPageWidget(
            notication: params.getParam('notication',
                ParamType.DocumentReference, false, ['notifications']),
          ),
        ),
        FFRoute(
          name: 'QuizNoService',
          path: '/quizNoService',
          builder: (context, params) => QuizNoServiceWidget(
            customServiceName:
                params.getParam('customServiceName', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'cancelOrderPage',
          path: '/cancelOrderPage',
          asyncParams: {
            'order': getDoc(['orders'], OrdersRecord.fromSnapshot),
          },
          builder: (context, params) => CancelOrderPageWidget(
            order: params.getParam('order', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'orderSubmittedPage',
          path: '/orderSubmittedPage',
          builder: (context, params) => OrderSubmittedPageWidget(),
        ),
        FFRoute(
          name: 'QuizPage2EditDate',
          path: '/quizPage2EditDate',
          builder: (context, params) => QuizPage2EditDateWidget(),
        ),
        FFRoute(
          name: 'QuizSelectAddrEdit',
          path: '/quizSelectAddrEdit',
          builder: (context, params) => QuizSelectAddrEditWidget(
            customServiceName:
                params.getParam('customServiceName', ParamType.String),
            coordinates: params.getParam('coordinates', ParamType.LatLng),
          ),
        ),
        FFRoute(
          name: 'QuizNoServiceEdit',
          path: '/quizNoServiceEdit',
          builder: (context, params) => QuizNoServiceEditWidget(
            customServiceName:
                params.getParam('customServiceName', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'onBoardingPage',
          path: '/onBoardingPage',
          builder: (context, params) => OnBoardingPageWidget(),
        ),
        FFRoute(
          name: 'test',
          path: '/test',
          builder: (context, params) => TestWidget(),
        ),
        FFRoute(
          name: 'HomePage2',
          path: '/homePage2',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'HomePage2')
              : HomePage2Widget(),
        ),
        FFRoute(
          name: 'QuizPage2EditOrder',
          path: '/quizPage2EditOrder',
          builder: (context, params) => QuizPage2EditOrderWidget(
            serviceRef: params.getParam(
                'serviceRef', ParamType.DocumentReference, false, ['services']),
            quiztitle: params.getParam('quiztitle', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'QuizPage2NoServiceDate',
          path: '/quizPage2NoServiceDate',
          builder: (context, params) => QuizPage2NoServiceDateWidget(
            quizCurrentIndex:
                params.getParam('quizCurrentIndex', ParamType.int),
            serviceRef: params.getParam(
                'serviceRef', ParamType.DocumentReference, false, ['services']),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      urlPathStrategy: UrlPathStrategy.path,
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (GoRouter.of(this).routerDelegate.matches.length <= 1) {
      go('/');
    } else {
      pop();
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/onBoardingPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
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
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.rightToLeft,
        duration: Duration(milliseconds: 150),
      );
}
