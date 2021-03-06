import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
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

    FirebaseAuth.instance.userChanges().listen((user) async {
      print('ApplicationState init userChanges------ start ');
      if (user != null) {
        print('userChanges logged in');
        _currentUser = user;
        if (user.emailVerified == false) {
          _loginState = ApplicationLoginState.welcom;
        } else {
          _loginState = ApplicationLoginState.loggedIn;
          //firestore----------------------------------

          //strage-------------------------------------
          // FirebaseStorage storage = FirebaseStorage.instance;

        }

        // print('userChanges logged in');
        // print(user.uid);
        // print(user.email);
        // print(user.displayName);
        // print(user.emailVerified);
        // print('photoURL: ${user.photoURL}');

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

        //Rider??????----------------------------------------------------
        // _riderInfo = RiderInfo(
        //     uid: user.uid, riderName: user.displayName, email: user.email);

        _riderInfo = RiderInfo(
            uid: user.uid.toString(),
            riderName: user.displayName.toString(),
            email: user.email.toString(),
            photoURL: user.photoURL ?? '');
        print('RiderInfo------${_riderInfo.uid} ');
        print('RiderInfo------${_riderInfo.riderName} ');
        //Activity??????-------------------------------------------------
        // getActivities();
        // final ref = FirebaseFirestore.instance.collection("activities").withConverter(
        //   fromFirestore: Activities.fromFirestore,
        //   toFirestore: (Activities _selectedActivity, _) =>  _selectedActivity.toFirestore(),
        // );
        // final docSnap = ref.get();
        // final _activities = docSnap.data(); // Convert to City object
        // if (_activities != null) {
        //   print(_activities);
        // } else {
        //   print("No such document.");
        // }

        // FirebaseFirestore.instance.collection("activities").get().then(
        //       (res) => print("Successfully completed"),
        //       onError: (e) => print("Error completing: $e"),
        //     );
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
        //         '2022-02-25 09:48:00'), //iso ????????????????????????????????????????????????1?????????????????????????????????
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

      //   _activities = [
      //     Activities(
      //       plan: RiderActivities(
      //         uid: 'jmUx5BeigyYVWQ1ysaWjq02oKao2',
      //         activityTitle: '???????????????2022',
      //         date: DateTime.parse("2022-01-03 09:00:00"),
      //         // date: DateTime.utc(2022, 01, 03, 10, 30, 00),
      //         distance: 78,
      //         // time:0,
      //         // avelageSpeed:0,
      //         // vartical:0,
      //         done: true,
      //         startPoint: '???????????????????????????????????????',
      //         wayPoint: '????????????',
      //         finishPoint: '???????????????????????????????????????',
      //         couseURL: 'https://connect.garmin.com/modern/course/embed/87305420',
      //         prefacture: ['??????', '??????', '??????', '??????', '??????'],
      //         rideType: 'Event',
      //       ),
      //       actual: ActualRide(
      //         rideURL:
      //             'https://connect.garmin.com/modern/activity/embed/8052346097',
      //         ridePhotos: [
      //           'img8360.jpg',
      //           'img8372.jpg',
      //           'img8414.jpg',
      //           'img8426.jpg',
      //           'img8438.jpg',
      //           'img8447.jpg',
      //         ],
      //       ),
      //       menber: Menber(rider: ['??????', '??????', '??????']),
      //       shared: true,
      //       tags: ['??????', '????????????', '????????????', '???????????????', 'UNO HOTEL'],
      //       createdAt: DateTime.now(),
      //       updateAt: DateTime.now(),
      //       status: 'active',
      //     ),
      //     Activities(
      //       plan: RiderActivities(
      //         uid: 'ltLWWdJvQ7RDVUvUMnDmloFnwwa2',
      //         activityTitle: '??????????????????2022',
      //         // date: DateTime.utc(2022, 02, 03, 11, 30, 00),
      //         date: DateTime.parse('2022-03-12 14:00:00'), //iso
      //         distance: 50,
      //         done: false,
      //         startPoint: '??????',
      //         wayPoint: '????????????????????????????????????',
      //         finishPoint: '??????',
      //         couseURL:
      //             'https://connect.garmin.com/modern/course/embed/106611330',
      //         prefacture: ['??????'],
      //         rideType: 'Evevt', //'training',
      //       ),
      //       actual: ActualRide(
      //         rideURL: '',
      //         // 'https://connect.garmin.com/modern/activity/embed/8442710466',
      //         ridePhotos: [],
      //       ),
      //       menber: Menber(rider: ['??????', '??????', '??????', '??????', '???????????????????????????', '??????']),
      //       shared: true,
      //       tags: ['?????????', '????????????', '??????', '???????????????', '?????????????????????????????????'],
      //       createdAt: DateTime.now(),
      //       updateAt: DateTime.now(),
      //       status: 'active',
      //     ),
      //     Activities(
      //       plan: RiderActivities(
      //         uid: 'ltLWWdJvQ7RDVUvUMnDmloFnwwa3',
      //         activityTitle: '?????????????????????',
      //         // date: DateTime.utc(2022, 03, 03, 12, 30, 00),
      //         date: DateTime.parse('2022-04-23 13:20:00'), //iso
      //         distance: 60,
      //         done: false,
      //         startPoint: '??????',
      //         wayPoint: '?????????????????????',
      //         finishPoint: '??????',
      //         couseURL:
      //             'https://connect.garmin.com/modern/course/embed/105823680',
      //         prefacture: ['??????'],
      //         rideType: 'TtrainingShort',
      //       ), //'training','event'
      //       actual: ActualRide(
      //         rideURL: '',
      //         // 'https://connect.garmin.com/modern/activity/embed/8763155713',
      //         ridePhotos: [],
      //       ),
      //       menber: Menber(rider: []),
      //       shared: true,
      //       tags: [],
      //       createdAt: DateTime.now(),
      //       updateAt: DateTime.now(),
      //       status: 'active',
      //     ),
      //   ];
      // print(_activities);
      getActivities();
      //   _activities.clear();
      //   final ref = FirebaseFirestore.instance
      //       .collection("activities")
      //       .orderBy('plan.date', descending: false)
      //       .withConverter<Activities>(
      //         fromFirestore: Activities.fromFirestore,
      //         toFirestore: (Activities selectedActivity, _) =>
      //             selectedActivity.toFirestore(),
      //       );
      //   await ref
      //       .get()
      //       .then((QuerySnapshot querySnapshot) => {
      //             querySnapshot.docs.forEach((doc) {
      //               print(
      //                   "get -++-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+");
      //               print(doc.id);
      //               print(doc["plan.uid"]);
      //               Activities _selectedActivity = Activities(
      //                 plan: RiderActivities(
      //                   uid: doc["plan.uid"],
      //                   activityTitle: doc["plan.activityTitle"],
      //                   date: doc["plan.date"].toDate(),
      //                   distance: doc["plan.distance"],
      //                   done: doc["plan.done"],
      //                   startPoint: doc["plan.startPoint"],
      //                   wayPoint: doc["plan.wayPoint"],
      //                   finishPoint: doc["plan.finishPoint"],
      //                   couseURL: doc["plan.couseURL"],
      //                   prefacture: List<String>.from(doc['plan.prefacture']),
      //                   rideType: doc["plan.rideType"],
      //                 ),
      //                 actual: ActualRide(
      //                   rideURL: doc["actual.rideURL"],
      //                   ridePhotos: List<String>.from(doc['actual.ridePhotos']),
      //                 ),
      //                 menber: Menber(
      //                   rider: List<String>.from(doc['menber.rider']),
      //                 ),
      //                 shared: doc["shared"],
      //                 tags: List<String>.from(doc['tags']),
      //                 createdAt: doc["createdAt"].toDate(),
      //                 updateAt: doc["updateAt"].toDate(),
      //                 status: doc["status"],
      //                 id: doc.id,
      //               );

      //               _activities.add(_selectedActivity);
      //             })
      //           })
      //       .catchError(
      //           (error) => debugPrint("Failed to add Activities: $error"));
      //   notifyListeners();
    });

    // FirebaseFirestore.instance.collection('activities')
    //       .orderBy('createdAt', descending: true)
    //       .snapshots()
    //       .listen(
    //         (snapshot) {
    //         for (final document in snapshot.docs) {
    //         _activities.add(
    //           Activities(
    //             plan: RiderActivities(
    //               uid: document.data()['uid'] as String,
    //               activityTitle: document.data()['plan.activityTitle'] as String,
    //               date: document.data()['date'] as DateTime,
    //               distance: document.data()['plan.distance'] as int,
    //               done: document.data()['plan.done'] as bool,
    //               startPoint: document.data()['plan.startPoint'] as String,
    //               wayPoint: document.data()['plan.wayPoint'] as String,
    //               finishPoint: document.data()['plan.finishPoint'] as String,
    //               couseURL: document.data()['plan.couseURL'] as String,
    //               prefacture: document.data()['plan.prefacture'] as List<String>,
    //               rideType: document.data()['plan.rideType'] as String,
    //             ),

    //             actual: ActualRide(
    //               rideURL: document.data()['actual.rideURL'] as String,
    //               ridePhotos: document.data()['actual.ridePhotos'] as List<String>,
    //             ),

    //             menber: Menber(
    //               rider:document.data()['menber.rider'] as List<String>
    //             ),
    //             shared: document.data()['shared'] as bool,
    //             tags: document.data()['tags'] as List<String>,
    //             createdAt: document.data()['createAt'] as DateTime,
    //             updateAt: document.data()['updateAt'] as DateTime,
    //             status: document.data()['status'] as String,
    //           )
    //         );
    //         }
    //       })
    // .then((value) => debugPrint("geted Activities"))
    // .catchError((error) => debugPrint("Failed to get Activities: $error"));

    // GuestBookMessage(
    //     name: document.data()['name'] as String,
    //     message: document.data()['text'] as String),
    // );
    // })
    // .then((value) => debugPrint("geted Activities"))
    // .catchError((error) => debugPrint("Failed to get Activities: $error"));
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
  HomeState _homeState = HomeState.display;
  HomeState get homeState => _homeState;
  RiderState _riderState = RiderState.display;
  RiderState get riderState => _riderState;
  String? _email;
  String? get email => _email;

  List<Activities> _activities = <Activities>[];
  List<Activities> get activities => _activities;
  Activities _selectedActivity = Activities(
    plan: RiderActivities(
      uid: '',
      activityTitle: '',
      date: DateTime.now(),
      distance: 0,
      done: false,
      startPoint: '',
      wayPoint: '',
      finishPoint: '',
      couseURL: '',
      prefacture: [],
      rideType: '',
    ),
    actual: ActualRide(
      rideURL: '',
      ridePhotos: [],
    ),
    menber: Menber(rider: []),
    shared: true,
    tags: [],
    createdAt: DateTime.now(),
    updateAt: DateTime.now(),
    status: 'active',
    id: '',
  );
  // Activities _selectedActivity = Activities(
  //     plan: RiderActivities(
  //         uid: '',
  //         activityTitle: 'Activity Title',
  //         // date: DateTime.utc(2022, 03, 03, 12, 30, 00),
  //         date: DateTime.parse('2022-01-01 01:00:00'), //iso
  //         distance: 0,
  //         done: false,
  //         startPoint: 'Start point',
  //         wayPoint: 'Way point',
  //         finishPoint: 'Finish Point',
  //         couseURL: 'https://connect.garmin.com/modern/course/embed/105823680'),
  //     actual: ActualRide(
  //       rideURL: '',
  //       ridePhotos: [],
  //     ),
  //     menber: Menber(rider: []));
  Activities get selectActivity => _selectedActivity;
  // set clearSelectedActivity(Activities clear) {
  //   _selectedActivity = clear;
  // }

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  String _changedMapURL = '';
  String get changedMapURL => _changedMapURL;
  void setChangedMapURL(String url) {
    _changedMapURL = url;
    notifyListeners();
  }

  List<String> downloadUrls = <String>[];

  RiderInfo _riderInfo =
      RiderInfo(uid: '', riderName: '', email: '', photoURL: '');
  RiderInfo get riderInfo => _riderInfo;

  // String _user = "";
  // String get getUser => _user;

  User? _currentUser;
  User? get currentUser => _currentUser;
  User? get getCurrentUser => _currentUser;

  void setProfileState(ProfileState status) {
    _profileState = status;
    notifyListeners();
  }

  void setHomeState(HomeState status) {
    _homeState = status;
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
        _loginState = ApplicationLoginState.password; //???????????????
      } else {
        _loginState = ApplicationLoginState.register; //???????????????
      }
      _email = email; //?????????????????????????????????
      notifyListeners(); //_loginState????????????????????????????????????????????????
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

  //firestore get -----------------------------------------------
  Future<void> getActivities() async {
    print('getActivities()----start');
    // ??????????????????????????????????????????????????????????????????
    // FirebaseFirestore.instance
    //     .collection("activities")
    //     .where("done", isEqualTo: true)
    //     .get()
    //     .then(
    //       (res) => print("Successfully completed %%%%%%%%%"),
    //       onError: (e) => print("Error completing: $e"),
    //     );
    //??????????????????????????????????????????????????????????????????
    // firestore get ----------------------------------
    // print('firestore get activities-------------------------');
    // FirebaseFirestore.instance.collection('activities').get().then((value) {
    //   for (var doc in value.docs) {
    //     debugPrint("firestore get activities ${doc.id} => ${doc.data()}");
    //   }
    // }).catchError((error) => debugPrint("Failed to get Activities: $error"));
    //???????????? ??????????????????
    _activities.clear();
    final ref = FirebaseFirestore.instance
        .collection("activities")
        .orderBy('plan.date', descending: false)
        .withConverter<Activities>(
          fromFirestore: Activities.fromFirestore,
          toFirestore: (Activities selectedActivity, _) =>
              selectedActivity.toFirestore(),
        );
    await ref
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                debugPrint(
                    "get -++-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+");
                debugPrint('dic:id:${doc.id}');
                // print(
                //     "-get ++-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+");
                // print(doc["plan.uid"]);
                // print(doc["plan.activityTitle"]);
                // print(doc["plan.date"]);
                // print(doc["plan.distance"]);
                // print(doc["plan.done"]);
                // print(doc["plan.startPoint"]);
                // print(doc["plan.wayPoint"]);
                // print(doc["plan.finishPoint"]);
                // print(doc["plan.couseURL"]);
                // print(doc["plan.prefacture"]);
                // print(doc["plan.rideType"]);

                // print(doc["actual.rideURL"]);
                // print(doc["actual.ridePhotos"]);
                // print(doc["menber.rider"]);
                // print(doc["shared"]);
                // print(doc["tags"]);
                // print(doc["createdAt"]);
                // print(doc["createdAt"]);
                // print(doc["status"]);
                // List<QueryDocumentSnapshot<Activities>> selectedActivity1 =
                //     querySnapshot.docs.toList();
                // List<Activities> selectedActivity1 =
                //     querySnapshot.docs.toList();

                Activities _selectedActivity = Activities(
                  plan: RiderActivities(
                    uid: doc["plan.uid"],
                    activityTitle: doc["plan.activityTitle"],
                    date: doc["plan.date"].toDate(),
                    distance: doc["plan.distance"],
                    done: doc["plan.done"],
                    startPoint: doc["plan.startPoint"],
                    wayPoint: doc["plan.wayPoint"],
                    finishPoint: doc["plan.finishPoint"],
                    couseURL: doc["plan.couseURL"],
                    prefacture: List<String>.from(doc['plan.prefacture']),
                    //Firestore???List<String>????????????????????????????????????List<dynamic>???????????????
                    //????????????????????????
                    // imageUrls: List<String>.from(map['imageUrls']),
                    // (map['imageUrls'] as List)?.map((item) => item as String)?.toList();
                    //imageUrls: <String>[...map['imageUrls']],
                    rideType: doc["plan.rideType"],
                  ),
                  actual: ActualRide(
                    rideURL: doc["actual.rideURL"],
                    ridePhotos: List<String>.from(doc['actual.ridePhotos']),
                  ),
                  menber: Menber(
                    rider: List<String>.from(doc['menber.rider']),
                  ),
                  shared: doc["shared"],
                  tags: List<String>.from(doc['tags']),
                  createdAt: doc["createdAt"].toDate(),
                  updateAt: doc["updateAt"].toDate(),
                  status: doc["status"],
                  id: doc.id,
                );
                _activities.add(_selectedActivity);
              })
            })
        .catchError((error) => debugPrint("Failed to add Activities: $error"));
    notifyListeners();
  }

  //firestore add withconverter -----------------------------------------------
  Future<void> addActivityFiresore(Activities activity) async {
    // print('addActivityFiresore----------------');
    if (_loginState != ApplicationLoginState.loggedIn) {
      throw Exception('Must be logged in');
    }
    // print('activity:$activity');
    // print('docData activities data------');

    // firestore nested object- - - - - - - - - - - -
    //?????????????????????????????????????????????????????????????????????
    // withConverter, fromFirestore, toFirestore?????????????????????
    Activities docData = Activities(
      plan: RiderActivities(
        uid: _riderInfo.uid,
        activityTitle: activity.plan.activityTitle,
        date: activity.plan.date,
        distance: activity.plan.distance,
        done: activity.plan.done,
        startPoint: activity.plan.startPoint,
        wayPoint: activity.plan.wayPoint,
        finishPoint: activity.plan.finishPoint,
        couseURL: activity.plan.couseURL,
        prefacture: activity.plan.prefacture,
        rideType: activity.plan.rideType,
      ),
      actual: ActualRide(
        rideURL: activity.actual.rideURL,
        ridePhotos: activity.actual.ridePhotos,
      ),
      menber: Menber(rider: activity.menber.rider),
      shared: activity.shared,
      tags: activity.tags,
      createdAt: activity.createdAt,
      updateAt: activity.updateAt,
      status: activity.status,
      id: '',
    );
    // print(docData);
    return FirebaseFirestore.instance
        .collection("activities")
        .withConverter(
          fromFirestore: Activities.fromFirestore,
          toFirestore: (Activities docData, options) => docData.toFirestore(),
        )
        .add(docData)
        .then((value) => debugPrint("Activities Added"))
        .catchError((error) => debugPrint("Failed to add Activities: $error"));

    // firestore add object--------------------------
    //?????????????????????????????????????????????????????????????????????
    // final docData = {
    //   "shared": true,
    //   "tags": activity.tags,
    //   "createdAt": Timestamp.now(),
    //   "updateAt": Timestamp.now(),
    //   "status": "active"
    // };
    // final plan = {
    //   "uid": _riderInfo.uid,
    //   "activityTitle": activity.plan.activityTitle,
    //   // "date": DateTime.parse('2022-01-01 01:00:00'), //iso
    //   "date": activity.plan.date, //iso
    //   "distance": activity.plan.distance,
    //   "done": false,
    //   "startPoint": activity.plan.startPoint,
    //   "wayPoint": activity.plan.wayPoint,
    //   "finishPoint": activity.plan.finishPoint,
    //   // "couseURL": 'https://connect.garmin.com/modern/course/embed/105823680',
    //   "couseURL": activity.plan.couseURL,
    //   "prefacture": activity.plan.prefacture,
    //   "rideType": activity.plan.rideType,
    // };
    // final actual = {
    //   // "rideURL": 'https://connect.garmin.com/modern/course/embed/105823680',
    //   "rideURL": activity.actual.rideURL,
    //   "ridePhotos": activity.actual.ridePhotos,
    // };
    // final menber = {
    //   "rider": activity.menber.rider,
    // };
    // docData["plan"] = plan;
    // docData["actual"] = actual;
    // docData["menber"] = menber;
    // print(docData);
    // return FirebaseFirestore.instance
    //     .collection('activities')
    //     .add(docData)
    //     .then((value) => debugPrint("Activities Added"))
    //     .catchError((error) => debugPrint("Failed to add Activities: $error"));
  }

  //strage--------------------------------------------------

  // void addActivityStrage(Activities selectedActivity) {
  //   print('addActivityStrage');
  // }

  void addPlan(Activities selectedActivity) {
    _selectedActivity = selectedActivity;
    _activityState = ActivityState.activityAdd;
    notifyListeners();
  }

  void addActivity(Activities selectedActivity) {
    print('addActivity-----------------------------');
    //firestore add-------------------------------------------------
    addActivityFiresore(selectedActivity);
    _activities.add(selectedActivity);
    _activityState = ActivityState.display;
    notifyListeners();
  }

  void setHomeSelectedActivity(Activities activity, HomeState status) {
    _selectedActivity = activity;
    _homeState = status;
    notifyListeners();
  }

  void setSelectedActivity(Activities activity, ActivityState status) {
    _selectedActivity = activity;
    _activityState = status;
    notifyListeners();
  }

  // void setSelectedActivity(
  //     Activities activity, ActivityState status, int index) {
  //   _selectedActivity = activity;
  //   _selectedIndex = index;
  //   _activityState = status;
  //   notifyListeners();
  // }

