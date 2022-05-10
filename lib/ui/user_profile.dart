import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../application_state.dart';
import '../../model/status.dart';
import './display_profile.dart';
import './display_name_update.dart';
import './PhotoURL_update.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    Key? key,
    required this.profileState,
    required this.currentUser,
    // required this.setProfileState,
    // required this.updateDisplayName,
  }) : super(key: key);
  final ProfileState profileState;
  final User? currentUser;
  // final void function(ProfileState status) setProfileState;
  //   final void function(String displayname) updateDisplayName;
  @override
  Widget build(BuildContext context) {
    // return Text('aaaa');
    switch (profileState) {
      case ProfileState.display:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DisplayProfile(
              user: currentUser,
            ),
            // EmailForm(
            //   setLoginState: setLoginState,
            //   verifyEmail: (email) => verifyEmail(email),
            // )
          ],
        );
      case ProfileState.dispalyNameUpdate:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DisplayNameUpdate(),
            // EmailForm(
            //   setLoginState: setLoginState,
            //   verifyEmail: (email) => verifyEmail(email),
            // )
          ],
        );
      case ProfileState.photoUpdate:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PhotourlUpdate(
                // user: currentUser,
                // setProfileUpdateState: setProfileUpdateState
                ),
            // EmailForm(
            //   setLoginState: setLoginState,
            //   verifyEmail: (email) => verifyEmail(email),
            // )
          ],
        );
      default:
        return Column(
          children: [
            TextButton(
              onPressed: () {
                // signOut();
              },
              child: const Text('Error go home'),
            ),
          ],
        );
    }
  }
  // Widget build(BuildContext context) {
  //   switch (profileUpdateState) {
  //     case ProfileUpdateState.display:
  //       return Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           DisplayProfile(
  //               // setLoginState: setLoginState,
  //               // verifyEmail: (email) => verifyEmail(email),
  //               )
  //         ],
  //       );
  //     case ProfileUpdateState.dispalyNameUpdate:
  //       return Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           DisplayNameUpdate(
  //               // setLoginState: setLoginState,
  //               // verifyEmail: (email) => verifyEmail(email),
  //               )
  //         ],
  //       );
  //   }
  // return Column(children: [
  //   Consumer<ApplicationState>(builder: (context, appState, _) {
  //     return Column(
  //       children: [
  //         const SizedBox(
  //           height: 16,
  //         ),
  //         const CircleAvatar(
  //           backgroundImage:
  //               NetworkImage('images/undraw_profile_pic_ic5t.png'),
  //           minRadius: 50,
  //           maxRadius: 100,
  //         ),
  //         const SizedBox(
  //           height: 16,
  //         ),
  //         Text(
  //           appState.getCurrentUser!.displayName.toString(),
  //           style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
  //         ),
  //         const SizedBox(
  //           height: 8,
  //         ),
  //         Text(
  //           appState.getCurrentUser!.email.toString(),
  //           style:
  //               const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
  //         ),
  //         const SizedBox(
  //           height: 32,
  //         ),
  //       ],
  //     );
  //   })
  // ]);
  // }
}
