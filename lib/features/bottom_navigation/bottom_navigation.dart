import 'package:flutter/material.dart';
import 'package:asistensunnahbloc/features/bottom_navigation/account/account_screen.dart';
import 'package:asistensunnahbloc/features/bottom_navigation/chats/chats_screen.dart';
import 'package:asistensunnahbloc/features/bottom_navigation/projects/projects_screen.dart';
import 'package:asistensunnahbloc/features/bottom_navigation/tasks/tasks_screen.dart';
import 'package:asistensunnahbloc/features/bottom_navigation/teams/teams_screen.dart';
// import 'package:tasker/locale/locales.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  BottomNavigationState createState() => BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const TasksScreen(),
    const ProjectsScreen(),
    const ChatsScreen(),
    const TeamsScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // final locale = AppLocalizations.of(context);
    final List<BottomNavigationBarItem> bottomBarItems = [
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/bottom_menu/ic_task_.png',
          scale: 2.5,
        ),
        activeIcon: Image.asset(
          'assets/bottom_menu/ic_task.png',
          scale: 2.5,
        ),
        label: 'tasks',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/bottom_menu/ic_projects_.png',
          scale: 2.5,
        ),
        activeIcon: Image.asset(
          'assets/bottom_menu/ic_projects.png',
          scale: 2.5,
        ),
        label: 'projects',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/bottom_menu/ic_chat_.png',
          scale: 2.5,
        ),
        activeIcon: Image.asset(
          'assets/bottom_menu/ic_chat.png',
          scale: 2.5,
        ),
        label: 'chats',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/bottom_menu/ic_team_.png',
          scale: 2.5,
        ),
        activeIcon: Image.asset(
          'assets/bottom_menu/ic_team.png',
          scale: 2.5,
        ),
        label: 'teams',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/bottom_menu/ic_account_.png',
          scale: 2.5,
        ),
        activeIcon: Image.asset(
          'assets/bottom_menu/ic_account.png',
          scale: 2.5,
        ),
        label: 'account',
      ),
    ];
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _children[_currentIndex],
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 5,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).hintColor,
        currentIndex: _currentIndex,
        iconSize: 20,
        selectedLabelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
              height: 1.6,
            ),
        unselectedLabelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
              height: 1.6,
            ),
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        // backgroundColor: Theme.of(context).primaryColorDark,
        type: BottomNavigationBarType.fixed,
        items: bottomBarItems,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
