import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'model/rider_activity.dart';
import 'model/rider_info.dart';
import 'model/status.dart';
// import 'package:intl/intl_browser.dart';

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
        _riderInfo = RiderInfo(
            uid: user.uid.toString(),
            riderName: user.displayName.toString(),
            email: user.email.toString(),
            photoURL: user.photoURL.toString());

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
        // var now = new DateTime.now();
        // var berlinWallFell = new DateTime.utc(1989, 11, 9);
        // var moonLanding = DateTime.parse("1969-07-20 20:18:04Z");
        // _riderActivities = [
        //   RiderActivities(
        //     uid: 'jmUx5BeigyYVWQ1ysaWjq02oKao2',
        //     activityTitle: 'Ride1',
        //     // date: DateTime.parse("2022-05-03 7:00:04Z"),
        //     date: DateTime.utc(2022, 01, 03, 10, 30, 00),
        //     distance: 180,
        //     done: false,
        //   ),
        //   RiderActivities(
        //     uid: 'ltLWWdJvQ7RDVUvUMnDmloFnwwa2',
        //     activityTitle: 'Ride2',
        //     date: DateTime.parse(
        //         '2022-02-25 09:48:00'), //iso 年４桁　月、日、時、分、秒２桁　1桁はフォーマットエラー
        //     // date: DateTime.utc(2022, 05, 03, 10, 30),
        //     distance: 80,
        //     done: false,
        //   ),
        //   RiderActivities(
        //     uid: 'ltLWWdJvQ7RDVUvUMnDmloFnwwa3',
        //     activityTitle: 'Ride3',
        //     date: DateTime.parse('2022-03-30 10:48:00'), //iso
        //     // date: DateTime.utc(2022, 05, 03, 10, 30),
        //     distance: 50,
        //     done: false,
        //   ),
        // ];

        _activities = [
          Activities(
              plan: RiderActivities(
                  uid: 'jmUx5BeigyYVWQ1ysaWjq02oKao2',
                  activityTitle: '初詣ライド2022',
                  date: DateTime.parse("2022-01-03 09:00:00"),
                  // date: DateTime.utc(2022, 01, 03, 10, 30, 00),
                  distance: 78,
                  // time:0,
                  // avelageSpeed:0,
                  // vartical:0,
                  done: true,
                  startPoint: 'シティーライトフィットネス',
                  wayPoint: '由加神社',
                  finishPoint: 'シティーライトフィットネス',
                  couseURL:
                      'https://connect.garmin.com/modern/course/embed/87305420'),
              actual: ActualRide(
                rideURL:
                    'https://connect.garmin.com/modern/activity/embed/8052346097',
                ridePhotos: ['img1.jpeg', 'img2.jpeg'],
              ),
              menber: Menber(rider: ['Frend1', 'Frend2'])),
          Activities(
              plan: RiderActivities(
                  uid: 'ltLWWdJvQ7RDVUvUMnDmloFnwwa2',
                  activityTitle: '河津桜ライド2022',
                  // date: DateTime.utc(2022, 02, 03, 11, 30, 00),
                  date: DateTime.parse('2022-03-12 14:00:00'), //iso
                  distance: 50,
                  done: false,
                  startPoint: '自宅',
                  wayPoint: '入船橋（美観地区の南端）',
                  finishPoint: '自宅',
                  couseURL:
                      'https://connect.garmin.com/modern/course/embed/106611330'),
              actual: ActualRide(
                rideURL:
                    'https://connect.garmin.com/modern/activity/embed/8442710466',
                ridePhotos: ['img1.jpeg', 'img2.jpeg'],
              ),
              menber: Menber(rider: ['Frend1', 'Frend2', 'Frend3'])),
          Activities(
              plan: RiderActivities(
                  uid: 'ltLWWdJvQ7RDVUvUMnDmloFnwwa3',
                  activityTitle: '児島半島ライド',
                  // date: DateTime.utc(2022, 03, 03, 12, 30, 00),
                  date: DateTime.parse('2022-04-23 13:20:00'), //iso
                  distance: 60,
                  done: false,
                  startPoint: '自宅',
                  wayPoint: 'サウスビレッジ',
                  finishPoint: '自宅',
                  couseURL:
                      'https://connect.garmin.com/modern/course/embed/105823680'),
              // 'https://connect.garmin.com/modern/course/105823680'),
              actual: ActualRide(
                rideURL:
                    'https://connect.garmin.com/modern/activity/embed/8763155713',
                ridePhotos: ['img1.jpeg', 'img2.jpeg'],
              ),
              menber: Menber(rider: ['Frend1', 'Frend2', 'Frend3', 'Frend4'])),
        ];

        notifyListeners();
      } else {
        _loginState = ApplicationLoginState.loggedOut;
        _currentUser = null;
        // _riderActivities = [];
        _activities = [];
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
  // List<RiderActivities> _riderActivities = [];
  // List<RiderActivities> get riderActivities => _riderActivities;

  List<Activities> _activities = [];
  List<Activities> get activities => _activities;

  Activities _selectedActivity = Activities(
      plan: RiderActivities(
          uid: '',
          activityTitle: '',
          // date: DateTime.utc(2022, 03, 03, 12, 30, 00),
          date: DateTime.parse('2022-01-01 01:00:00'), //iso
          distance: 0,
          done: false,
          startPoint: '',
          wayPoint: '',
          finishPoint: '',
          couseURL: ''),
      actual: ActualRide(
        rideURL: '',
        ridePhotos: [],
      ),
      menber: Menber(rider: []));
  Activities get selectActivity => _selectedActivity;

  RiderInfo _riderInfo =
      RiderInfo(uid: '', riderName: '', email: '', photoURL: '');
  RiderInfo get riderInfo => _riderInfo;

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

  // void addRiderActivity(RiderActivities activities) {
  //   _riderActivities.add(activities);
  // }

  void addActivity(Activities activities) {
    _activities.add(activities);
    notifyListeners();
  }

  void setSelectedActivity(Activities activity, ActivityState status) {
    _selectedActivity = activity;
    print('setSelectActivity');
    print(activity.plan.activityTitle);
    print(activity.actual.rideURL);
    _activityState = status;
    notifyListeners();
  }
}

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
