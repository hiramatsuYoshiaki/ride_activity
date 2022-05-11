import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../model/status.dart';

class DisplayProfile extends StatefulWidget {
  const DisplayProfile({
    Key? key,
    required this.user,
    required this.setProfileState,
  }) : super(key: key);
  final User? user;
  final void Function(ProfileState status) setProfileState;

  @override
  _DisplayProfileState createState() => _DisplayProfileState();
}

class _DisplayProfileState extends State<DisplayProfile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 16),
        widget.user!.photoURL == null
            ? CircleAvatar(
                backgroundImage:
                    NetworkImage('assets/images/undraw_profile_pic_ic5t.png'),
                minRadius: 50,
                maxRadius: 100,
              )
            : CircleAvatar(
                backgroundImage: NetworkImage('${widget.user!.photoURL}'),
                minRadius: 50,
                maxRadius: 100,
              ),
        const SizedBox(height: 16),
        ElevatedButton(
            onPressed: () {
              widget.setProfileState(ProfileState.photoUpdate);
            },
            child: Text('変更')),
        const SizedBox(height: 32),
        Text(
          '${widget.user!.displayName}',
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
            onPressed: () {
              widget.setProfileState(ProfileState.dispalyNameUpdate);
            },
            child: Text('変更')),
        const SizedBox(height: 32),
        Text(
          '${widget.user!.email}',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
        ),
        // IconButton(onPressed: () {}, icon: Icon(Icons.navigate_next)),
        const SizedBox(height: 16),
        ElevatedButton(
            onPressed: () {
              widget.setProfileState(ProfileState.emailUpdate);
            },
            child: Text('変更')),
        const SizedBox(height: 32),
        ElevatedButton(
            onPressed: () {
              widget.setProfileState(ProfileState.removeAccount);
            },
            child: Text('アカウント削除')),
      ],
    );
  }
}

// class DisplayProfile extends StatelessWidget {
//   const DisplayProfile({
//     Key? key,
    // required this.user,
    // required this.setProfileState,
//   }) : super(key: key);
//   final User? user;
//   final void Function(ProfileState status) setProfileState;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // Text('DisplayProfile'),
//         // Text('${user!.photoURL}'),
//         // Text('${user!.displayName}'),
//         // Text('${user!.email}'),
//         const SizedBox(height: 16),
//         user!.photoURL == null
//             ? CircleAvatar(
//                 backgroundImage:
//                     NetworkImage('images/undraw_profile_pic_ic5t.png'),
//                 minRadius: 50,
//                 maxRadius: 100,
//               )
//             : CircleAvatar(
//                 backgroundImage: NetworkImage('${user!.photoURL}'),
//                 minRadius: 50,
//                 maxRadius: 100,
//               ),
//         const SizedBox(height: 16),
//         ElevatedButton(
//             onPressed: () {
//               print('push button display profile');
//               Widget.setProfileState(ProfileState.photoUpdate);
//             },
//             child: Text('変更')),
//         const SizedBox(height: 32),

//         Text(
//           '${user!.displayName}',
//           style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 16),
//         ElevatedButton(onPressed: () {}, child: Text('変更')),
//         const SizedBox(height: 32),
//         Text(
//           '${user!.email}',
//           style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
//         ),
//         IconButton(onPressed: () {}, icon: Icon(Icons.navigate_next)),
//         const SizedBox(height: 16),
//         ElevatedButton(onPressed: () {}, child: Text('変更')),
//         const SizedBox(height: 32),
//         ElevatedButton(onPressed: () {}, child: Text('アカウント削除')),
//       ],
//     );
//   }
// }
