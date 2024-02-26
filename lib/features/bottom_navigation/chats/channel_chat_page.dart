import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
// import 'package:tasker/locale/locales.dart';

class ChannelChatPage extends StatefulWidget {
  const ChannelChatPage({super.key});

  @override
  ChannelChatPageState createState() => ChannelChatPageState();
}

class ChannelChatPageState extends State<ChannelChatPage> {
  @override
  Widget build(BuildContext context) {
    // final locale = AppLocalizations.of(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              constraints: const BoxConstraints.expand(),
              padding: const EdgeInsets.only(top: 60.0, bottom: 76),
              child: FadedScaleAnimation(
                scaleDuration: const Duration(milliseconds: 400),
                fadeDuration: const Duration(milliseconds: 400),
                child: const MessageStream(),
              ),
            ),
            Positioned(
              top: 12,
              left: 0,
              right: 0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, size: 16),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '#DesignInspiration',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '4 members',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 13,
                                    color: Theme.of(context).hintColor,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Image.asset(
                      'assets/icons/add_member2.png',
                      height: 16,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Icon(
                      Icons.info_outline,
                      size: 20,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  const SizedBox(width: 14),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 18.0,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Theme.of(context).scaffoldBackgroundColor,
                    filled: true,
                    hintText: 'writeYourMessage',
                    hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 13.5, color: const Color(0xffa2a2a2)),
                    prefixIcon: Image.asset(
                      'assets/icons/ic_attachment.png',
                      scale: 2.5,
                    ),
                    suffixIcon: Icon(
                      Icons.send,
                      color: Theme.of(context).primaryColor,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Theme.of(context).hintColor.withOpacity(0.2),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  const MessageStream({super.key});

  @override
  Widget build(BuildContext context) {
    List<MessageBubble> messageBubbles = [
      const MessageBubble(
        sender: 'user',
        text: 'Lorem ipsum dolor sit amet,\nconse adipisicing elit.',
        time: '11:58 am',
        isDelivered: false,
        isMe: true,
      ),
      const MessageBubble(
        sender: 'delivery_partner',
        text:
            'Lorem ipsum dolor sit amet, conse\nadipisicing elit, sed do eiusmod\ntempor incididunt.',
        time: '11:59 am',
        isDelivered: false,
        isMe: false,
      ),
      const MessageBubble(
        sender: 'user',
        text: 'Lorem ipsum dolor sit amet,\nconse adipisicing elit.',
        time: '11:58 am',
        isDelivered: false,
        isMe: true,
      ),
    ];
    return ListView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      children: messageBubbles,
    );
  }
}

class MessageBubble extends StatelessWidget {
  final bool? isMe;
  final String? text;
  final String? sender;
  final String? time;
  final bool? isDelivered;
  final String? image;

  const MessageBubble({
    super.key,
    this.sender,
    this.text,
    this.time,
    this.isMe,
    this.isDelivered,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    // final locale = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment:
            isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Material(
            elevation: 4.0,
            color: isMe!
                ? Theme.of(context).primaryColor
                : Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(16.0),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
              child: Column(
                crossAxisAlignment:
                    isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: <Widget>[
                  if (isMe ?? false)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'you',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(width: 6),
                        ClipOval(
                          child: Image.asset(
                            'assets/profile_pic.png',
                            height: 26,
                          ),
                        ),
                      ],
                    )
                  else
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipOval(
                          child: Image.asset(
                            'assets/avatar/Layer 13.png',
                            height: 26,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Samantha',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  if (image != null)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        image ?? '',
                        height: 180,
                      ),
                    ),
                  if (image != null) const SizedBox(height: 12),
                  Text(
                    text!,
                    textAlign: !isMe! ? TextAlign.left : TextAlign.right,
                    style: isMe!
                        ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 13.5,
                            height: 1.6,
                            color: Theme.of(context).scaffoldBackgroundColor)
                        : Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 13.5,
                              height: 1.6,
                            ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        time!,
                        style: TextStyle(
                          fontSize: 11,
                          color: isMe!
                              ? const Color(0x99b8f7ee)
                              : const Color(0x474d4d4d),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      isMe!
                          ? Icon(
                              Icons.check_circle,
                              color:
                                  isDelivered! ? Colors.blue : Colors.grey[300],
                              size: 12.0,
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
