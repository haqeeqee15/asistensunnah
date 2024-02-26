import 'dart:async';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_button.dart';
import '../../../components/entry_field.dart';
import '../login_navigator.dart';

class VerifyUI extends StatefulWidget {
  const VerifyUI({Key? key, }) : super(key: key);

  
  @override
  State<VerifyUI> createState() => _VerifyUIState();
}

class _VerifyUIState extends State<VerifyUI> {
  Timer? _timer;
  int _timeLeft = 30;

  @override
  void initState() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (_timeLeft == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _timeLeft--;
          });
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(),
      body: FadedSlideAnimation(
        beginOffset: const Offset(0, 0.3),
        endOffset: const Offset(0, 0),
        slideDuration: const Duration(milliseconds: 300),
        slideCurve: Curves.linearToEaseOut,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Text(
              'ocale.verification',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 12),
            Text(
              'enterVerificationCodeSent',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).hintColor,
                    fontSize: 15,
                  ),
            ),
            const SizedBox(height: 50),
            EntryField(
              label: 'enterOtp',
              hintText: '',
              initialValue: '6 4 5 7 7 0',
            ),
            const SizedBox(height: 50),
            CustomButton(
              title: ' submit',
              onTap:  () {
                Navigator.pushNamed(context, LoginRoutes.welcome);
              },
            ),
            const SizedBox(height: 36),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '0:${_timeLeft.toString().padLeft(2, '0')} minLeft',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).hintColor.withOpacity(0.5),
                          fontSize: 15,
                        ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _timeLeft = 30;
                    _timer?.cancel();
                    _timer = Timer.periodic(
                      const Duration(seconds: 1),
                      (Timer timer) {
                        if (_timeLeft == 0) {
                          setState(() {
                            timer.cancel();
                          });
                        } else {
                          setState(() {
                            _timeLeft--;
                          });
                        }
                      },
                    );
                    setState(() {});
                  },
                  child: Text(
                    'resend.toUpperCase()',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          // color: Theme.of(context).hintColor.withOpacity(0.5),
                          fontSize: 15,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }
}
