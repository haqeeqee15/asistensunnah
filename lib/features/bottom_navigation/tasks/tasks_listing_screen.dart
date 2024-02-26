import 'package:flutter/material.dart';
import 'package:asistensunnahbloc/components/user_listing_icons.dart';
// import 'package:tasker/locale/locales.dart';
import 'package:asistensunnahbloc/routes/routes.dart';

class TasksListingScreen extends StatelessWidget {
  const TasksListingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final locale = AppLocalizations.of(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          centerTitle: true,
          title: Text('tasks'),
          actions: [
            IconButton(
              onPressed: () {},
              iconSize: 16,
              icon: const ImageIcon(
                AssetImage('assets/icons/ic_search.png'),
              ),
            ),
          ],
          bottom: TabBar(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            indicatorColor: Theme.of(context).primaryColor,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Theme.of(context).primaryColorDark,
            unselectedLabelColor: Theme.of(context).hintColor,
            isScrollable: true,
            tabs: [
              Tab(text: 'proposed'),
              Tab(text: 'inProgress'),
              Tab(text: '.review'),
              Tab(text: 'completed'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ProposedTab(),
            ProposedTab(),
            ProposedTab(),
            ProposedTab(),
          ],
        ),
      ),
    );
  }
}

class ProposedTab extends StatelessWidget {
  ProposedTab({
    super.key,
  });

  final List<String> _items = [
    'App Development for Ecommerce with multiple Vendor',
    'Api set up for student tracking App.',
    'App Development for Ecommerce with multiple Vendor',
    'Api set up for student tracking App.',
    'App Development for Ecommerce with multiple Vendor',
    'Api set up for student tracking App.',
  ];

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
          onTap: () {
            Navigator.pushNamed(context, PageRoutes.taskInfoScreen);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
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
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
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
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    _items[index],
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
                const SizedBox(height: 15),
                const Divider(
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 15,
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: UserListingIcons(),
                      ),
                      Image.asset(
                        'assets/icons/ic_conection.png',
                        color: Theme.of(context).hintColor,
                        height: 12,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '05',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(width: 20),
                      Image.asset(
                        'assets/icons/ic_attachment.png',
                        height: 12,
                        color: Theme.of(context).hintColor,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '20',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(width: 20),
                      Image.asset(
                        'assets/icons/ic_chat.png',
                        color: Theme.of(context).hintColor,
                        height: 12,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '05',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
      separatorBuilder: ((context, index) {
        return const SizedBox(
          height: 10,
        );
      }),
      itemCount: _items.length,
    );
  }
}
