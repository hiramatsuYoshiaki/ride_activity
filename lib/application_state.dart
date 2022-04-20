import 'package:flutter/foundation.dart';

import 'model/status.dart';

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }
  ApplicationLoginState _loginState = ApplicationLoginState.loggedOut;
  // ApplicationLoginState _loginState = ApplicationLoginState.loggedIn;
  ApplicationLoginState get loginState => _loginState;
  // void setLoginState({required ApplicationLoginState loginState}) {
  //   _loginState = loginState as ApplicationLoginState;
  //   notifyListeners();
  // }
  // void startLoginFlow() {
  //   _loginState = ApplicationLoginState.emailAdress;
  //   notifyListeners();
  // }

  // void verifyEmail() {
  //   _loginState = ApplicationLoginState.password;
  //   notifyListeners();
  // }

  // void signInWithEmailAndPassword() {
  //   _loginState = ApplicationLoginState.emailAdress;
  //   notifyListeners();
  // }
  // void cancelRegistration() {
  //   _loginState = ApplicationLoginState.emailAdress;
  //   notifyListeners();
  // }

  // void registerAccount() {
  //   _loginState = ApplicationLoginState.loggedIn;
  //   notifyListeners();
  // }

  // void signOut() {
  //   _loginState = ApplicationLoginState.loggedOut;
  //   notifyListeners();
  // }

  void login() {
    _loginState = ApplicationLoginState.emailAdress;
    notifyListeners();
  }

  void password() {
    _loginState = ApplicationLoginState.password;
    notifyListeners();
  }

  // void register() {
  //   _loginState = ApplicationLoginState.emailAdress;
  //   notifyListeners();
  // }

  void account() {
    _loginState = ApplicationLoginState.loggedIn;
    notifyListeners();
  }

  void cansel() {
    _loginState = ApplicationLoginState.loggedOut;
    notifyListeners();
  }

  void signout() {
    _loginState = ApplicationLoginState.loggedOut;
    notifyListeners();
  }

  void setLoginState(ApplicationLoginState status) {
    _loginState = status;
    notifyListeners();
  }

  void verifyEmail(
    String email,
  ) {
    //firebase fetchSignInMethodsForEmail
    _email = email;
  }

  void signInWithEmailAndPassword(
    String email,
    String password,
    // void Function(FirebaseAuthException e) errorCallback,
  ) {
    _user != "login user";
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
