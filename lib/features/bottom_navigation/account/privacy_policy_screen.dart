import 'package:flutter/material.dart';
// import 'package:tasker/locale/locales.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  PrivacyPolicyScreen({Key? key}) : super(key: key);

  final List<String> str = [
    "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est.",
    "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est.",
    "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est.",
    "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est.",
  ];

  @override
  Widget build(BuildContext context) {
    // final locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 14,
        ),
        children: [
          Text(
            " 'privacyPolicy",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 30),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 14,
                  height: 2.0,
                ),
          ),
          const SizedBox(height: 36),
          Text(
            "'privacyPolicies",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 20),
          Column(
            children: str.map((value) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 14.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "\u2022",
                      style: TextStyle(fontSize: 24, height: 1.4),
                    ), //bullet text
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        value,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  height: 2.0,
                                ),
                      ), //text
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
