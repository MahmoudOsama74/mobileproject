
import 'package:buildcondition/buildcondition.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shaped_bottom_bar/models/shaped_item_object.dart';
import 'package:shaped_bottom_bar/shaped_bottom_bar.dart';
import 'package:shaped_bottom_bar/utils/arrays.dart';

import '../../../Profile/UpdateProfile.dart';
import '../../../ServicesPage/Business Services/bServicesList.dart';
import '../../../ServicesPage/Business Services/buisnessFav.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);
  @override
  State<homePage> createState() => _homePageState();
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );
  Widget buildHeader(BuildContext context) => Container(
        color: const Color(0xFF344E41),
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        child: const SizedBox(
          height: 15,
        ),
      );
  Widget buildMenuItems(BuildContext context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 3),
            child: ListTile(
              leading: const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/porfile.jpg'),
              ),
              title: const Text(
                'Mahmoud Osama',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 0),
            child: ListTile(
              leading: const Icon(Icons.person_pin),
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return UpdateScreen();
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 0),
            child: ListTile(
              leading: const Icon(Icons.content_paste_go),
              title: const Text('Business Services'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return  BusinessServicesList();
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 0),
            child: ListTile(
              leading: const Icon(Icons.group),
              title: const Text('Favorite'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return  BusinessServicesFav();
                    },
                  ),
                );
              },
            ),
          ),

          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 0),
            child: ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
              },
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 0),
          //   child: ListTile(
          //     leading: const Icon(Icons.logout),
          //     title: const Text('Logout'),
          //     onTap: () {
          //       signOut(context);
          //     },
          //   ),
          // ),
        ],
      );
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }


  }



