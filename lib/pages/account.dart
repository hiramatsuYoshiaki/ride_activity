import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ui/app_bar_auth.dart';
import '../ui/app_bar_bottom.dart';
import '../application_state.dart';
// import '../ui/update_user_profile.dart';
import '../ui/user_profile.dart';
import '../model/status.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarAuth(
        titleText: 'Account',
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1200),
          child: Container(
            padding: const EdgeInsets.all(8),
            color: Colors.green[100],
            alignment: Alignment.center,
            child: Column(children: [
              Column(
                children: [
                  Consumer<ApplicationState>(
                      builder: (context, appState, _) => UserProfile(
                            profileState: appState.profileState,
                            currentUser: appState.getCurrentUser,
                            setProfileState: appState.setProfileState,
                            updateDisplayName: appState.updateDisplayName,
                            updateEmail: appState.updateEmail,
                            accountDelete: appState.accountDelete,

                            // loginState: appState.loginState,
                            // email: appState.email,
                            // verifyEmail: appState.verifyEmail,
                            // signInWithEmailAndPassword:
                            //     appState.signInWithEmailAndPassword,
                            // registerAccount: appState.registerAccount,
                            // signOut: appState.signOut,
                            // setLoginState: appState.setLoginState,
                            // // user: appState.getUser,
                            // currentUser: appState.getCurrentUser,
                            // // sendEmailVerification:appState.sendEmailVerification(currentUser, (e) { })
                            // sendEmailVerification:
                            //     appState.sendEmailVerification,
                            // passReset: appState.passReset,
                          )),
                ],
              ),
            ]),
          ),
        ),
      ),
      bottomNavigationBar: AppBarBottom(),
    );
  }
}
