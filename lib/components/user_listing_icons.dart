import 'package:flutter/material.dart';

class UserListingIcons extends StatelessWidget {
  const UserListingIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      // fit: StackFit.loose,
      children: [
        ClipOval(
          child: Image.asset(
            'assets/avatar/Layer 1.png',
            height: 28,
          ),
        ),
        Positioned(
          left: 20,
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            child: ClipOval(
              child: Image.asset(
                'assets/avatar/Layer 2.png',
                height: 28,
              ),
            ),
          ),
        ),
        Positioned(
          left: 40,
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            child: ClipOval(
              child: Image.asset(
                'assets/avatar/Layer 3.png',
                height: 28,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
