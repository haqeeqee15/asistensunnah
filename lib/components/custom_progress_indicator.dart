import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({
    super.key,
    required int subTasksCompleted,
  }) : _subTasksCompleted = subTasksCompleted;

  final int _subTasksCompleted;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 5,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).dividerColor,
          ),
        ),
        Container(
          height: 5,
          width: MediaQuery.of(context).size.width * 0.225 * _subTasksCompleted,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
