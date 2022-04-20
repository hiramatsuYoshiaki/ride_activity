import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_activity/model/status.dart';
import 'package:ride_activity/ui/app_bar_bottom.dart';
import '../ui/app_bar_auth.dart';
import '../ui/app_bar_bottom.dart';
import '../application_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarAuth(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('HomePage'),
          ],
        ),
      ),
      bottomNavigationBar: AppBarBottom(),
    );
  }
}
