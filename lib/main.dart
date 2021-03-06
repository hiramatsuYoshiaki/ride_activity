import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'application_state.dart';
import 'pages/auth.dart';
import 'pages/home.dart';
import 'pages/activity.dart';
import 'pages/account.dart';
import 'pages/notfound.dart';
// import 'model/status.dart';
import 'auth_guard.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationState(),
      child: MaterialApp(
        title: 'Ride Activity',
        theme: ThemeData(
          fontFamily: 'Roboto',
          // fontFamily: 'sans-serif',
          // fontFamily: 'Roboto,sans-serif',
          //   buttonTheme: Theme.of(context).buttonTheme.copyWith(
          //         highlightColor: Colors.deepPurple,
          //       ),
          //   primarySwatch: Colors.deepPurple,
          //   textTheme: GoogleFonts.robotoTextTheme(
          //     Theme.of(context).textTheme,
          //   ),
          //   visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/home': (context) => HomePage(),
          // '/home': (context) => Consumer<ApplicationState>(
          //       builder: (context, appState, _) =>
          //           appState.loginState == ApplicationLoginState.loggedIn
          //               ? HomePage()
          //               : AuthPage(),
          //     ),
          '/account': (context) => Consumer<ApplicationState>(
                builder: (context, appState, _) => AuthGuard(
                  loginState: appState.loginState,
                  guard: AuthPage(),
                  child: AccountPage(),
                ),
              ),
          '/activity': (context) => Consumer<ApplicationState>(
                builder: (context, appState, _) => AuthGuard(
                  loginState: appState.loginState,
                  guard: AuthPage(),
                  child: ActivityPage(),
                ),
              ),
          '/login': (context) => AuthPage(),
          // '/logout': (context) => LogoutPage(),
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute<void>(
              settings: settings,
              builder: (BuildContext context) => NotFoundPage());
        },
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
