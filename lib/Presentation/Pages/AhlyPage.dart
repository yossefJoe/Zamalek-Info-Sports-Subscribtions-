import 'package:flutter/material.dart';
import 'package:new_project/Constants/Constants.dart';
import 'package:new_project/Models/Rival.dart';
import 'package:new_project/Presentation/Widgets/CustomAppbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AhlyPage extends StatelessWidget {
  AhlyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    List<String> labels = [
      AppLocalizations.of(context)!.teamname,
      AppLocalizations.of(context)!.matches,
      AppLocalizations.of(context)!.firstmatchdate,
      AppLocalizations.of(context)!.wins,
      AppLocalizations.of(context)!.draws,
      AppLocalizations.of(context)!.biggestwin,
      AppLocalizations.of(context)!.localchampionships,
      AppLocalizations.of(context)!.internationalchampionships,
      AppLocalizations.of(context)!.totalchampionships,
      AppLocalizations.of(context)!.topscorers,
      AppLocalizations.of(context)!.topscorergoals,
      AppLocalizations.of(context)!.teamlocation,
    ];

    var localetype = Localizations.localeOf(context).languageCode;
    return Scaffold(
      appBar: CustomAppbar(context, 'derby.png', false),
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.indigo[800]!.withOpacity(0.7),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('assets/logo/ZamalekSC.png',
                              height: 50,
                              width: 50,
                              filterQuality: FilterQuality.high),
                          Image.asset(ImagesPath + 'rival.png',
                              height: 50,
                              width: 50,
                              filterQuality: FilterQuality.high),
                        ],
                      ),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.22,
                                  child: Text(
                                      locale == 'ar'
                                          ? arabiczamalekstats[index].toString()
                                          : zamalekstats[index].toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black)),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Text(labels[index],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.22,
                                  child: Text(
                                      locale == 'ar'
                                          ? arabicahlystats[index].toString()
                                          : ahlystats[index].toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black)),
                                ),
                              ],
                            ),
                          );
                        },
                        shrinkWrap: true,
                        itemCount: labels.length,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
