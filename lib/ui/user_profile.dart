import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../application_state.dart';
import '../../model/status.dart';
import '../pages/home.dart';
import './display_profile.dart';
import './display_name_update.dart';
import './photourl_update.dart';
import 'email_update.dart';
import 'remove_account.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    Key? key,
    required this.profileState,
    required this.currentUser,
    required this.setProfileState,
    required this.updateDisplayName,
    required this.updateEmail,
    required this.accountDelete,
  }) : super(key: key);
  final ProfileState profileState;
  final User? currentUser;
  final void Function(ProfileState status) setProfileState;
  final void Function(
    String displayname,
    void Function(Exception e) error,
  ) updateDisplayName;
  final void Function(
    String emailAddress,
    void Function(Exception e) error,
  ) updateEmail;
  final void Function(
    void Function(Exception e) error,
  ) accountDelete;
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
              setProfileState: setProfileState,
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
            DisplayNameUpdate(
                user: currentUser,
                setProfileState: setProfileState,
                updateDisplayName: (displayName) {
                  updateDisplayName(
                      displayName,
                      (e) => _showErrorDialog(
                          context, 'Failed Update DisplayName', e));
                }),
          ],
        );
      case ProfileState.photoUpdate:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PhotourlUpdate(
              user: currentUser,
              setProfileState: setProfileState,
            )
          ],
        );
      case ProfileState.emailUpdate:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EmailUpdate(
                user: currentUser,
                setProfileState: setProfileState,
                updateEmail: (emailAddress) {
                  updateEmail(
                      emailAddress,
                      (e) => _showErrorDialog(
                          context, 'Failed Update DisplayName', e));
                }),
          ],
        );
      case ProfileState.removeAccount:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RemoveAccount(
                user: currentUser,
                setProfileState: setProfileState,
                accountDelete: () {
                  accountDelete((e) => _showErrorDialog(
                      context, 'Failed Update DisplayName', e));
                }),
          ],
        );
      default:
        return Column(
          children: [
            TextButton(
              onPressed: () {
                // signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: const Text('Error go home'),
            ),
          ],
        );
    }
  }
}

void _showErrorDialog(BuildContext context, String title, Exception e) {
  showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(fontSize: 24),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  '${(e as dynamic).message}',
                  style: const TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      });
}
