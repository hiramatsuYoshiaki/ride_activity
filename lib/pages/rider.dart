import 'package:flutter/material.dart';

class RiderPage extends StatelessWidget {
  const RiderPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext content) {
    return Scaffold(
      // appBar: AppBarAuth(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('RiderPage'),
          ],
        ),
      ),
      // bottomNavigationBar: HomeBottomAppBar(),
    );
  }
}
