import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:asistensunnahbloc/app_config/app_config.dart';
import 'package:asistensunnahbloc/components/custom_progress_indicator.dart';
// import 'package:asistensunnahbloc/features/language/bloc/language_cubit.dart';
// import 'package:tasker/locale/locales.dart';
import 'package:asistensunnahbloc/routes/routes.dart';

import '../../language/bloc/language_cubit.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "akun",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 28),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.only(
                  top: 22,
                  left: 22,
                  right: 22,
                  bottom: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Samantha Smith',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "pengembang",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 14),
                    ),
                    const SizedBox(height: 18),
                    const CustomProgressIndicator(subTasksCompleted: 2),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/ic_task copy.png',
                          height: 14,
                          color: Theme.of(context).hintColor,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '65 tasks',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontSize: 14),
                        ),
                        const SizedBox(width: 8),
                        CircleAvatar(
                          radius: 2,
                          backgroundColor: Theme.of(context).hintColor,
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.check_circle_outline,
                          size: 16,
                          color: Theme.of(context).hintColor,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '46%',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontSize: 14),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, PageRoutes.profileScreen);
                          },
                          child: Text(
                            "lihat profile",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              PositionedDirectional(
                end: 20,
                top: 0,
                child: ClipOval(
                  child: Image.asset(
                    'assets/profile_pic.png',
                    height: 70,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          BlocBuilder<LanguageCubit, Locale>(
            builder: (context, currentLocale) {
              return buildTile(
                context,
                onTap: () {
                  Navigator.pushNamed(context, PageRoutes.languageScreen);
                },
                icon: Icons.public,
                title: "ganti bahasa",
                subtitle:
                    AppConfig.languagesSupported['currentlanguageCode'] ??
                        "englishLanguage",
                isDropDown: true,
              );
            },
          ),
          const SizedBox(height: 40),
          buildTile(
            context,
            onTap: () {
              Navigator.pushNamed(context, PageRoutes.faqsScreen);
            },
            icon: Icons.live_help,
            title: "'faqs",
            subtitle: "'getYourQuestionAnswered",
          ),
          const SizedBox(height: 40),
          buildTile(
            context,
            onTap: () {
              Navigator.pushNamed(context, PageRoutes.tncScreen);
            },
            icon: Icons.assignment,
            title: "'termsAndConditions",
            subtitle: "'knowTermsOfUse",
          ),
          const SizedBox(height: 40),
          buildTile(
            context,
            onTap: () {
              Navigator.pushNamed(context, PageRoutes.privacyPolicyScreen);
            },
            icon: Icons.lock,
            title: "'privacyPolicy",
            subtitle: "'companiesPrivacyPolicy",
          ),
          const SizedBox(height: 40),
          buildTile(
            context,
            onTap: () {
              Navigator.maybePop(context);
            },
            icon: Icons.power_settings_new,
            title: "'logout",
            subtitle: "'signOutFromAccount",
          ),
        ],
      ),
    );
  }

  Widget buildTile(
    BuildContext context, {
    Function()? onTap,
    required IconData icon,
    required String title,
    required String subtitle,
    bool? isDropDown,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        subtitle,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 14,
                            ),
                      ),
                    ),
                    Visibility(
                      visible: isDropDown ?? false,
                      child: const Icon(Icons.keyboard_arrow_down),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
