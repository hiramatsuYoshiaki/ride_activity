import 'package:flutter/material.dart';

class HeaderTitleWidget extends StatelessWidget {
  const HeaderTitleWidget({required this.title, Key? key}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 16, right: 8, left: 8, bottom: 16),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Colors.blue[600]),
        ),
      );
}

class HeaderAuthWidget extends StatelessWidget {
  const HeaderAuthWidget(
      {required this.title,
      required this.img,
      this.subTitle,
      this.discription,
      Key? key})
      : super(key: key);
  final String title;
  final String img;
  final String? subTitle;
  final String? discription;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 16, right: 8, left: 8, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[600]),
            ),
            const SizedBox(height: 8),
            Image.asset('images/$img'),
            // Image.network('assets/images/$img'),
            const SizedBox(height: 8),
            Text(subTitle!,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[600])),
            const SizedBox(height: 8),
            Text(discription!,
                style: TextStyle(fontSize: 16, color: Colors.grey[600])),
            const SizedBox(height: 16),
          ],
        ),
      );
}
