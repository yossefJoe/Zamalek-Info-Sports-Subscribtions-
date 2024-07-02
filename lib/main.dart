import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:new_project/Constants/ProviderMethods.dart';
import 'package:new_project/Presentation/Pages/HomePage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final isArabic = prefs.getBool("is_arabic") ?? false;

  runApp(MyApp(
    isArabic: isArabic,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, this.isArabic});
  final bool? isArabic;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ZamalekProvider(isArabic!),
        child: Consumer<ZamalekProvider>(
          builder: (context, zamalek, child) {
            return MaterialApp(
              locale: zamalek.locale,
              supportedLocales: [
                Locale('ar', ''),
                Locale('en', ''),
              ],
              debugShowCheckedModeBanner: false,
              title: 'Zamalek',
              theme: ThemeData(
                fontFamily: 'Rademos',
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: HomePage(),
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              localeResolutionCallback: (locale, supportedLocales) {
                for (var supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale!.languageCode) {
                    return supportedLocale;
                  }
                }
                return supportedLocales.first;
              },
            );
          },
        ));
  }
}
