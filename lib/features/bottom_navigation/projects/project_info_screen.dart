import 'package:flutter/material.dart';
import 'package:asistensunnahbloc/components/custom_progress_indicator.dart';
// import 'package:tasker/locale/locales.dart';
import 'package:asistensunnahbloc/routes/routes.dart';

class ActiveTaskItem {
  String title;
  int percentage;
  String tasks;
  Color color;

  ActiveTaskItem(this.title, this.percentage, this.tasks, this.color);
}

class ProjectInfoScreen extends StatelessWidget {
  ProjectInfoScreen({Key? key}) : super(key: key);

  final List<ActiveTaskItem> _activeTasks = [
    ActiveTaskItem(
      'Market Research and Analysis',
      87,
      '4',
      const Color(0xff48c330),
    ),
    ActiveTaskItem(
      'Visual and Technical Design',
      69,
      '6',
      const Color(0xffeaaa1f),
    ),
    ActiveTaskItem(
      'User Interface Design',
      23,
      '10',
      const Color(0xfff35b74),
    ),
    ActiveTaskItem(
      'Development and Implementation',
      36,
      '25',
      const Color(0xff5acdf3),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // final locale = AppLocalizations.of(context);
    final title = ModalRoute.of(context)?.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            iconSize: 16,
            icon: const ImageIcon(
              AssetImage('assets/icons/add_member2.png'),
            ),
          ),
          IconButton(
            onPressed: () {},
            iconSize: 16,
            icon: const Padding(
              padding: EdgeInsets.all(6.0),
              child: ImageIcon(
                AssetImage('assets/icons/ic_attachment.png'),
              ),
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(Icons.more_horiz_outlined),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              title ?? 'Shophour Application',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua enim ad minim veniam.',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    height: 1.5,
                  ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '65 tasks',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Text(
                  '22% done',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CustomProgressIndicator(subTasksCompleted: 1),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(18),
            color: Theme.of(context).colorScheme.background,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Active Tasks',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                Image.asset(
                  'assets/icons/ic_task copy.png',
                  height: 14,
                ),
                const SizedBox(width: 10),
                Text(
                  'addSection'.toUpperCase(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: ((context, index) {
              final Widget widget = Hero(
                tag: 'header$index',
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  child: Row(
                    children: [
                      CircularProgressIndicator(
                        value: _activeTasks[index].percentage / 100,
                        strokeWidth: 5,
                        backgroundColor:
                            Theme.of(context).colorScheme.background,
                        color: _activeTasks[index].color,
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _activeTasks[index].title,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Text(
                                  '${_activeTasks[index].percentage}%',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                const SizedBox(width: 14),
                                CircleAvatar(
                                  radius: 2,
                                  backgroundColor: Theme.of(context).hintColor,
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Text(
                                    '${_activeTasks[index].tasks} tasks',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 20,
                                  color: Theme.of(context).hintColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    PageRoutes.projectTaskInfoScreen,
                    arguments: widget,
                  );
                },
                child: widget,
              );
            }),
            separatorBuilder: ((context, index) {
              return Divider(
                thickness: 6,
                height: 6,
                color: Theme.of(context).colorScheme.background,
              );
            }),
            itemCount: _activeTasks.length,
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
          SizedBox(
            height: 90,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
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
          ),
          const SizedBox(height: 20),
          GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
        ],
      ),
    );
  }
}
