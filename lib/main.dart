import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'application_state.dart';
import 'pages/auth.dart';
import 'pages/home.dart';
import 'pages/activity.dart';
import 'pages/notfound.dart';
import 'model/status.dart';
import 'auth_guard.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ApplicationState(),
    child: MaterialApp(
      title: 'Ride Activity',
      initialRoute: '/home',
      routes: {
        '/': (context) => HomePage(),
        '/home': (context) => HomePage(),
        // '/home': (context) => Consumer<ApplicationState>(
        //       builder: (context, appState, _) =>
        //           appState.loginState == ApplicationLoginState.loggedIn
        //               ? HomePage()
        //               : AuthPage(),
        //     ),
        '/activity': (context) => Consumer<ApplicationState>(
              builder: (context, appState, _) => AuthGuard(
                loginState: appState.loginState,
                guard: AuthPage(),
                child: ActivityPage(),
              ),
            ),
        '/login': (context) => AuthPage(),
        '/logout': (context) => AuthPage(),
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(
            settings: settings,
            builder: (BuildContext context) => NotFoundPage());
      },
      debugShowCheckedModeBanner: false,
    ),
  ));
}
