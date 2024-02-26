import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_button.dart';
import '../../../components/entry_field.dart';
import '../login_navigator.dart';

class LoginUI extends StatefulWidget {
  const LoginUI({super.key});

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadedSlideAnimation(
        beginOffset: const Offset(0, 0.3),
        endOffset: const Offset(0, 0),
        slideDuration: const Duration(milliseconds: 300),
        slideCurve: Curves.linearToEaseOut,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 5,
                  child: Image.asset(
                    'aset/logo.png',
                    scale: 3.5,
                  ),
                ),
                const Spacer(),
                Text(
                  "Assalamua'alaikum akh",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 6),
                Text(
                  "Masuk Sekarang",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                const EntryField(
                  label: "Nomor Telpon",
                  hintText: "Nomor Telpon akh",
                ),
                const Spacer(),
                CustomButton(
                  title: "Mulai",
                  onTap: () {
                    Navigator.pushNamed(context, LoginRoutes.register);
                  },
                ),
                const Spacer(),
                const Text(
                  "Atau Login dengan",
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: buildSocialButton(
                        context,
                        'aset/social/ic_facebook.png',
                        "facebook",
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: buildSocialButton(
                        context,
                        'aset/social/ic_google.png',
                        "google",
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSocialButton(
    BuildContext context,
    String image,
    String title,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        // Navigator.pushNamed(context, LoginRoutes.signIn);
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).hintColor.withOpacity(0.2),
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 18,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
