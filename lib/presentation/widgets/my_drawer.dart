import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constnats/my_colors.dart';
import '../../business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import '../../constnats/strings.dart';

PhoneAuthCubit phoneAuthCubit = PhoneAuthCubit();
bool enable=false;

Widget buildDrawerHeader(context) {
  return Column(
    children: [
      Container(
        height:170 ,
        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.blue[100],
        ),
        child: Image.asset(
          'assets/images/7oda.jpeg',
          fit: BoxFit.cover,
        ),
      ),
      const Text(
        '7oda 3bdo',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 5,
      ),
      BlocProvider<PhoneAuthCubit>(
          create: (context) => phoneAuthCubit,
          child: Text(
            '${phoneAuthCubit.getLoggedInUser().phoneNumber}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )),
    ],
  );
}

Widget buildDrawerListItem({required IconData leadingIcon,
  required String title,
  Widget? trailing,
  Function()? onTap,
  Color? color}) {
  return ListTile(
    leading: Icon(
      leadingIcon,
      color: color ?? MyColors.blue,
    ),
    title: Text(title),
    trailing: trailing ??= const Icon(
      Icons.arrow_right,
      color: MyColors.blue,
    ),
    onTap: onTap,
  );
}

Widget buildDrawerListItemsDivider() {
  return const Divider(
    height: 0,
    thickness: 1,
    indent: 18,
    endIndent: 24,
  );
}

void _launchURL(String url) async {
  await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}

Widget buildIcon(IconData icon, String url,Color color) {
  return InkWell(
    onTap: () => _launchURL(url),
    child: Icon(
      icon,
      color: color,
      size: 35,
    ),
  );
}

Widget buildSocialMediaIcons() {
  return Padding(
    padding: const EdgeInsetsDirectional.only(start: 16),
    child: Row(
      children: [
        buildIcon(
            FontAwesomeIcons.facebook,
            'https://www.facebook.com/profile.php?id=100006173172320',
            Colors.blue[800]!
        ),
        const SizedBox(
          width: 15,
        ),
        buildIcon(
            FontAwesomeIcons.youtube,
            'https://www.youtube.com/@redaabdelaal-9168',
            Colors.red
        ),
        const SizedBox(
          width: 20,
        ),
        buildIcon(
            FontAwesomeIcons.twitter,
            'https://twitter.com/7oda3bdo5',
            Colors.blue[400]!
        ),
      ],
    ),
  );
}

Widget buildLogoutBlocProvider(context) {
  return Container(
    child: BlocProvider<PhoneAuthCubit>(
      create: (context) => phoneAuthCubit,
      child: buildDrawerListItem(
        leadingIcon: Icons.logout,
        title: 'Logout',
        onTap: () async {
          await phoneAuthCubit.logOut();
          Navigator.of(context).pushReplacementNamed(loginScreen);
        },
        color: Colors.red,
        trailing: const SizedBox(),
      ),
    ),
  );
}







// ignore: must_be_immutable
// class MyDrawer extends StatefulWidget {
//   MyDrawer({Key? key}) : super(key: key);
//
//   @override
//   State<MyDrawer> createState() => _MyDrawerState();
// }
//
// class _MyDrawerState extends State<MyDrawer> {
//   PhoneAuthCubit phoneAuthCubit = PhoneAuthCubit();
//
//   Widget buildDrawerHeader(context) {
//     return Column(
//       children: [
//         Container(
//           height:170 ,
//           padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
//           decoration: BoxDecoration(
//             shape: BoxShape.rectangle,
//             color: Colors.blue[100],
//           ),
//           child: Image.asset(
//             'assets/images/7oda.jpeg',
//             fit: BoxFit.cover,
//           ),
//         ),
//         const Text(
//           '7oda 3bdo',
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(
//           height: 5,
//         ),
//         BlocProvider<PhoneAuthCubit>(
//             create: (context) => phoneAuthCubit,
//             child: Text(
//               '${phoneAuthCubit.getLoggedInUser().phoneNumber}',
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             )),
//       ],
//     );
//   }
//
//   Widget buildDrawerListItem({required IconData leadingIcon,
//       required String title,
//       Widget? trailing,
//       Function()? onTap,
//       Color? color}) {
//     return ListTile(
//       leading: Icon(
//         leadingIcon,
//         color: color ?? MyColors.blue,
//       ),
//       title: Text(title),
//       trailing: trailing ??= const Icon(
//         Icons.arrow_right,
//         color: MyColors.blue,
//       ),
//       onTap: onTap,
//     );
//   }
//
//   Widget buildDrawerListItemsDivider() {
//     return const Divider(
//       height: 0,
//       thickness: 1,
//       indent: 18,
//       endIndent: 24,
//     );
//   }
//
//   void _launchURL(String url) async {
//     await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
//   }
//
//   Widget buildIcon(IconData icon, String url,Color color) {
//     return InkWell(
//       onTap: () => _launchURL(url),
//       child: Icon(
//         icon,
//         color: color,
//         size: 35,
//       ),
//     );
//   }
//
//   Widget buildSocialMediaIcons() {
//     return Padding(
//       padding: const EdgeInsetsDirectional.only(start: 16),
//       child: Row(
//         children: [
//           buildIcon(
//             FontAwesomeIcons.facebook,
//             'https://www.facebook.com/profile.php?id=100006173172320',
//             Colors.blue[800]!
//           ),
//           const SizedBox(
//             width: 15,
//           ),
//           buildIcon(
//             FontAwesomeIcons.youtube,
//             'https://www.youtube.com/@redaabdelaal-9168',
//               Colors.red
//           ),
//           const SizedBox(
//             width: 20,
//           ),
//           buildIcon(
//             FontAwesomeIcons.twitter,
//             'https://twitter.com/7oda3bdo5',
//               Colors.blue[400]!
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget buildLogoutBlocProvider(context) {
//     return Container(
//       child: BlocProvider<PhoneAuthCubit>(
//         create: (context) => phoneAuthCubit,
//         child: buildDrawerListItem(
//           leadingIcon: Icons.logout,
//           title: 'Logout',
//           onTap: () async {
//             await phoneAuthCubit.logOut();
//             Navigator.of(context).pushReplacementNamed(loginScreen);
//           },
//           color: Colors.red,
//           trailing: const SizedBox(),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           Container(
//             height: 300,
//             child: DrawerHeader(
//               decoration: BoxDecoration(color: Colors.blue[100]),
//               child: buildDrawerHeader(context),
//             ),
//           ),
//           buildDrawerListItem(leadingIcon: Icons.person, title: 'My Profile'),
//           buildDrawerListItemsDivider(),
//           buildDrawerListItem(leadingIcon: Icons.history, title: 'Places History',),
//           buildDrawerListItemsDivider(),
//           buildDrawerListItem(leadingIcon: Icons.settings, title: 'Settings'),
//           buildDrawerListItemsDivider(),
//           buildDrawerListItem(leadingIcon: Icons.help, title: 'Help'),
//           buildDrawerListItemsDivider(),
//           buildDrawerListItem(leadingIcon: Icons.map_outlined, title: 'Map Type (Satellite)',trailing: Switch(value: enable??false, onChanged: (bool val){
//             setState(() {
//               enable = val;
//             });
//           },)),
//           buildDrawerListItemsDivider(),
//           buildLogoutBlocProvider(context),
//
//           const SizedBox(
//             height: 90,
//           ),
//           ListTile(
//             leading: Text(
//               'Follow us',
//               style: TextStyle(color: Colors.grey[600]),
//             ),
//           ),
//           buildSocialMediaIcons(),
//         ],
//       ),
//     );
//   }
// }
