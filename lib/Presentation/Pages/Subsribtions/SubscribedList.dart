import 'package:flutter/material.dart';
import 'package:new_project/Constants/Constants.dart';
import 'package:new_project/Constants/ProviderMethods.dart';
import 'package:new_project/Constants/SportSubscribtion.dart';
import 'package:new_project/Presentation/Widgets/RenewalButton.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SubscribedList extends StatelessWidget {
  SubscribedList({super.key});
  String arabicsports(String sport) {
    switch (sport) {
      case 'Volleyball':
        return 'الكرة الطائرة';
      case 'Handball':
        return 'كرة اليد';
      case 'Football':
        return 'كرة القدم';
      case 'Basketball':
        return 'كرة السلة';
      case 'Swimming':
        return 'السباحة';
      case 'Tennis':
        return 'التنس';
      case 'GYM':
        return 'الصالة البدنية';
      default:
        return sport;
    }
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: FutureBuilder(
            future: constants().getUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListTile(
                  title: Text(
                    (locale == "ar" ? " اهلا " : 'Hi ') +
                        snapshot.data!.username,
                    style: TextStyle(color: Colors.red, fontSize: 15),
                  ),
                  subtitle: Text(snapshot.data!.email),
                );
              } else {
                return Text(
                  AppLocalizations.of(context)!.join,
                  style: TextStyle(fontSize: 20),
                );
              }
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Image.asset('assets/logo/ZamalekSC.png',
                  width: 50, height: 50),
            )
          ],
        ),
        body: FutureBuilder(
          future: constants().getUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  itemCount: snapshot.data!.subscriptions.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Consumer<ZamalekProvider>(
                              builder: (context, zamalek, child) {
                                String code = snapshot.data!
                                    .subscriptions[index].subscriptioncode;
                                String renewal =
                                    snapshot.data!.subscriptions[index].renewal;

                                Future<String> newrenewal =
                                    zamalek.getrenewalstate(
                                        snapshot.data!.subscriptions[index]);

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(AppLocalizations.of(context)!
                                            .subscribername +
                                        " : " +
                                        snapshot.data!.subscriptions[index]
                                            .subscribername),
                                    Text(
                                        AppLocalizations.of(context)!.gamename +
                                            " : " +
                                            (locale == 'ar'
                                                ? arabicsports(snapshot
                                                    .data!
                                                    .subscriptions[index]
                                                    .gameName)
                                                : snapshot
                                                    .data!
                                                    .subscriptions[index]
                                                    .gameName)),
                                    Text(AppLocalizations.of(context)!
                                            .gamefees +
                                        " : " +
                                        (locale == 'ar'
                                            ? constants()
                                                .convertToArabicNumbers(snapshot
                                                    .data!
                                                    .subscriptions[index]
                                                    .fees)
                                            : snapshot.data!
                                                .subscriptions[index].fees) +
                                        (locale == 'ar' ? ' ج.م ' : ' L.E ')),
                                    Text(AppLocalizations.of(context)!
                                            .subscriberdate +
                                        " : " +
                                        (locale == 'ar'
                                            ? constants()
                                                .convertToArabicNumbers(snapshot
                                                    .data!
                                                    .subscriptions[index]
                                                    .subscriptiondate
                                                    .substring(0, 11))
                                            : snapshot
                                                .data!
                                                .subscriptions[index]
                                                .subscriptiondate
                                                .substring(0, 11))),
                                    Text(AppLocalizations.of(context)!
                                            .subscribercode +
                                        " : " +
                                        (locale == 'ar'
                                            ? constants()
                                                .convertToArabicNumbers(code)
                                            : code)),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        RenewalButton(
                                            usersnap: snapshot
                                                .data!.subscriptions[index])
                                      ],
                                    )
                                  ],
                                );
                              },
                            )));
                  },
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Center(
                      child: Card(
                          child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(locale == 'en'
                            ? 'You don\'t have any subscribed list yet \n Subsccribe to a Sport To display your list'
                            : 'ليس لديك أي قائمة اشتراكات حتى الآن \n اشترك في رياضة لعرض قائمة المشتركين'),
                      )),
                    )
                  ],
                ),
              );
            }
          },
        ));
  }
}
