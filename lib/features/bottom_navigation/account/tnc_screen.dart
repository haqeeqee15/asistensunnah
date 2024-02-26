import 'package:flutter/material.dart';
// import 'package:tasker/locale/locales.dart';

class TncScreen extends StatelessWidget {
  const TncScreen({Key? key}) : super(key: key);

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
            "'termsAndConditions",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 30),
          Text(
            "'companyTermsOfUse",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 20),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 14,
                  height: 2.0,
                ),
          ),
          const SizedBox(height: 36),
          Text(
            "'termsAndConditions",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 20),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 14,
                  height: 2.0,
                ),
          ),
        ],
      ),
    );
  }
}
