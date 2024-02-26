import 'package:flutter/material.dart';
import 'package:asistensunnahbloc/components/entry_field.dart';
import 'package:asistensunnahbloc/components/user_listing_icons.dart';
// import 'package:tasker/locale/locales.dart';
import 'package:asistensunnahbloc/routes/routes.dart';

class ProjectTaskInfoScreen extends StatelessWidget {
  ProjectTaskInfoScreen({Key? key}) : super(key: key);

  final List<String> _tasks = [
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
    final header = ModalRoute.of(context)?.settings.arguments as Widget?;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
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
                      'createANewTask',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 42),
                    EntryField(
                      label: 'enterTask',
                      hintText: 'Personal Analysis from data available',
                      initialValue: 'Personal Analysis from data available',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 15,
                          ),
                    ),
                    const SizedBox(height: 30),
                    EntryField(
                      label: 'enterTaskDescription',
                      hintText: 'Personal Analysis from data available',
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
                      label: 'taskDeadline',
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
                              Navigator.popAndPushNamed(
                                  context, PageRoutes.addTaskInfoScreen);
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
                                  'createTask',
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
        label: Row(
          children: [
            Icon(
              Icons.add,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            const SizedBox(width: 12),
            Text('addNewTask'),
          ],
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            iconSize: 24,
            icon: const Icon(Icons.more_horiz_outlined),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            iconSize: 24,
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: header ?? const SizedBox.shrink(),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.background,
              child: ListView.separated(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: 100,
                ),
                itemBuilder: ((context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
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
                              const SizedBox(width: 8),
                              Text(
                                '25 feb',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            _tasks[index],
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontSize: 14),
                          ),
                        ),
                        const Divider(height: 36),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                  );
                }),
                separatorBuilder: ((context, index) {
                  return const SizedBox(height: 10);
                }),
                itemCount: _tasks.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
