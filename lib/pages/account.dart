import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ui/app_bar_auth.dart';
import '../ui/app_bar_bottom.dart';
import '../application_state.dart';
import '../ui/update_user_profile.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: [Text('AccountPage')],
    // );
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
                    builder: (context, appState, _) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          const CircleAvatar(
                            backgroundImage: NetworkImage(
                                'images/undraw_profile_pic_ic5t.png'),
                            minRadius: 50,
                            maxRadius: 100,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            appState.getCurrentUser!.displayName.toString(),
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            appState.getCurrentUser!.email.toString(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.normal),
                          ),
                          const SizedBox(
                            height: 8,
                          ),

                          // Text('update displayName'),
                          // Text('update photoURL'),
                          // Text('update Email'),
                          // Text('update Password'),
                          // Text(appState.getCurrentUser!.uid.toString()),
                          // Text(appState.getCurrentUser!.displayName.toString()),
                          // Text(appState.getCurrentUser!.photoURL.toString()),
                          // UpdateUserProfile(user: appState.getCurrentUser),
                          UpdateUserProfile(),
                        ],
                      );
                    },
                  ),
                  // UpdateUserProfile(User appState.getCurrentUser),
                  Text('body'),
                  Text('edit'),
                ],
              ),
            ]),
          ),
        ),
      ),
      // ),
      // body: Column(
      //   children: [
      //     // Text('AccountPage'),
      //     Consumer<ApplicationState>(builder: (context, appState, _) {
      //       return Column(
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: [
      //           Text(appState.getCurrentUser!.uid.toString()),
      //           Text(appState.getCurrentUser!.displayName.toString()),
      //           Text(appState.getCurrentUser!.email.toString()),
      //           Text(appState.getCurrentUser!.photoURL.toString()),
      //         ],
      //       );
      //     }),
      //   ],
      // ),
      bottomNavigationBar: AppBarBottom(),
    );
  }
}
