import 'package:flutter/material.dart';
import 'package:new_project/Constants/Constants.dart';
import 'package:new_project/Models/Teams.dart';
import 'package:new_project/Presentation/Widgets/CustomAppbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CurrentSeason extends StatelessWidget {
  CurrentSeason({super.key});
  Color getcolor(int index) {
    if (index == 0 || index == 1) {
      return Colors.greenAccent[100]!;
    } else if (index == 2 || index == 3) {
      return Colors.blueAccent[100]!;
    } else if (index == 15 || index == 16 || index == 17) {
      return Colors.red[200]!;
    } else {
      return Colors.white;
    }
  }

  constants z = new constants();
  @override
  Widget build(BuildContext context) {
    var localetype = Localizations.localeOf(context).languageCode;
    TextStyle style = TextStyle(fontSize: 10);
    TextStyle style2 = TextStyle(fontSize: 12);

    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppbar(context, 'league.png', false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: width * 0.05,
                  child: Text(
                    AppLocalizations.of(context)!.pos,
                    style: style,
                  ),
                ),
                Container(
                  width: width * 0.3,
                  child: Text(
                    AppLocalizations.of(context)!.team,
                    style: style,
                  ),
                ),
                Container(
                  width: width * 0.05,
                  child: Text(
                    AppLocalizations.of(context)!.p,
                    style: style,
                  ),
                ),
                Container(
                  width: width * 0.05,
                  child: Text(
                    AppLocalizations.of(context)!.w,
                    style: style,
                  ),
                ),
                Container(
                  width: width * 0.05,
                  child: Text(
                    AppLocalizations.of(context)!.d,
                    style: style,
                  ),
                ),
                Container(
                  width: width * 0.05,
                  child: Text(
                    AppLocalizations.of(context)!.l,
                    style: style,
                  ),
                ),
                Container(
                  width: width * 0.05,
                  child: Text(
                    AppLocalizations.of(context)!.forteam,
                    style: style,
                  ),
                ),
                Container(
                  width: width * 0.05,
                  child: Text(
                    AppLocalizations.of(context)!.on,
                    style: style,
                  ),
                ),
                Container(
                  width: width * 0.05,
                  child: Text(
                    AppLocalizations.of(context)!.dif,
                    style: style,
                  ),
                ),
                Container(
                  width: width * 0.05,
                  child: Text(
                    AppLocalizations.of(context)!.poi,
                    style: style,
                  ),
                ),
              ],
            ),
            ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      color: getcolor(index),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: width * 0.05,
                              child: Text(
                                localetype == 'ar'
                                    ? z.convertToArabicNumbers(
                                        (index + 1).toString())
                                    : (index + 1).toString(),
                                style: localetype == 'ar' ? style2 : style,
                              ),
                            ),
                            Container(
                              width: width * 0.3,
                              child: Text(
                                localetype == 'ar'
                                    ? leagueData['teams'][index]['name_ar']
                                    : leagueData['teams'][index]['name_en']
                                        .toString(),
                                style: style2,
                              ),
                            ),
                            Container(
                              width: width * 0.05,
                              child: Text(
                                localetype == 'ar'
                                    ? z.convertToArabicNumbers(
                                        leagueData['teams'][index]['played']
                                            .toString())
                                    : leagueData['teams'][index]['played']
                                        .toString(),
                                style: localetype == 'ar' ? style2 : style,
                              ),
                            ),
                            Container(
                              width: width * 0.05,
                              child: Text(
                                localetype == 'ar'
                                    ? z.convertToArabicNumbers(
                                        leagueData['teams'][index]['won']
                                            .toString())
                                    : leagueData['teams'][index]['won']
                                        .toString(),
                                style: localetype == 'ar' ? style2 : style,
                              ),
                            ),
                            Container(
                              width: width * 0.05,
                              child: Text(
                                localetype == 'ar'
                                    ? z.convertToArabicNumbers(
                                        leagueData['teams'][index]['drawn']
                                            .toString())
                                    : leagueData['teams'][index]['drawn']
                                        .toString(),
                                style: style,
                              ),
                            ),
                            Container(
                              width: width * 0.05,
                              child: Text(
                                localetype == 'ar'
                                    ? z.convertToArabicNumbers(
                                        leagueData['teams'][index]['lost']
                                            .toString())
                                    : leagueData['teams'][index]['lost']
                                        .toString(),
                                style: localetype == 'ar' ? style2 : style,
                              ),
                            ),
                            Container(
                              width: width * 0.05,
                              child: Text(
                                localetype == 'ar'
                                    ? z.convertToArabicNumbers(
                                        leagueData['teams'][index]['goals_for']
                                            .toString())
                                    : leagueData['teams'][index]['goals_for']
                                        .toString(),
                                style: localetype == 'ar' ? style2 : style,
                              ),
                            ),
                            Container(
                              width: width * 0.05,
                              child: Text(
                                localetype == 'ar'
                                    ? z.convertToArabicNumbers(
                                        leagueData['teams'][index]
                                                ['goals_against']
                                            .toString())
                                    : leagueData['teams'][index]
                                            ['goals_against']
                                        .toString(),
                                style: localetype == 'ar' ? style2 : style,
                              ),
                            ),
                            Container(
                              width: width * 0.05,
                              child: Text(
                                localetype == 'ar'
                                    ? z.convertToArabicNumbers(
                                        leagueData['teams'][index]
                                                ['goal_difference']
                                            .toString())
                                    : leagueData['teams'][index]
                                            ['goal_difference']
                                        .toString(),
                                style: localetype == 'ar' ? style2 : style,
                              ),
                            ),
                            Container(
                              width: width * 0.05,
                              child: Text(
                                localetype == 'ar'
                                    ? z.convertToArabicNumbers(
                                        leagueData['teams'][index]['points']
                                            .toString())
                                    : leagueData['teams'][index]['points']
                                        .toString(),
                                style: localetype == 'ar' ? style2 : style,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: leagueData['teams'].length,
              shrinkWrap: true,
            ),
            ListTile(
              leading: Text(
                AppLocalizations.of(context)!.currentteamposition,
                style: TextStyle(fontSize: 20),
              ),
              title: Text(
                localetype == 'ar' ? z.convertToArabicNumbers('12') : '12',
                style: TextStyle(color: Colors.indigo, fontSize: 20),
              ),
            ),
            Text(
              AppLocalizations.of(context)!.latestupdate,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w400, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
