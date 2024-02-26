import 'package:flutter/material.dart';
import 'package:asistensunnahbloc/components/custom_button.dart';
import 'package:asistensunnahbloc/components/entry_field.dart';
// import 'package:tasker/locale/locales.dart';

class WelcomeUI extends StatelessWidget {
  const WelcomeUI({Key? key, required this.onTap}) : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      "'inviteMembersToTeam",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontSize: 23),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(end: 18.0),
                      child: Image.asset('assets/vector_splash.png'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                "'sendInvitationToCollaborate",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 15,
                    ),
              ),
              const SizedBox(height: 60),
              EntryField(
                label: '',
                prefixIcon: Icon(
                  Icons.mail_outline_outlined,
                  color: Theme.of(context).primaryColor,
                  size: 20,
                ),
                suffixIcon: Icon(
                  Icons.close,
                  color: Theme.of(context).hintColor,
                ),
                hintText: "'enterEmailAddress",
                initialValue: 'emiliwilliamson@mail.com',
              ),
              const SizedBox(height: 20),
              EntryField(
                label: '',
                prefixIcon: Icon(
                  Icons.mail_outline_outlined,
                  color: Theme.of(context).primaryColor,
                  size: 20,
                ),
                suffixIcon: Icon(
                  Icons.close,
                  color: Theme.of(context).hintColor,
                ),
                hintText: "'enterEmailAddress",
                initialValue: 'georgetaylor123@mail.com',
              ),
              const SizedBox(height: 20),
              EntryField(
                label: '',
                prefixIcon: const Icon(
                  Icons.add_circle_outline,
                  size: 20,
                ),
                hintText: "'enterEmailAddress",
              ),
              const SizedBox(height: 100),
            ],
          ),
          Positioned(
            bottom: 24,
            left: 24,
            right: 24,
            child: CustomButton(
              title: "'getStarted",
              onTap: onTap,
            ),
          ),
        ],
      ),
    );
  }
}