// Activities _selectedActivity = Activities(
//       plan: RiderActivities(
//           uid: '',
//           activityTitle: '',
//           // date: DateTime.utc(2022, 03, 03, 12, 30, 00),
//           date: DateTime.parse('2022-01-01 01:00:00'), //iso
//           distance: 0,
//           done: false,
//           startPoint: '',
//           wayPoint: '',
//           finishPoint: '',
//           couseURL: ''),
//       actual: ActualRide(
//         rideURL: '',
//         ridePhotos: [],
//       ),
//       menber: Menber(rider: []));
  void setCouseURL(String url) {
    // print('setCouseURL');
    // _selectedActivity = Activities(
    //     plan: RiderActivities(
    //         uid: _selectedActivity.plan.uid,
    //         activityTitle: _selectedActivity.plan.activityTitle,
    //         date: _selectedActivity.plan.date, //iso
    //         distance: _selectedActivity.plan.distance,
    //         done: false,
    //         startPoint: _selectedActivity.plan.startPoint,
    //         wayPoint: _selectedActivity.plan.wayPoint,
    //         finishPoint: _selectedActivity.plan.finishPoint,
    //         couseURL: url),
    //     actual: ActualRide(
    //       rideURL: _selectedActivity.actual.rideURL,
    //       ridePhotos: _selectedActivity.actual.ridePhotos,
    //     ),
    //     menber: Menber(rider: _selectedActivity.menber.rider));
    notifyListeners();
  }

  // Future<void> addActivityPhotos(List pickedImages) async {
  //   print('addActivityPhotos');
  //   pickedImages.forEach((element) {
  //     print(element);
  //   });
  // }F

  // FirebaseStorage _storage = FirebaseStorage.instance;
  Future uploadImage(MediaInfo imageInfo) async {
    try {
      if (imageInfo == null) return;
      final firebaseStorageLocation =
          FirebaseStorage.instance.ref().child('images');
      // final imageInfo = imageInfo as MediaInfo;
      // imageInfo as MediaInfo;
      final firebasefileLocation = firebaseStorageLocation
          .child('${DateTime.now()}_${imageInfo.fileName!}');
      await firebasefileLocation.putData(
          imageInfo.data!,
          SettableMetadata(
            contentType: "image/jpeg",
            // customMetadata: {
            //   "location": "Yosemite, CA, USA",
            //   "activity": "Hiking",
            // },
          ));
      final downloadURL = await firebasefileLocation.getDownloadURL();
      // print('urlToUseLater.runtimeType: ${urlToUseLater.runtimeType}');
      // print('downloadURL: $downloadURL');
      // downloadUrls.add(urlToUseLater);
      // print('downloadUrls1: $downloadUrls');
      return downloadURL;
    } on FirebaseException catch (e) {
      debugPrint('firebase strage upload image Error: $e');
    }
  }

  // Future<String> strageUpload(MediaInfo imageInfo) async {
  //     await Future.delayed(Duration(seconds: 10));
  //     return imageInfo.fileName as String ;
  // }

  Future<void> storeUpdate(
      String RideLinkURL,
      DateTime rideDate,
      // List<MediaInfo> pickedImagesInfo,
      bool rideDone,
      String id,
      List<String> url) async {
    // print('storeUpdate #########');
    // print(id);
    try {
      await FirebaseFirestore.instance.collection("activities").doc(id)
          // .withConverter(
          //   fromFirestore: Activities.fromFirestore,
          //   toFirestore: (Activities docData, options) => docData.toFirestore(),
          // )
          // .update({"plan.done": true,"actual.rideURL":RideLinkURL});
          .update({
        "plan.done": rideDone,
        "plan.date": rideDate,
        "actual.rideURL": RideLinkURL,
        // "actual.rideURL": 'https://aaa',
        "actual.ridePhotos": url,
        "updateAt": DateTime.now(),
      });
      // print('update ok');
    } on FirebaseException catch (e) {
      debugPrint('firebase store upload Error: $e');
    }
    // await FirebaseFirestore.instance
    //     .collection("activities").doc(id)
    //     // .withConverter(
    //     //   fromFirestore: Activities.fromFirestore,
    //     //   toFirestore: (Activities docData, options) => docData.toFirestore(),
    //     // )
    //     .update({"plan.done": true})
    //     // .update({"plan.done": true,"actual.rideURL":RideLinkURL})
    //     .then((value) => debugPrint("Activities updateed"))
    //     .catchError((error) => debugPrint("Failed to add Activities: $error"));
  }

  // setActual <MediaInfo>[] ---------------------------------------------
  Future<void> setActual(String RideLinkURL, DateTime rideDate,
      List<MediaInfo> pickedImagesInfo, bool rideDone, String id) async {
    // print('setActual id:$id');
    // print('setActual 2-1 async await--------');
    // print('strageUpload1 +++');

    //Frebase strage?????????????????????
    List<String> url = <String>[];
    await Future.forEach(pickedImagesInfo, (MediaInfo imageInfo) async {
      final downloadURL = await uploadImage(imageInfo);
      url.add(downloadURL);
      // await Future.delayed(Duration(seconds: 5));
      // print('strageUpload2 +++ imageInfo.fileName:${imageInfo.fileName!}');
    });
    // print('strageUpload3 +++');
    // url = await strageUpload(pickedImagesInfo);
    // print('setActual 2-2 async await--------');
    // print('setActual 2-3 url: $url');

    //Frebase store?????????
    await storeUpdate(RideLinkURL, rideDate, rideDone, id, url);
    // print('setActual 2-4 async await--------');
    // downloadUrls = <String>[];
    // print('strageUpload');
    // pickedImagesInfo.forEach((imageInfo) async {
    //   print('fileName: ${imageInfo.fileName}');
    //   await uploadImage(imageInfo);
    // });

    // await strageUpload(pickedImagesInfo)
    //     .then((value) => storeUpdate())
    //     .catchError((error) => debugPrint("Failed to upload image: $error"));

    // print('downloadUrls3: $downloadUrls');
    //   if (_imageInfo == null) return;
    //   final firebaseStorageLocation =
    //       FirebaseStorage.instance.ref().child('images');
    //   final imageInfo = _imageInfo as MediaInfo;
    //   _imageInfo as MediaInfo;
    //   final firebasefileLocation = firebaseStorageLocation
    //       .child('${DateTime.now()}_${imageInfo.fileName!}');
    //   await firebasefileLocation.putData(
    //       imageInfo.data!,
    //       SettableMetadata(
    //         contentType: "image/jpeg",
    //         customMetadata: {
    //           "location": "Yosemite, CA, USA",
    //           "activity": "Hiking",
    //         },
    //       ));
    //   final urlToUseLater = await firebasefileLocation.getDownloadURL();
    //   print('urlToUseLater $urlToUseLater');

    // Activities _selectedActivity = Activities(
    //   plan: RiderActivities(
    //     uid: '',
    //     activityTitle: '',
    //     date: DateTime.now(),
    //     distance: 0,
    //     done: false,
    //     startPoint: '',
    //     wayPoint: '',
    //     finishPoint: '',
    //     couseURL: '',
    //     prefacture: [],
    //     rideType: '',
    //   ),
    //   actual: ActualRide(
    //     rideURL: '',
    //     ridePhotos: [],
    //   ),
    //   menber: Menber(rider: []),
    //   shared: true,
    //   tags: [],
    //   createdAt: DateTime.now(),
    //   updateAt: DateTime.now(),
    //   status: 'active',
    //   id: '',
    // );
    //------------------------------------------
    //selected activity ????????????
    // _selectedActivity.actual.ridePhotos = [];
    // _selectedActivity.actual.ridePhotos = [];
    //---------------------------------------------------------------
    await getActivities();
    _activityState = ActivityState.display;
    print('setActual end---------');
    notifyListeners();
  }

  //setActual pickedImage <Image>[]-----------------------------------------
  // Future setActual(String RideLinkURL, DateTime rideDate,
  // List<Image> pickedImages, bool rideDone) async {
  // Future setActual(String RideLinkURL, DateTime rideDate,
  //     List<Uint8List> pickedbytes, bool rideDone) async {
  // print('setActual-start');
  // <iframe src='https://connect.garmin.com/modern/activity/embed/8763156143' title='???????????????????????????????????????2??????' width='465' height='500' frameborder='0'></iframe>
  // print('setActual pickedbytes: $pickedbytes');
  // print(pickedImages[0].image);
  // pickedImages.map((img) => print('img.image'));
  // pickedImages.forEach(((img) {
  //   print(img.image);
  // }));

  // Uint8List? _unit8list = MemoryImage(pickedImages[0].image) as Uint8List?;

  // File.fromRawPath(Uint8List uint8List);

  // try {
  //   // Upload raw data.
  //   await FirebaseStorage.instance.ref().child("/").putData(pickedImages[0]);
  //   debugPrint("Photos add Strage");
  // } on FirebaseException catch (error) {
  //   debugPrint("Failed to Photos add Strage: $error");
  // }

  // File file = File.fromRawPath(pickedImages[0].image);
  // Uint8List? _unit8list = MemoryImage(pickedImages[0].image) as Uint8List?;
  // print(_unit8list);
  // File file = File.fromRawPath(pickedImages[0].image);
  // File file = File.fromRawPath(_unit8list!);
  // print(file);
  // FirebaseStorage.instance.ref("test/").putFile(file);

  //[Image(image: MemoryImage(Uint8List#08fa3, scale: 1), frameBuilder: null, loadingBuilder: null, alignment: Alignment.center, this.excludeFromSemantics: false, filterQuality: low)]
  // addActivityPhotos(pickedImages);
  //     try {
  //   // Upload raw data.
  //   await mountainsRef.putData(data);
  // } on firebase_core.FirebaseException catch (e) {
  //   // ...
  // }
  // final storage = FirebaseStorage.instance;
  // final storageRef = FirebaseStorage.instance.ref();
  // final imagesRef = storageRef.child("/");
  // print(storageRef);
  // print(imagesRef);

  // try {
  //   await imagesRef.putData(pickedImages[0].image);
  //   print('putData');
  // } on FirebaseAuthException catch (e) {
  //   print('Failed add strage : ${e.code}');
  //   print(e.message);
  //   print('putData error');
  // }
  // print('putData error');
  // print('setActual-finish');

  // try {
  //   // Upload raw data.
  //   FirebaseStorage.instance.ref().child("/").putFile(pickedImages[0].image)
  //   await imagesRef.putData(pickedImages[0].image);
  // // ignore: nullable_type_in_catch_clause
  // } on firebase_core.FirebaseException catch (e) {
  //   // ...
  // }
  // pickedImages.map((img) => {
  //       imagesRef
  //           .putFile(pickedImages[0].image)
  //           // .putData(img.image)
  //           .then((value) => debugPrint("Photos add Strage"))
  //           .catchError(
  //               (error) => debugPrint("Failed to Photos add Strage: $error"))
  //     });
  // } on firebase_core.FirebaseException catch (e) {
  //   // ...
  // }
  // List<String> _ridePhotos = [
  //   'img8360.jpg',
  //   'img8372.jpg',
  // ];
  // _activities[selectedIndex] = Activities(
  //   plan: RiderActivities(
  //     uid: _activities[selectedIndex].plan.uid,
  //     activityTitle: _activities[selectedIndex].plan.activityTitle,
  //     // date: _activities[selectedIndex].plan.date, //iso
  //     date: rideDate,
  //     distance: _activities[selectedIndex].plan.distance,
  //     done: rideDone,
  //     startPoint: _activities[selectedIndex].plan.startPoint,
  //     wayPoint: _activities[selectedIndex].plan.wayPoint,
  //     finishPoint: _activities[selectedIndex].plan.finishPoint,
  //     couseURL: _activities[selectedIndex].plan.couseURL,
  //     prefacture: _activities[selectedIndex].plan.prefacture,
  //     rideType: _activities[selectedIndex].plan.rideType,
  //   ),
  //   actual: ActualRide(
  //     // rideURL: _activities[selectedIndex].actual.rideURL,
  //     rideURL: RideLinkURL,
  //     // ridePhotos: _activities[selectedIndex].actual.ridePhotos,
  //     ridePhotos: _ridePhotos,
  //   ),
  //   menber: Menber(rider: _activities[selectedIndex].menber.rider),
  //   shared: true,
  //   tags: _activities[selectedIndex].tags,
  //   createdAt: DateTime.now(),
  //   updateAt: DateTime.now(),
  //   status: 'active',
  // );
  //
  // _activityState = ActivityState.display;
  // notifyListeners();
  // print('setActual-end');
  // }
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
