import 'package:flutter/material.dart';
import 'package:asistensunnahbloc/components/custom_progress_indicator.dart';
import 'package:asistensunnahbloc/components/entry_field.dart';
import 'package:asistensunnahbloc/features/bottom_navigation/tasks/tasks_screen.dart';
// import 'package:tasker/locale/locales.dart';

class PendingTeamItem {
  String image;
  String name;
  String subtitle;
  bool isInvitationSent;

  PendingTeamItem(this.image, this.name, this.subtitle, this.isInvitationSent);
}

class TeamsScreen extends StatefulWidget {
  const TeamsScreen({Key? key}) : super(key: key);

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  final List<GridItem> gridItems = [];

  final List<String> allEmployees = [
    'Samantha Smith',
    'Emili Williamson',
    'George Taylor',
    'Samantha Smith',
    'Emili Williamson',
    'George Taylor',
  ];

  final List<PendingTeamItem> pendingTeams = [
    PendingTeamItem(
      'assets/pic_profile.png',
      'elvishopeson@email.com',
      'Not on Tasker yet',
      true,
    ),
    PendingTeamItem(
      'assets/avatar/Layer 13.png',
      'Melisa Peterson',
      'UI Designer',
      false,
    ),
    PendingTeamItem(
      'assets/avatar/Layer 14.png',
      'Lillian Walker',
      'Developer',
      true,
    ),
  ];

  @override
  void didChangeDependencies() {
    // final locale = AppLocalizations.of(context);
    gridItems.addAll([
      GridItem('assets/home_top/teams.png', '12', 'teams'),
      GridItem('assets/home_top/pending_task.png', '08','pendingInvites'),
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
                      initialValue: 'communityApp',
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
        child: const Icon(Icons.person_add_alt_1_outlined),
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
            Row(
              children: [
                Expanded(
                  child: TabBar(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    indicatorColor: Theme.of(context).primaryColor,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: Theme.of(context).primaryColorDark,
                    unselectedLabelColor: Theme.of(context).hintColor,
                    isScrollable: true,
                    tabs: [
                      Tab(text: 'allEmployees'),
                      Tab(text: 'pending'),
                    ],
                  ),
                ),
                Text(
                  'allTeams',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 14),
                ),
                const SizedBox(width: 6),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Theme.of(context).hintColor,
                ),
                const SizedBox(width: 24),
              ],
            ),
            const Divider(
              height: 1,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  TeamsAllEmployeesTab(allEmployees: allEmployees),
                  PendingTab(pendingTeams: pendingTeams),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TeamsAllEmployeesTab extends StatelessWidget {
  const TeamsAllEmployeesTab({
    super.key,
    required this.allEmployees,
  });

  final List<String> allEmployees;

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
              // Navigator.pushNamed(
              //   context,
              //   PageRoutes.projectInfoScreen,
              //   arguments: activeProjects[index],
              // );
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipOval(
                        child: Image.asset(
                            'assets/avatar/Layer ${index + 3}.png',
                            height: 36,
                            width: 36),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              allEmployees[index],
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'developer',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/icons/ic_chat.png',
                        height: 16,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const CustomProgressIndicator(subTasksCompleted: 1),
                  const SizedBox(height: 20),
                  Row(
                    children: [
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
                      const SizedBox(width: 8),
                      CircleAvatar(
                        radius: 2,
                        backgroundColor: Theme.of(context).hintColor,
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.check_circle_outline,
                        size: 16,
                        color: Theme.of(context).hintColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '46%',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontSize: 14),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.more_horiz_outlined,
                        color: Theme.of(context).hintColor,
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
        itemCount: allEmployees.length,
      ),
    );
  }
}

class PendingTab extends StatelessWidget {
  const PendingTab({
    super.key,
    required this.pendingTeams,
  });

  final List<PendingTeamItem> pendingTeams;

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
              // Navigator.pushNamed(
              //   context,
              //   PageRoutes.projectInfoScreen,
              //   arguments: activeProjects[index],
              // );
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipOval(
                        child: Image.asset(pendingTeams[index].image,
                            height: 36, width: 36),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pendingTeams[index].name,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              pendingTeams[index].subtitle,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/icons/ic_chat.png',
                        height: 16,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const CustomProgressIndicator(subTasksCompleted: 1),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      if (pendingTeams[index].isInvitationSent)
                        Icon(
                          Icons.check_circle_outline,
                          size: 16,
                          color: Theme.of(context).hintColor,
                        )
                      else
                        Icon(
                          Icons.person_add_alt_1_outlined,
                          color: Theme.of(context).hintColor,
                          size: 16,
                        ),
                      const SizedBox(width: 8),
                      Text(
                        pendingTeams[index].isInvitationSent
                            ? 'invitationSent'
                            : 'requestedToJoin',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontSize: 14),
                      ),
                      const Spacer(),
                      if (pendingTeams[index].isInvitationSent)
                        Text(
                          'cancel',
                          style: Theme.of(context).textTheme.titleSmall,
                        )
                      else
                        Row(
                          children: [
                            Text(
                              'reject',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(width: 8),
                            CircleAvatar(
                              radius: 2,
                              backgroundColor: Theme.of(context).hintColor,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'accept',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
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
        itemCount: pendingTeams.length,
      ),
    );
  }
}
