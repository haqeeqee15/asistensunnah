import 'package:flutter/material.dart';
import 'package:asistensunnahbloc/components/custom_progress_indicator.dart';
import 'package:asistensunnahbloc/components/entry_field.dart';
import 'package:asistensunnahbloc/components/user_listing_icons.dart';
import 'package:asistensunnahbloc/features/bottom_navigation/tasks/tasks_screen.dart';
// import 'package:tasker/locale/locales.dart';
import 'package:asistensunnahbloc/routes/routes.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final List<GridItem> gridItems = [];

  final List<String> activeProjects = [
    'Shophour Application',
    'Mobimall Website & App',
    'Woochat Web Version',
    'Shophour Application',
    'Mobimall Website & App',
    'Woochat Web Version',
  ];

  @override
  void didChangeDependencies() {
    // final locale = AppLocalizations.of(context);
    gridItems.addAll([
      GridItem(
          'assets/home_top/active_project.png', '26', 'activeProjects'),
      GridItem('assets/home_top/total_tasks.png', '38%', 'tasksDone'),
    ]);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final locale = AppLocalizations.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            context: context,
            builder: ((context) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 35),
                    Text(
                      'createNewProject',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 42),
                    EntryField(
                      label: 'projectName',
                      hintText: 'communityApp',
                      initialValue: "communityApp",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 15,
                          ),
                    ),
                    const SizedBox(height: 30),
                    EntryField(
                      label: 'projectDescription',
                      hintText:
                          'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua enim ad minim veniam.',
                      initialValue:
                          'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua enim ad minim veniam.',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 15,
                          ),
                    ),
                    const SizedBox(height: 30),
                    EntryField(
                      prefixIcon: const Icon(
                        Icons.notifications_none,
                        size: 20,
                      ),
                      label: 'projectDeadline',
                      hintText: '25 Feb 2022',
                      initialValue: '25 Feb 2022',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 15,
                          ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'close',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(20),
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(vertical: 16),
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).primaryColor,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.check),
                                const SizedBox(width: 8),
                                Text(
                                  'addProject',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              );
            }),
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'projects',
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
                  Tab(text: 'active'),
                  Tab(text: 'completed'),
                ],
              ),
            ),
            const Divider(
              height: 1,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ProjectsActiveTab(activeProjects: activeProjects),
                  ProjectsActiveTab(activeProjects: activeProjects),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectsActiveTab extends StatelessWidget {
  const ProjectsActiveTab({
    super.key,
    required this.activeProjects,
  });

  final List<String> activeProjects;

  @override
  Widget build(BuildContext context) {
    // final locale = AppLocalizations.of(context);
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemBuilder: ((context, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                PageRoutes.projectInfoScreen,
                arguments: activeProjects[index],
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                ),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          activeProjects[index],
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      Icon(
                        Icons.check_circle_outline,
                        size: 16,
                        color: Theme.of(context).hintColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '22%',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const CustomProgressIndicator(subTasksCompleted: 1),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Expanded(
                        child: UserListingIcons(),
                      ),
                      Image.asset(
                        'assets/icons/ic_notifiaction.png',
                        height: 14,
                        color: Theme.of(context).hintColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '25 feb',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontSize: 14),
                      ),
                      const SizedBox(width: 8),
                      CircleAvatar(
                        radius: 2,
                        backgroundColor: Theme.of(context).hintColor,
                      ),
                      const SizedBox(width: 8),
                      Image.asset(
                        'assets/icons/ic_task copy.png',
                        height: 14,
                        color: Theme.of(context).hintColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '65 tasks',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
        separatorBuilder: ((context, index) {
          return const SizedBox(height: 10);
        }),
        itemCount: activeProjects.length,
      ),
    );
  }
}
