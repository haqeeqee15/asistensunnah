import 'package:flutter/material.dart';
import 'package:asistensunnahbloc/components/custom_progress_indicator.dart';
// import 'package:tasker/locale/locales.dart';

class AddTaskInfoScreen extends StatefulWidget {
  const AddTaskInfoScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskInfoScreen> createState() => _AddTaskInfoScreenState();
}

class _AddTaskInfoScreenState extends State<AddTaskInfoScreen> {
  bool isAttached = false;

  @override
  Widget build(BuildContext context) {
    // final locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Image.asset('assets/icons/ic_conection.png'),
          ),
          const SizedBox(width: 20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Image.asset('assets/icons/ic_add_request.png'),
          ),
          const SizedBox(width: 20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Image.asset('assets/icons/ic_attachment.png'),
          ),
          const SizedBox(width: 20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Image.asset('assets/icons/add_comment.png'),
          ),
          const SizedBox(width: 20),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Icon(Icons.more_horiz_outlined),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xfff1fbff),
                ),
                child: Text(
                 'proposed',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: const Color(0xff61d0ff),
                      ),
                ),
              ),
              const Spacer(),
              Image.asset(
                'assets/icons/ic_notifiaction.png',
                height: 12,
                color: Theme.of(context).hintColor,
              ),
              const SizedBox(width: 10),
              Text(
                '25 feb',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Personal Analysis from data available',
            style:
                Theme.of(context).textTheme.titleLarge?.copyWith(height: 1.4),
          ),
          const SizedBox(height: 20),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua enim ad minim veniam.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  height: 1.6,
                ),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'markAsDone',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Text(
                '0% done',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 14,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const CustomProgressIndicator(subTasksCompleted: 0),
          const SizedBox(height: 32),
          Row(
            children: [
              Icon(
                Icons.add_circle_outline,
                color: Theme.of(context).primaryColor.withOpacity(0.2),
              ),
              const SizedBox(width: 20),
              Text(
                'addASubtask',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 14,
                    ),
              ),
            ],
          ),
          const Divider(height: 30),
          const SizedBox(height: 14),
          GestureDetector(
            onTap: () {
              setState(() {
                isAttached = true;
              });
            },
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'attachment',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Transform.rotate(
                  angle: 5,
                  child: Icon(
                    Icons.attachment,
                    size: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  'attachNew'.toUpperCase(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          if (!isAttached)
            GestureDetector(
              onTap: () {
                setState(() {
                  isAttached = true;
                });
              },
              child: Row(
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).dividerColor.withOpacity(0.1),
                    ),
                    child: Image.asset(
                      'assets/icons/ic_attachment.png',
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ],
              ),
            )
          else
            SizedBox(
              height: 90,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset('assets/avatar/Layer ${index + 3}.png'),
                  );
                }),
                separatorBuilder: ((context, index) {
                  return const SizedBox(width: 10);
                }),
                itemCount: 3,
              ),
            ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: Text(
                  'projectRoles',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Image.asset(
                'assets/icons/add_member2.png',
                height: 12,
              ),
              const SizedBox(width: 6),
              Text(
                'addMember'.toUpperCase(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: 20),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 1,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.4,
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
            ),
            itemBuilder: ((context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                  ),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/avatar/Layer ${index + 12}.png'),
                      radius: 18,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Samantha Smith',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontSize: 14,
                                  ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'assignee',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: 14,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: Text(
                  'projectActivity',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Text(
                'allActivity',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.keyboard_arrow_down,
                color: Theme.of(context).hintColor,
                size: 16,
              ),
            ],
          ),
          const SizedBox(height: 40),
          buildTile(
            context,
            image: 'assets/avatar/Layer 12.png',
            name: 'Samantha Smith',
            subtitle: 'createdThisTask',
            icon: 'assets/icons/ic_task copy.png',
            date: 'Apr 10, Sun',
          ),
          const SizedBox(height: 38),
        ],
      ),
    );
  }

  Widget buildTile(
    BuildContext context, {
    required String image,
    required String name,
    required String subtitle,
    required String icon,
    required String date,
    Widget? bottom,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(image),
          radius: 18,
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      name,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontSize: 14,
                          ),
                    ),
                  ),
                  Text(
                    date,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 10),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Image.asset(
                    icon,
                    height: 10,
                    color: Theme.of(context).hintColor,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              if (bottom != null) const SizedBox(height: 20),
              bottom ?? const SizedBox.shrink(),
            ],
          ),
        ),
      ],
    );
  }
}
