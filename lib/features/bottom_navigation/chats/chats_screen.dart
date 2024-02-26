import 'package:flutter/material.dart';
import 'package:asistensunnahbloc/components/entry_field.dart';
// import 'package:tasker/locale/locales.dart';
import 'package:asistensunnahbloc/routes/routes.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Theme.of(context).primaryColor,
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
                        'createANewChannel',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      const SizedBox(height: 42),
                      EntryField(
                        label: 'enterTask',
                        hintText: '#baru',
                        initialValue: '#baru',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: 15,
                                ),
                      ),
                      const SizedBox(height: 30),
                      EntryField(
                        label: 'enterTaskDescription',
                        hintText: 'Personal Analysis from data available',
                        initialValue:
                            'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua enim ad minim veniam.',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
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
                                    'createChannel',
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
          child: Image.asset(
            'assets/icons/add_comment.png',
            height: 20,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'chats',
            style:
                Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 28),
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
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: TabBar(
                // padding: const EdgeInsets.symmetric(horizontal: 22),
                indicatorColor: Theme.of(context).primaryColor,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Theme.of(context).primaryColorDark,
                unselectedLabelColor: Theme.of(context).hintColor,
                isScrollable: true,
                tabs: [
                  Tab(text: 'recentChats'),
                  Tab(text: '#channels'),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          color: Theme.of(context).colorScheme.background,
          child: TabBarView(
            children: [
              RecentChatsTab(),
              ChannelsTab(),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatItem {
  String image;
  String name;
  String message;
  String time;

  ChatItem(this.image, this.name, this.message, this.time);
}

class RecentChatsTab extends StatelessWidget {
  RecentChatsTab({super.key});

  final List<ChatItem> _chats = [
    ChatItem(
      'assets/avatar/Layer 1.png',
      'Samantha Smith',
      'I will send updated design.',
      '12:36 pm',
    ),
    ChatItem(
      'assets/avatar/Layer 2.png',
      'Emili Williamson',
      'I will send updated design.',
      '11:58 am',
    ),
    ChatItem(
      'assets/avatar/Layer 3.png',
      'George Taylor',
      'Yes. I got an approval of flow.',
      '09:47 am',
    ),
    ChatItem(
      'assets/avatar/Layer 4.png',
      'Samantha Smith',
      'I will send updated design.',
      '12:36 pm',
    ),
    ChatItem(
      'assets/avatar/Layer 5.png',
      'Emili Williamson',
      'I will send updated design.',
      '11:58 am',
    ),
    ChatItem(
      'assets/avatar/Layer 6.png',
      'George Taylor',
      'Yes. I got an approval of flow.',
      '09:47 am',
    ),
    ChatItem(
      'assets/avatar/Layer 4.png',
      'Samantha Smith',
      'I will send updated design.',
      '12:36 pm',
    ),
    ChatItem(
      'assets/avatar/Layer 5.png',
      'Emili Williamson',
      'I will send updated design.',
      '11:58 am',
    ),
    ChatItem(
      'assets/avatar/Layer 6.png',
      'George Taylor',
      'Yes. I got an approval of flow.',
      '09:47 am',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      itemBuilder: ((context, index) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, PageRoutes.chatPage);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Theme.of(context).dividerColor,
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(_chats[index].image),
                  radius: 19,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              _chats[index].name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    fontSize: 14,
                                  ),
                            ),
                          ),
                          Text(
                            _chats[index].time,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 10,
                                    ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        _chats[index].message,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 14,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
      separatorBuilder: (context, index) {
        return const SizedBox(height: 10);
      },
      itemCount: _chats.length,
    );
  }
}

class ChannelsTab extends StatelessWidget {
  ChannelsTab({super.key});

  final List<ChatItem> _chats = [
    ChatItem(
      'assets/avatar/Layer 1.png',
      '#DesignInspiration',
      'Samantha: Well that’s we called a desig..',
      '12:36 pm',
    ),
    ChatItem(
      'assets/avatar/Layer 2.png',
      '#GeneralDiscussion',
      'Emili added you !',
      '11:58 am',
    ),
    ChatItem(
      'assets/avatar/Layer 3.png',
      '#MarketingIdeas',
      'Yes it will impact on Branding.',
      '09:47 am',
    ),
    ChatItem(
      'assets/avatar/Layer 4.png',
      '#Humoristic',
      'Geroge: Haha !  That was funny.',
      '12:36 pm',
    ),
    ChatItem(
      'assets/avatar/Layer 5.png',
      '#TeamSuggetions',
      'Emili : I will suggest to go with blue one.',
      '11:58 am',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      itemBuilder: ((context, index) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, PageRoutes.channelChatPage);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Theme.of(context).dividerColor,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              _chats[index].name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    fontSize: 14,
                                  ),
                            ),
                          ),
                          Text(
                            _chats[index].time,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 10,
                                    ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        _chats[index].message,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 14,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
      separatorBuilder: (context, index) {
        return const SizedBox(height: 10);
      },
      itemCount: _chats.length,
    );
  }
}
