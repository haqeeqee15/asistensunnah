import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:asistensunnahbloc/app_config/app_config.dart';
import 'package:asistensunnahbloc/features/language/bloc/language_cubit.dart';
// import 'package:tasker/locale/locales.dart';
import 'package:asistensunnahbloc/routes/routes.dart';

class LanguageSheet extends StatefulWidget {
  final bool fromRoot;

  const LanguageSheet({Key? key, this.fromRoot = true}) : super(key: key);

  @override
  LanguageSheetState createState() => LanguageSheetState();
}

class LanguageSheetState extends State<LanguageSheet> {
  late LanguageCubit _languageCubit;

  String? selectedLocale;

  @override
  void initState() {
    super.initState();
    _languageCubit = context.read<LanguageCubit>()..getCurrentLanguage();
  }

  @override
  Widget build(BuildContext context) {
    // final locale = AppLocalizations.of(context);
    var theme = Theme.of(context);
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   centerTitle: true,
      //   title: Text(
      //     'chooseLanguage,
      //     style: Theme.of(context).textTheme.bodyLarge?.copyWith(
      //           fontSize: 15,
      //           color: Colors.black,
      //         ),
      //   ),
      // ),
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'selectLanguage',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'selectPreferredLanguage',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).hintColor.withOpacity(0.5),
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      backgroundColor: Colors.white,
      body: SafeArea(
        child: FadedSlideAnimation(
          fadeDuration: const Duration(milliseconds: 300),
          slideDuration: const Duration(milliseconds: 300),
          beginOffset: const Offset(0, 0.3),
          endOffset: const Offset(0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: BlocBuilder<LanguageCubit, Locale>(
                  builder: (context, currentLocale) {
                    selectedLocale ??= 'currentlanguageCode';
                    return ListView.separated(
                      padding: const EdgeInsets.only(
                        bottom: 100,
                        top: 30,
                        left: 24,
                        right: 24,
                      ),
                      physics: const BouncingScrollPhysics(),
                      itemCount: AppConfig.languagesSupported.length,
                      itemBuilder: (context, index) {
                        var langCode =
                            AppConfig.languagesSupported.keys.elementAt(index);
                        return Container(
                          // padding: const EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color:
                                  Theme.of(context).hintColor.withOpacity(0.2),
                            ),
                          ),
                          margin: const EdgeInsets.symmetric(
                              // horizontal: 20.0,
                              // vertical: 10.0,
                              ),
                          child: RadioListTile(
                            title: Text(
                              AppConfig.languagesSupported[langCode]!,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            value: langCode,
                            groupValue: selectedLocale,
                            onChanged: (langCode) async {
                              setState(() {
                                selectedLocale = langCode as String;
                              });
                            },
                            activeColor: theme.primaryColor,
                            fillColor:
                                MaterialStateProperty.all(theme.primaryColor),
                          ),
                        );
                      },
                      separatorBuilder: ((context, index) {
                        return const SizedBox(height: 20);
                      }),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          _languageCubit.setCurrentLanguage(selectedLocale!);
          if (widget.fromRoot) {
            Navigator.pushNamed(context, PageRoutes.loginNavigator);
          } else {
            Navigator.popUntil(
              context,
              ModalRoute.withName(PageRoutes.bottomNavigation),
            );
            Navigator.popAndPushNamed(
              context,
              PageRoutes.bottomNavigation,
            );
          }
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
