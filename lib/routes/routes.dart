import 'package:flutter/material.dart';

import '../features/bottom_navigation/account/account_screen.dart';
import '../features/bottom_navigation/account/faqs_screen.dart';
import '../features/bottom_navigation/account/privacy_policy_screen.dart';
import '../features/bottom_navigation/account/profile_screen.dart';
import '../features/bottom_navigation/account/tnc_screen.dart';
import '../features/bottom_navigation/bottom_navigation.dart';
import '../features/bottom_navigation/chats/channel_chat_page.dart';
import '../features/bottom_navigation/chats/chat_page.dart';
import '../features/bottom_navigation/projects/add_task_info_screen.dart';
import '../features/bottom_navigation/projects/project_info_screen.dart';
import '../features/bottom_navigation/projects/project_task_info_screen.dart';
import '../features/bottom_navigation/tasks/task_info_screen.dart';
import '../features/bottom_navigation/tasks/tasks_listing_screen.dart';
import '../features/language/ui/language_sheet.dart';
import '../pages/Authentication/login_navigator.dart';

class PageRoutes {
  static const String loginNavigator = 'login_nav';
  static const String bottomNavigation = 'bottom_navigation';
  static const String tasksListingScreen = 'tasks_listing';
  static const String taskInfoScreen = 'tasks_info';
  static const String projectInfoScreen = 'project_info';
  static const String projectTaskInfoScreen = 'project_task';
  static const String addTaskInfoScreen = 'add_task_info';
  static const String chatPage = 'chat_page';
  static const String channelChatPage = 'channel_chat_page';
  static const String accountScreen = 'account_screen';
  static const String profileScreen = 'profile_screen';
  static const String faqsScreen = 'faqs_screen';
  static const String tncScreen = 'tnc_screen';
  static const String privacyPolicyScreen = 'privacy_screen';
  static const String languageScreen = 'language_screen';

  Map<String, WidgetBuilder> routes() {
    return {
      loginNavigator: (context) => const LoginNavigator(),
      bottomNavigation: (context) => const BottomNavigation(),
      tasksListingScreen: (context) => const TasksListingScreen(),
      taskInfoScreen: (context) => const TaskInfoScreen(),
      projectInfoScreen: (context) => ProjectInfoScreen(),
      projectTaskInfoScreen: (context) => ProjectTaskInfoScreen(),
      addTaskInfoScreen: (context) => const AddTaskInfoScreen(),
      chatPage: (context) => const ChatPage(),
      channelChatPage: (context) => const ChannelChatPage(),
      accountScreen: (context) => const AccountScreen(),
      profileScreen: (context) => const ProfileScreen(),
      faqsScreen: (context) => const FAQsScreen(),
      tncScreen: (context) => const TncScreen(),
      privacyPolicyScreen: (context) => PrivacyPolicyScreen(),
      languageScreen: (context) => const LanguageSheet(),
    };
  }
}
