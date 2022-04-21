import 'package:flutter/foundation.dart';

import 'model/status.dart';

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }
  ApplicationLoginState _loginState = ApplicationLoginState.loggedOut;
  ApplicationLoginState get loginState => _loginState;

  // Future<void> verifyEmail(
  //   String email,
  //   void Function(FirebaseAuthException e) errorCallback,
  // ) async {
  //   try {
  //     var methods =
  //         await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
  //     if (methods.contains('password')) {
  //       _loginState = ApplicationLoginState.password; //メアドあり
  //     } else {
  //       _loginState = ApplicationLoginState.register; //メアドなし
  //     }
  //     _email = email; //入力されたメアドを保存
  //     notifyListeners(); //_loginStateの変更をリッスンし再レンダリング
  //   } on FirebaseAuthException catch (e) {
  //     errorCallback(e);
  //   }
  // }
  void verifyEmail(
    String email,
  ) {
    _email = email;
    _loginState = ApplicationLoginState.password;
    notifyListeners();
  }

  // void signInWithEmailAndPassword(
  //   String? email,
  //   String? password,
  //   // void Function(FirebaseAuthException e) errorCallback,
  // ) {
  //   _user != "signin_user";
  //   _loginState = ApplicationLoginState.loggedOut;
  //   notifyListeners();
  //   print('signInWithEmailAndPassword');
  //   print(email);
  //   print(password);
  // }

  void signInWithEmailAndPassword(
    String email,
    String password,
    // void Function(FirebaseAuthException e) errorCallback,
  ) {
    print('signInWithEmailAndPassword');
    print(email);
    print(password);
    _user = "signin_user";
    _loginState = ApplicationLoginState.welcom;
    notifyListeners();
  }

  // Future<void> registerAccount(
  //     String email,
  //     String displayName,
  //     String password,
  //     void Function(FirebaseAuthException e) errorCallback) async {
  //   try {
  //     var credential = await FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(email: email, password: password);
  //     await credential.user!.updateDisplayName(displayName);
  //   } on FirebaseAuthException catch (e) {
  //     errorCallback(e);
  //   }
  // }
  void registerAccount(
    String email,
    String displayName,
    String password,
    // void Function(FirebaseAuthException e) errorCallback
  ) {
    // print('registerAccount');
    // print(email);
    // print(displayName);
    // print(password);
    _user = displayName;
    _loginState = ApplicationLoginState.welcom;
    notifyListeners();
  }

  void signOut() {
    // FirebaseAuth.instance.signOut();
    _user = "";
    _loginState = ApplicationLoginState.loggedOut;
    notifyListeners();
  }

  void setLoginState(ApplicationLoginState status) {
    _loginState = status;
    notifyListeners();
  }

  String? _email;
  String? get email => _email;

  String _user = "";
  String get getUser => _user;

  // set setUser({required String user}) {
  //   _user = user;
  //   notifyListeners();
  // }
  void setUser({required String user}) {
    _user = user;
    init();
    notifyListeners();
  }

  void init() {
    if (_user != "") {
      _loginState = ApplicationLoginState.loggedIn;
      notifyListeners();
    } else {
      _loginState = ApplicationLoginState.loggedOut;
      // _guestBookSubscription?.cancel();
      notifyListeners();
    }
  }
}
