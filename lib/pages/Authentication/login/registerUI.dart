import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_button.dart';
import '../../../components/entry_field.dart';
import '../login_navigator.dart';

class RegisterUI extends StatefulWidget {
  const RegisterUI({super.key});

  @override
  State<RegisterUI> createState() => _RegisterUIState();
}

class _RegisterUIState extends State<RegisterUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FadedSlideAnimation(
        beginOffset: const Offset(0, 0.3),
        endOffset: const Offset(0, 0),
        slideDuration: const Duration(milliseconds: 300),
        slideCurve: Curves.linearToEaseOut,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    Text(
                      'signUpNow',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'youAreNotRegistered',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).hintColor,
                            fontSize: 15,
                          ),
                    ),
                    const SizedBox(height: 28),
                    Stack(
                      children: [
                        Image.asset(
                          'assets/pic_profile.png',
                          height: 85,
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Icon(
                              Icons.camera_alt,
                              color: Theme.of(context).scaffoldBackgroundColor,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    EntryField(
                      label: 'phoneNumber',
                      hintText: '',
                      initialValue: '987 654 3210',
                    ),
                    const SizedBox(height: 40),
                    EntryField(
                      label: 'fullName',
                      hintText: '',
                      initialValue: 'Samantha Smith',
                    ),
                    const SizedBox(height: 40),
                    EntryField(
                      label: 'emailAddress',
                      hintText: '',
                      initialValue: 'samanthasmith@email.com',
                    ),
                    const SizedBox(height: 40),
                    EntryField(
                      label: 'roleInCompany',
                      hintText: '',
                      initialValue: 'Developer',
                      suffixIcon: const Icon(Icons.keyboard_arrow_down),
                    ),
                    const SizedBox(height: 120),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 24,
              right: 24,
              bottom: 24,
              child: CustomButton(
                title: 'continueText',
                onTap: () {
                  Navigator.pushNamed(context, LoginRoutes.verification);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}