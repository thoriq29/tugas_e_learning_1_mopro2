import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moh_torikul_a_tugas_elearning_1/presentation/pages/profile.dart';
import 'package:moh_torikul_a_tugas_elearning_1/presentation/pages/todoPage.dart';
import 'package:moh_torikul_a_tugas_elearning_1/presentation/provider/homeProvider.dart';
import 'package:moh_torikul_a_tugas_elearning_1/presentation/widgets/todo_widgets.dart';
import 'package:provider/provider.dart';

import 'dashboard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  List<Widget> _buildScreens() {
    return [
      const Dashboard(),
      const TodoPage(),
      const Profile()
      // const DashboardScreen(),
      // const TaskManagerScreen(),
      // const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, HomeProvider homeProvider, __) {
        return Scaffold(
          appBar: AppBar(
            title: Text(homeProvider.title),
          ),
          body: SizedBox.expand(
            child: PageView(
              controller: homeProvider.controller,
              onPageChanged: (index) {
                homeProvider.setCurrentIndex = index;
              },
              children: _buildScreens()
            ),
          ),
          bottomNavigationBar: BottomNavyBar(
            selectedIndex: homeProvider.pageIndex,
            showElevation: true, // use this to remove appBar's elevation
            onItemSelected: (index) {
              homeProvider.setCurrentIndex = index;
              homeProvider.controller.animateToPage(index,
                  duration: const Duration(milliseconds: 300), curve: Curves.ease);
            },
            items: [
              BottomNavyBarItem(
                icon: const Icon(Icons.dashboard),
                title: const Text('Dashboard'),
                activeColor: Colors.red,
              ),
              BottomNavyBarItem(
                  icon: const Icon(Icons.event),
                  title: const Text('List Tugas'),
                  activeColor: Colors.purpleAccent
              ),
              BottomNavyBarItem(
                  icon: const Icon(Icons.verified_user),
                  title: const Text('Profil'),
                  activeColor: Colors.pink
              ),
              
            ],
          ),
          floatingActionButton: homeProvider.pageIndex == 1 ? FloatingActionButton(
            onPressed: () {
              TodoWidget.showAddTodoForm(context);
            },
            child: const Icon(Icons.add),
            backgroundColor: Colors.blue,
          ):null,
        );
      },
    );
  }
}
