import 'package:flutter/material.dart';
import 'package:asistensunnahbloc/components/custom_button.dart';
import 'package:asistensunnahbloc/components/entry_field.dart';
// import 'package:tasker/locale/locales.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              Text(
                "'profile",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Text(
                "'everythingAboutYou",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 14,
                    ),
              ),
              const SizedBox(height: 24),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        top: 8.0,
                        end: 8.0,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/profile_pic.png',
                          height: 80,
                        ),
                      ),
                    ),
                    PositionedDirectional(
                      end: 0,
                      top: 0,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Icon(
                          Icons.camera_alt,
                          size: 16,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              EntryField(
                label: "'phoneNumber",
                hintText: "'phoneNumber",
                initialValue: '987 654 3210',
              ),
              const SizedBox(height: 28),
              EntryField(
                label: "'fullName",
                hintText: "'fullName",
                initialValue: 'Smanatha Smith',
              ),
              const SizedBox(height: 28),
              EntryField(
                label: "'emailAddress",
                hintText: "'emailAddress",
                initialValue: 'samantha@mail.com',
              ),
              const SizedBox(height: 28),
              EntryField(
                label: "'roleInCompany",
                hintText: "'roleInCompany",
                initialValue: "'developer",
              ),
              const SizedBox(height: 120),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: CustomButton(
              title: "'update",
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
