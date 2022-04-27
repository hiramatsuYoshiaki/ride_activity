import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ui/app_bar_auth.dart';
import '../ui/app_bar_bottom.dart';
import '../application_state.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: [Text('AccountPage')],
    // );
    return Scaffold(
      appBar: AppBarAuth(),
      body: Column(
        children: [
          Text('AccountPage'),
          Consumer<ApplicationState>(builder: (context, appState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(appState.getCurrentUser!.uid.toString()),
                Text(appState.getCurrentUser!.displayName.toString()),
                Text(appState.getCurrentUser!.email.toString()),
                Text(appState.getCurrentUser!.photoURL.toString()),
              ],
            );

            // return ElevatedButton(
            //     onPressed: () {
            //       appState.signOut();
            //       appState.setLoginState(ApplicationLoginState.loggedOut);
            //       Navigator.push(context, MaterialPageRoute(
            //         builder: (context) {
            //           return HomePage();
            //         },
            //       ));
            //     },
            //     child: const Text('LOGOUT'));
          }),
        ],
      ),
      bottomNavigationBar: AppBarBottom(),
    );
  }
}
