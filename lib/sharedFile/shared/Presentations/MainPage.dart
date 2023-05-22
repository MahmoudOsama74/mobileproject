
import 'package:buildcondition/buildcondition.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobileproject/ServicesPage/Cubit/BussinessServiceCubit.dart';
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

}

class _homePageState extends State<homePage> {
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex],style: const TextStyle(color:Color(
                  0xFFF0F3F1) ),),
              backgroundColor: const Color(0xFF04342A),
            ),
            drawer: const NavigationDrawer(),
            body: ConditionalBuilder(
              condition: true,
              builder: (context) => cubit.screens[cubit.currentIndex],
              fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
            ),
            bottomNavigationBar: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30), topLeft: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: BottomNavigationBar(
                    backgroundColor: Colors.white,
                    unselectedItemColor: const Color(0xFF344E41),
                    fixedColor: const Color(0xFF01110E),
                    type: BottomNavigationBarType.fixed,
                    currentIndex: cubit.currentIndex,
                    selectedIconTheme: const IconThemeData(size: 40,color: Color(0xFF02413C)),
                    onTap: (index) {
                      cubit.changeIndex(index);
                    },
                    items:const [
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.person,
                        ),
                        label: 'Profile',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.file_copy_sharp,
                        ),
                        label: 'Business Services',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.favorite,
                        ),
                        label: 'Favourite',
                      ),

                    ],
                  ),
                )
            ),

          );
        },
      ),
    );
  }
}
