import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'model/status.dart';

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseAuth.instance.userChanges().listen((user) {
      print('ApplicationState init userChanges------ start ');
      if (user != null) {
        _currentUser = user;
        if (user.emailVerified == false) {
          _loginState = ApplicationLoginState.welcom;
        } else {
          _loginState = ApplicationLoginState.loggedIn;
        }

        print('userChanges logged in');
        print(user.uid);
        print(user.email);
        print(user.displayName);
        print(user.emailVerified);
        // setUser(user);
        // User(
        //   displayName: aaa,
        //   email: aaa@gmail.com,
        //   emailVerified: false,
        //   isAnonymous: false,
        //   metadata: UserMetadata(creationTime: 2022-04-22 05:48:48.000,lastSignInTime: 2022-04-22 07:19:00.000),
        //   phoneNumber: null,
        //   photoURL: null,
        //   providerData, [UserInfo(displayName: aaa, email: aaa@gmail.com, phoneNumber: null,
        //   photoURL: null, providerId: password, uid: aaa@gmail.com)],
        //   refreshToken:AIwUaOn5gTcGyrfEnxidlGbxcJ4Vfkgj0b9AuyQ7enigJ6LP8WTX4Ys_IR7Iz_50qVW_l9BWOz1CTD-BwvCmjmXNBHw9G7H1AqsTMQCQ8yYU6EjdncPwZ6P44huXYL5Pj9XdMuaaUjpAq9leARIqxgzcKeQqbRJv7fQGOi73e4l3ER2zuCRAHFHgUsriTeeMRGTZWf1rjwoSBxdLTfVB9MRPzITLccDbrg,
        //   tenantId: null,
        //   uid: ltLWWdJvQ7RDVUvUMnDmloFnwwa2
        // )

        //Rider情報----------------------------------------------------
        // _riderInfo = RiderInfo(
        //     uid: user.uid, riderName: user.displayName, email: user.email);
        // _riderInfo = RiderInfo(
        //     uid: user.uid.toString(),
        //     riderName: user.displayName.toString(),
        //     email: user.email.toString());

        //Activity情報-------------------------------------------------
        // _guestBookSubscription = FirebaseFirestore.instance
        //     .collection('guestbook')
        //     .orderBy('timestamp', descending: true)
        //     .snapshots()
        //     .listen((snapshot) {
        //   _guestBookMessages = [];
        //   for (final document in snapshot.docs) {
        //     // print(document.data()['message'] as String);
        //     _guestBookMessages.add(
        //       GuestBookMessage(
        //           name: document.data()['name'] as String,
        //           message: document.data()['text'] as String),
        //     );
        //   }
        _riderActivities = [
          RiderActivities(
              id: '001',
              uid: 'jmUx5BeigyYVWQ1ysaWjq02oKao2',
              activityTitle: 'aaaa',
              email: 'hworksdev@gmail.com'),
          RiderActivities(
              id: '002',
              uid: 'ltLWWdJvQ7RDVUvUMnDmloFnwwa2',
              activityTitle: 'bbbb',
              email: 'aaa.com'),
        ];

        notifyListeners();
      } else {
        _loginState = ApplicationLoginState.loggedOut;
        _currentUser = null;
        _riderActivities = [];
        print('userChanges logged out');
        // print(user);
        notifyListeners();
      }
    });
  }
  // void init() {
  //   if (_user != "") {
  //     _loginState = ApplicationLoginState.loggedIn;
  //     notifyListeners();
  //   } else {
  //     _loginState = ApplicationLoginState.loggedOut;
  //     notifyListeners();
  //   }
  // }

  ApplicationLoginState _loginState = ApplicationLoginState.loggedOut;
  ApplicationLoginState get loginState => _loginState;
  ProfileState _profileState = ProfileState.display;
  ProfileState get profileState => _profileState;
  ActivityState _activityState = ActivityState.display;
  ActivityState get activityState => _activityState;
  RiderState _riderState = RiderState.display;
  RiderState get riderState => _riderState;
  String? _email;
  String? get email => _email;

  // final List<RiderActivities> _RiderActivities = [
  //   RiderActivities(
  //       id: '001',
  //       uid: 'jmUx5BeigyYVWQ1ysaWjq02oKao2',
  //       activityTitle: 'aaaa',
  //       email: 'hworksdev@gmail.com'),
  //   RiderActivities(
  //       id: '002',
  //       uid: 'ltLWWdJvQ7RDVUvUMnDmloFnwwa2',
  //       activityTitle: 'bbbb',
  //       email: 'aaa.com'),
  // ];
  List<RiderActivities> _riderActivities = [];
  List<RiderActivities> get riderActivities => _riderActivities;
  // List<RiderActivities> getRideActivitise() {
  //   return riderActivities;
  // }

  // RiderInfo _riderInfo;
  // RiderInfo get riderInfo => _riderInfo;

  // String _user = "";
  // String get getUser => _user;

  User? _currentUser;
  User? get getCurrentUser => _currentUser;

  void setProfileState(ProfileState status) {
    _profileState = status;
    notifyListeners();
  }

  void setActivityState(ActivityState status) {
    _activityState = status;
    notifyListeners();
  }

  void setLoginState(ApplicationLoginState status) {
    _loginState = status;
    notifyListeners();
  }

  // bool _isEditProfilr = false;
  // bool get getIsEditProfile => _isEditProfilr;
  // void editProfile() {
  //   _isEditProfilr = !_isEditProfilr;
  //   notifyListeners();
  // }

  // void setUser({required String user}) {
  //   _user = user;
  //   init();
  //   notifyListeners();
  // }

  // set setUser({required String user}) {
  //   _user = user;
  //   notifyListeners();
  // }

  Future<void> verifyEmail(
    String email,
    // void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      // print('verifyEmail');
      // print('email:$email');
      var methods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      if (methods.contains('password')) {
        _loginState = ApplicationLoginState.password; //メアドあり
      } else {
        _loginState = ApplicationLoginState.register; //メアドなし
      }
      _email = email; //入力されたメアドを保存
      notifyListeners(); //_loginStateの変更をリッスンし再レンダリング
    } on FirebaseAuthException catch (e) {
      // errorCallback(e);
      print('firebase auhentication error!');
      print('createUserWithEmailPassword Error:$e');
    }
  }
  // void verifyEmail(
  //   String email,
  // ) {
  //   _email = email;
  //   _loginState = ApplicationLoginState.password;
  //   notifyListeners();
  // }

  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
    void Function(FirebaseAuthException e) errorCallback, //_showErrorDialogs
  ) async {
    try {
      // print('signInWithEmailAndPassword');
      // print('email:$email');
      // print('password:$password');
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
      print('firebase auhentication error!');
      print('createUserWithEmailPassword Error:$e');
    }
  }

  // void signInWithEmailAndPassword(
  //   String email,
  //   String password,
  // ) {
  //   _user = "signin_user";
  //   _loginState = ApplicationLoginState.welcom;
  //   notifyListeners();
  // }

  Future<void> registerAccount(
      String email,
      String displayName,
      String password,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!.updateDisplayName(displayName);
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
      print('firebase auhentication error!');
      print('createUserWithEmailPassword Error:$e');
    }
  }
  // void registerAccount(
  //   String email,
  //   String displayName,
  //   String password,
  // ) {
  //   _user = displayName;
  //   _loginState = ApplicationLoginState.welcom;
  //   notifyListeners();
  // }

  Future<void> sendEmailVerification(
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      // print('sendEmailVerification');
      User? user = FirebaseAuth.instance.currentUser;
      // print(user?.displayName);
      // print(user?.email);
      // print(user?.emailVerified);

      if (user != null && !user.emailVerified) {
        // var actionCodeSettings = ActionCodeSettings(
        //   url: 'https ://www.example.com/?email=${user.email}',
        //   dynamicLinkDomain: 'example.page.link',
        //   androidPackageName: 'com.example.android',
        //   androidInstallApp: true,
        //   androidMinimumVersion: '12',
        //   iOSBundleId: 'com.example.ios',
        //   handleCodeInApp: true,
        // );
        // await user.sendEmailVerification(actionCodeSettings);
        await user.sendEmailVerification();
      }
      _loginState = ApplicationLoginState.loggedOut;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
      print('firebase auhentication error!');
      print('createUserWithEmailPassword Error:$e');
      _loginState = ApplicationLoginState.loggedOut;
      notifyListeners();
    }
  }

  Future<void> passReset(String email,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      print('passReset');
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      _loginState = ApplicationLoginState.loggedOut;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
      print('firebase auhentication error!');
      print('passReset Error:$e');
      _loginState = ApplicationLoginState.loggedOut;
      notifyListeners();
    }
  }

  Future<void> updateDisplayName(String dispalyName,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      print('updateDisplayName state');
      print(dispalyName);
      await _currentUser?.updateDisplayName(dispalyName);
      // await _currentUser
      //     ?.updatePhotoURL("https://example.com/jane-q-user/profile.jpg");
      _profileState = ProfileState.display;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
      print('firebase auhentication error!');
      print('updateDisplayName Error:$e');
    }
  }

  Future<void> updateEmail(String emailAddres,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      print('updateEmail state');
      print(emailAddres);
      await _currentUser?.updateEmail(emailAddres);
      // await FirebaseAuth.instance.setLanguageCode("jp");
      // await _currentUser?.sendEmailVerification();
      _profileState = ProfileState.display;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
      print('firebase auhentication error!');
      print('updateEmail Error:$e');
    }
  }

  Future<void> updatePhotoURL(String photoURL,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      print('updatePhotoURL state');
      print(photoURL);
      // await _currentUser
      //     ?.updatePhotoURL("https://example.com/jane-q-user/profile.jpg");
      await _currentUser?.updatePhotoURL(photoURL);
      _profileState = ProfileState.display;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
      print('firebase auhentication error!');
      print('updatePhotoURL Error:$e');
    }
  }

  Future<void> accountDelete(
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      print('accountDelete state');
      await _currentUser?.delete();
      _profileState = ProfileState.display;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
      print('firebase auhentication error!');
      print('accountDelete Error:$e');
    }
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
    // print('sign out-------');
    _loginState = ApplicationLoginState.loggedOut;
    notifyListeners();
  }
}

class RiderActivities {
  RiderActivities({
    required this.id,
    required this.uid,
    required this.activityTitle,
    required this.email,
  });
  final String id;
  final String uid;
  final String activityTitle;
  final String email;
}

class RiderInfo {
  RiderInfo({
    required this.uid,
    required this.riderName,
    required this.email,
  });
  final String uid;
  final String riderName;
  final String email;
}
// RiderActivities getRiderActivities(){
//   return 
// }
// Future<DocumentReference> addMessageToGuestBook(String message) {
//   if (_loginState != ApplicationLoginState.loggedIn) {
//     throw Exception('Must be logged in');
//   }
//   // print('addMessageToGuestBook');
//   // print('message:$message');
//   return FirebaseFirestore.instance
//       .collection('guestbook')
//       .add(<String, dynamic>{
//     'text': message,
//     'timestamp': DateTime.now().millisecondsSinceEpoch,
//     'name': FirebaseAuth.instance.currentUser!.displayName,
//     'uesrId': FirebaseAuth.instance.currentUser!.uid,
//   });
// }
