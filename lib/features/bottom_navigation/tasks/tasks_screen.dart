import 'package:flutter/material.dart';
import 'package:asistensunnahbloc/app_config/app_config.dart';
// import 'package:tasker/locale/locales.dart';
import 'package:asistensunnahbloc/routes/routes.dart';

class GridItem {
  String image;
  String count;
  String title;

  GridItem(this.image, this.count, this.title);
}

class TaskItem {
  Color color;
  String title;
  String count;

  TaskItem(this.color, this.title, this.count);
}

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final List<GridItem> gridItems = [];

  final List<TaskItem> tasks = [];

  @override
  void didChangeDependencies() {
    // final locale = AppLocalizations.of(context);
    gridItems.addAll([
      GridItem('assets/home_top/pending_task.png', '08', 'pendingTasks'),
      GridItem(
          'assets/home_top/active_project.png', '26', 'activeProjects'),
      GridItem('assets/home_top/total_tasks.png', '89', 'totalTasks'),
      GridItem('assets/home_top/teams.png', '12', 'teams'),
    ]);
    tasks.addAll([
      TaskItem(
        const Color(0xff00aeef),
        'proposed',
        '4',
      ),
      TaskItem(
        const Color(0xffe5ac31),
        'inProgress',
        '15',
      ),
      TaskItem(
        const Color(0xfff65da8),
        'review',
        '12',
      ),
      TaskItem(
        const Color(0xff67c62e),
        'completed',
        '9',
      ),
    ]);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          AppConfig.appName,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 28),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            iconSize: 16,
            icon: const ImageIcon(
              AssetImage('assets/icons/ic_search.png'),
            ),
          ),
          IconButton(
            onPressed: () {},
            iconSize: 16,
            icon: Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: ImageIcon(
                    AssetImage('assets/icons/ic_notifiaction.png'),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    radius: 7,
                    backgroundColor: const Color(0xff00aeef),
                    child: Text(
                      '2',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            fontSize: 8,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: ClipOval(
              child: Image.asset(
                'assets/profile_pic.png',
                height: 35,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            GridView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 1.8,
              ),
              itemCount: gridItems.length,
              itemBuilder: ((context, index) {
                return Container(
                  alignment: AlignmentDirectional.centerStart,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 18,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Theme.of(context).dividerColor),
                  ),
                  child: FittedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              gridItems[index].image,
                              height: 26,
                              width: 26,
                            ),
                            const SizedBox(width: 14),
                            Text(
                              gridItems[index].count,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Text(
                          gridItems[index].title,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  fontSize: 13,
                                  color: Theme.of(context).hintColor),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: TabBar(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                indicatorColor: Theme.of(context).primaryColor,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Theme.of(context).primaryColorDark,
                unselectedLabelColor: Theme.of(context).hintColor,
                isScrollable: true,
                tabs: [
                  Tab(text: 'tasks'),
                  Tab(text: 'watchlist'),
                ],
              ),
            ),
            const Divider(
              height: 1,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  TasksTab(tasks: tasks),
                  TasksTab(tasks: tasks),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TasksTab extends StatelessWidget {
  const TasksTab({
    super.key,
    required this.tasks,
  });

  final List<TaskItem> tasks;

  @override
  Widget build(BuildContext context) {
    // final locale = AppLocalizations.of(context);
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      itemBuilder: ((context, index) {
        return InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () =>
              Navigator.pushNamed(context, PageRoutes.tasksListingScreen),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Theme.of(context).dividerColor),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 6,
                  backgroundColor: tasks[index].color,
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    tasks[index].title,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                Text(
                  '56 tasks',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 13),
                ),
                const SizedBox(width: 14),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Theme.of(context).hintColor,
                ),
              ],
            ),
          ),
        );
      }),
      separatorBuilder: ((context, index) {
        return const SizedBox(height: 14);
      }),
      itemCount: tasks.length,
    );
  }
}
