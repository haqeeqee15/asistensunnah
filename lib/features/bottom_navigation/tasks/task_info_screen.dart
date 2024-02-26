import 'package:flutter/material.dart';
import 'package:asistensunnahbloc/components/custom_progress_indicator.dart';
// import 'package:tasker/locale/locales.dart';

class SubTaskItem {
  String title;
  bool isCompleted;

  SubTaskItem(this.title, this.isCompleted);
}

class TaskInfoScreen extends StatefulWidget {
  const TaskInfoScreen({Key? key}) : super(key: key);

  @override
  State<TaskInfoScreen> createState() => _TaskInfoScreenState();
}

class _TaskInfoScreenState extends State<TaskInfoScreen> {
  final List<SubTaskItem> _subTasks = [
    SubTaskItem('Collect database from client', true),
    SubTaskItem('Get App Resources from UI designer', false),
    SubTaskItem('Generate App Playstore Resources', false),
    SubTaskItem('Setup API for Apps', false),
  ];

  int _subTasksCompleted = 1;

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
            'App Development for Ecommerce with multiple Vendor',
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
              Expanded(
                child: Text(
                  '4 subtasks',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Text(
                '${_subTasksCompleted * (100 / _subTasks.length)}% done',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 14,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomProgressIndicator(subTasksCompleted: _subTasksCompleted),
          const SizedBox(height: 32),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: ((context, index) {
              return InkWell(
                onTap: () {
                  _subTasksCompleted = 0;
                  setState(() {
                    _subTasks[index].isCompleted =
                        !(_subTasks[index].isCompleted);
                    for (var item in _subTasks) {
                      if (item.isCompleted) {
                        _subTasksCompleted++;
                      }
                    }
                  });
                },
                child: Row(
                  children: [
                    if (_subTasks[index].isCompleted)
                      Icon(
                        Icons.check_circle,
                        color: Theme.of(context).primaryColor.withOpacity(0.2),
                      )
                    else
                      Container(
                        height: 20,
                        width: 20,
                        margin: const EdgeInsetsDirectional.only(
                          start: 2,
                          top: 2,
                          bottom: 2,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(width: 2),
                          shape: BoxShape.circle,
                        ),
                      ),
                    const SizedBox(width: 20),
                    Text(
                      _subTasks[index].title,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 14,
                            decoration: _subTasks[index].isCompleted
                                ? TextDecoration.lineThrough
                                : null,
                            color: _subTasks[index].isCompleted
                                ? null
                                : Theme.of(context).primaryColorDark,
                          ),
                    ),
                  ],
                ),
              );
            }),
            separatorBuilder: ((context, index) {
              return const Divider(
                height: 30,
              );
            }),
            itemCount: _subTasks.length,
          ),
          const Divider(height: 30),
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
          const SizedBox(height: 30),
          Row(
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
          const SizedBox(height: 20),
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
            itemCount: 3,
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
          buildTile(
            context,
            image: 'assets/avatar/Layer 11.png',
            name: 'Emili Williamson',
            subtitle: 'attachedFiles',
            icon: 'assets/icons/ic_attachment.png',
            date: 'Apr 08, Sun',
            bottom: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/avatar/Layer 15.png',
                    height: 54,
                    width: 54,
                  ),
                ),
                const SizedBox(width: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/avatar/Layer 14.png',
                    height: 54,
                    width: 54,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 38),
          buildTile(
            context,
            image: 'assets/avatar/Layer 10.png',
            name: 'Samantha Smith',
            subtitle: 'commentedOnTasK',
            icon: 'assets/icons/ic_chat.png',
            date: 'Apr 04, Sun',
            bottom: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).colorScheme.background,
              ),
              child: const Row(
                children: [
                  Text('Nice, but fix error in banner !!'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 38),
          buildTile(
            context,
            image: 'assets/avatar/Layer 16.png',
            name: 'George Taylor',
            subtitle: 'addedASubtask',
            icon: 'assets/icons/ic_conection.png',
            date: 'Apr 10, Sun',
            bottom: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text('Get App Resources from UI designer'),
                    ),
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      value: false,
                      onChanged: (val) {},
                    ),
                  ],
                ),
                const Divider(),
              ],
            ),
          ),
          const SizedBox(height: 38),
          buildTile(
            context,
            image: 'assets/avatar/Layer 8.png',
            name: 'Samantha Smith',
            subtitle: 'assignedProjectRole',
            icon: 'assets/icons/add_member2.png',
            date: 'Apr 04, Sun',
            bottom: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 14,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                ),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/avatar/Layer 12.png'),
                    radius: 18,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Samantha Smith',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: 14,
                            ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'assignee',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 14,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
