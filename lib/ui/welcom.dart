import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'header_widget.dart';
import '../model/status.dart';
import '../pages/home.dart';

class Welcom extends StatefulWidget {
  const Welcom(
      {Key? key,
      // required this.user,
      required this.sendEmailVerification,
      required this.currentUser,
      required this.setLoginState})
      : super(key: key);
  // final String? user;
  final User? currentUser;
  final void Function(ApplicationLoginState status) setLoginState;
  final void Function() sendEmailVerification;

  @override
  _WelcomState createState() => _WelcomState();
}

class _WelcomState extends State<Welcom> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeaderAuthWidget(
                  title: 'EMAIL VERIFY',
                  img: 'undraw_Personal_email_re_4lx7.png',
                  subTitle: '${widget.currentUser?.email}',
                  discription: 'メールアドレスの認証をします。'),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '１．ボタン［送信］を押してください。',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 36),
                      child: Text(
                        'メールアドレス認証用のメールを送信します。',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500]),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '２．メールを開いてください。',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 36),
                      child: Text(
                        'Verify your email for project....',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 36),
                      child: Text(
                        'メールアプリで送信されたメール開いてください。',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 91, 81, 81)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '３．リンクをクリックしてください',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 36),
                      child: Text(
                        'https://ride-activity.firebaseapp.com/__/auth/action?mode=verifyEmail.........',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 36),
                      child: Text(
                        'メールアドレス認証するためにリンクアドレスをクリックしてください',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500]),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '４．完了ダイナログを確認',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 36),
                      child: Text(
                        'Your email has been verified You can now sign in with your new account',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 36),
                      child: Text(
                        'メールアドレス認証の完了メッセージを確認します。',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500]),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '５．ログインする',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 36),
                      child: Text(
                        'アプリケーションに戻って、新しいアカウントでログインします。',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500]),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: widget.currentUser?.emailVerified == false
                    ? () {
                        widget.sendEmailVerification();
                      }
                    : () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return HomePage();
                        }));
                      },
                child: widget.currentUser?.emailVerified == false
                    ? const Text('送信')
                    : const Text('START'),
              ),
              const SizedBox(height: 32),

              // ElevatedButton(
              //     onPressed: () {
              //       widget.setLoginState(ApplicationLoginState.loggedIn);
              //       Navigator.of(context)
              //           .push(MaterialPageRoute(builder: (context) {
              //         return HomePage();
              //       }));
              //     },
              //     child: const Text('START')),
              // const SizedBox(height: 32),

              TextButton(
                  onPressed: () {
                    widget.setLoginState(ApplicationLoginState.loggedIn);
                  },
                  child: const Text('メール認証しない')),
            ],
          ),
        ),
      ],
    );
  }
}
