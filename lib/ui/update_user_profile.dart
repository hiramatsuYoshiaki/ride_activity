import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/status.dart';


// class UpdateUserProfile extends StatefulWidget {
//   const UpdateUserProfile( 
//     {
//     Key? key, 
//     required this.user, 
//     required this.updateDisplayName, 
//     required this.profileUpdateStat
//     }
//   ) : super(key: key);
//   final ProfileUpdateState profileUpdateState;
//   final User? user;
//   final void function(String displayname) updateDisplayName;
//   @override
//   _UpdateUserProfileState createState() => _UpdateUserProfileState();
// }

// class _UpdateUserProfileState extends State<UpdateUserProfile> {
//   final _formKey = GlobalKey<FormState>(debugLabel: '_RegisterFormState');
//   final _displayNameController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _displayNameController.text = widget.user!.displayName.toString();
//   }

//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const SizedBox(
//           height: 16,
//         ),
//         const CircleAvatar(
//           backgroundImage: NetworkImage('images/undraw_profile_pic_ic5t.png'),
//           minRadius: 50,
//           maxRadius: 100,
//         ),
//         const SizedBox(
//           height: 16,
//         ),
//         Text(
//           '${widget.user?.displayName}',
//           style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         Text(
//           '${widget.user?.email}',
//           style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
//         ),
//         const SizedBox(
//           height: 32,
//         ),
//         Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 32),
//                     child: TextFormField(
//                       controller: _displayNameController,
//                       decoration: const InputDecoration(
//                         labelText: 'アカウント名',
//                         hintText: 'アカウント名を入力してください',
//                         // helperText: '必須'
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'アカウント名は必須です';
//                         }
//                         if (value.length > 21) {
//                           return 'アカウント名は２０文字以内です';
//                         }
//                         return null;
//                       },
//                     ),
//                   )
//                 ],
//               )),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 32),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               ElevatedButton(
//                   onPressed: () {
//                     _displayNameController.text =
//                         widget.user!.displayName.toString();
//                     // widget.setLoginState(ApplicationLoginState.loggedOut);
//                   },
//                   child: const Text('キャンセル')),
//               const SizedBox(width: 16),
//               ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       widget.updateDisplayName(_displayNameController.text);
//                     }
//                   },
//                   child: const Text('アカウント名変更')),
//               const SizedBox(width: 30),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//   void _showErrorDialog(BuildContext context, String title, Exception e) {
//   showDialog<void>(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text(
//             title,
//             style: const TextStyle(fontSize: 24),
//           ),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: <Widget>[
//                 Text(
//                   '${(e as dynamic).message}',
//                   style: const TextStyle(fontSize: 18),
//                 )
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('OK'),
//             ),
//           ],
//         );
//       });
// }
// }
