import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth/firebase_auth/firebase_user_provider.dart';
import 'auth/firebase_auth/auth_util.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/widgets/support/support_widget.dart';
import 'backend/push_notifications/push_notifications_util.dart';
import 'backend/firebase/firebase_config.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();

  final appState = FFAppState(); // Initialize FFAppState
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
  ));
  await appState.initializePersistedState();

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = ThemeMode.system;

  late Stream<BaseAuthUser> userStream;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  final authUserSub = authenticatedUserStream.listen((_) {});
  final fcmTokenSub = fcmTokenUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();
    _appStateNotifier = AppStateNotifier();
    _router = createRouter(_appStateNotifier);
    userStream = seweraFirebaseUserStream()
      ..listen((user) => _appStateNotifier.update(user));
    jwtTokenStream.listen((_) {});
    Future.delayed(
      Duration(seconds: 1),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();
    fcmTokenSub.cancel();
    super.dispose();
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1.0,
          ),
          child: child!,
        );
      },
      title: 'sewera',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('ru'),
      ],
      theme: ThemeData(brightness: Brightness.light),
      themeMode: _themeMode,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key? key, this.initialPage, this.page}) : super(key: key);

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'HomePage2';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'HomePage2': HomePage2Widget(),
      'OrdersPage': OrdersPageWidget(),
      'ProfilePage': ProfilePageWidget(),
      'EditProfilePage': EditProfilePageWidget(),
      'EditProfileBirthdayPage': EditProfileBirthdayPageWidget(),
      'EditProfileEmailPage': EditProfileEmailPageWidget(),
      'EditProfileNamePage': EditProfileNamePageWidget(),
      'EditProfilePhonePage': EditProfilePhonePageWidget(),
      'EditMDAddrPage': EditMDAddrPageWidget(),
      'EditMDAreaPage': EditMDAreaPageWidget(),
      'EditMDNamePage': EditMDNamePageWidget(),
      'EditMDPage': EditMDPageWidget(),
      'EditMDSepticPage': EditMDSepticPageWidget(),
      'EditMDTypePage': EditMDTypePageWidget(),
      'OrderSubmittedPage': OrderSubmittedPageWidget(),
      'NotificationConfigPage': NotificationConfigPageWidget(),
      'NotificationsPage': NotificationsPageWidget(),
    };
    var currentIndex = tabs.keys.toList().indexOf(_currentPageName);
    // final currentIndex = 2;
    if (currentIndex >= 3 && currentIndex <= 13) {
      currentIndex = 2;
    }
    if (currentIndex == 14) {
      currentIndex = 1;
    }
    if (currentIndex >= 15) {
      currentIndex = 0;
    }
    return Scaffold(
      body: _currentPage ?? tabs[_currentPageName],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() {
          if (i == 3) {
            showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Color(0xD900BB67),
              enableDrag: false,
              context: context,
              builder: (bottomSheetContext) {
                return Padding(
                  padding: MediaQuery.of(bottomSheetContext).viewInsets,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 1.0,
                    child: SupportWidget(),
                  ),
                );
              },
            );
          } else {
            _currentPage = null;
            _currentPageName = tabs.keys.toList()[i];
          }
        }),
        backgroundColor: Colors.white,
        selectedItemColor: FlutterFlowTheme.of(context).primary,
        unselectedItemColor: Color(0x8A000000),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedFontSize: 14.0,
        // fixedColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            // icon: Image.asset('assets/images/attach.png'),
            icon: SvgPicture.asset(
              'assets/images/home.svg',
              height: 20.0,
              width: 20.0,
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/home_active.svg',
              height: 20.0,
              width: 20.0,
            ),
            label: 'Главный',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/orders.svg',
              height: 20.0,
              width: 20.0,
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/orders_active.svg',
              height: 20.0,
              width: 20.0,
            ),
            label: 'Заказы',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/profile.svg',
              height: 20.0,
              width: 20.0,
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/profile_active.svg',
              height: 20.0,
              width: 20.0,
            ),
            label: 'Профиль',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/support.svg',
              height: 20.0,
              width: 20.0,
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/support_active.svg',
              height: 20.0,
              width: 20.0,
            ),
            label: 'Поддержка',
            tooltip: '',
          )
        ],
      ),
    );
  }
}
