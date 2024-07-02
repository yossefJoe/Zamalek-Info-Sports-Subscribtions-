import 'package:flutter/material.dart';
import 'package:new_project/Constants/Constants.dart';
import 'package:new_project/Models/Squad.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Coach extends StatelessWidget {
  const Coach({super.key});

  @override
  Widget build(BuildContext context) {
    var locale = Localizations.localeOf(context).languageCode;
    TextStyle leadingstyle =
        TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: Colors.blueGrey[600],
        child: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    locale == "ar"
                        ? arabiccoach[0]['Full Name']
                        : coach[0]['Full Name'],
                    style: TextStyle(color: Colors.red),
                  ),
                  content: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(coach[0]['Coachpicture']),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                      ListTile(
                        leading: Text(
                            AppLocalizations.of(context)!.country + ' : ',
                            style: leadingstyle),
                        trailing: Text(locale == "ar"
                            ? arabiccoach[0]['Nation']
                            : coach[0]['Nation']),
                      ),
                      ListTile(
                        leading: Text(
                            AppLocalizations.of(context)!.dateofbirth + ' : ',
                            style: leadingstyle),
                        trailing: locale == 'ar'
                            ? Text(constants().convertToArabicNumbers(
                                coach[0]['Date of Birth'].toString()))
                            : Text(coach[0]['Date of Birth'].toString()),
                      ),
                      ListTile(
                        leading: Text(AppLocalizations.of(context)!.age + ' : ',
                            style: leadingstyle),
                        trailing: locale == 'ar'
                            ? Text(constants().convertToArabicNumbers(
                                    coach[0]['Age'].toString()) +
                                ' سنة')
                            : Text(coach[0]['Age'].toString() + ' Years'),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            leading: Text(
              AppLocalizations.of(context)!.currentcoach + " :",
              style: TextStyle(color: Colors.white),
            ),
            title: Text(
              locale == "ar"
                  ? arabiccoach[0]['Full Name']
                  : coach[0]['Full Name'],
              style: TextStyle(color: Colors.amber),
            ),
            trailing: Image.asset(
              countriesPath + 'po.png',
              filterQuality: FilterQuality.high,
              height: 20,
            ),
          ),
        ),
      ),
    );
  }
}
