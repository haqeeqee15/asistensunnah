import 'package:flutter/material.dart';
// import 'package:tasker/locale/locales.dart';

class FAQsScreen extends StatefulWidget {
  const FAQsScreen({Key? key}) : super(key: key);

  @override
  State<FAQsScreen> createState() => _FAQsScreenState();
}

class _FAQsScreenState extends State<FAQsScreen> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    // final locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          Text(
            "'faqs",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          Text(
            "'yourQuestionGotAnswered",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 14,
                ),
          ),
          const SizedBox(height: 24),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              return InkWell(
                onTap: () {
                  selectedIndex = index;
                  // height == 50 ? 0 : 50;
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                  child: ExpansionTile(
                    textColor: Theme.of(context).primaryColorDark,
                    childrenPadding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    title: const Text('How to Lorem ipsum dolor ?'),
                    children: const [
                      Text(
                          'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua enim ad minim veniam.'),
                    ],
                  ),
                ),
              );
            }),
            separatorBuilder: ((context, index) {
              return const SizedBox(height: 10);
            }),
            itemCount: 20,
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
