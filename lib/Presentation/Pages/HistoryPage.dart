import 'package:flutter/material.dart';
import 'package:new_project/Constants/Constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});
  @override
  Widget build(BuildContext context) {
    var localetype = Localizations.localeOf(context).languageCode;

    TextStyle leading = TextStyle(
        fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white);
    TextStyle trailing = TextStyle(
        fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w300);

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Divider(
            color: Colors.redAccent,
            thickness: 10,
          ),
          Text(
            AppLocalizations.of(context)!.zamaleksc,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 5),
          ),
          Divider(
            color: Colors.redAccent,
            thickness: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              color: Colors.blueGrey[800],
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/logo/ZamalekSC.png',
                          filterQuality: FilterQuality.high, height: 70),
                      ListTile(
                        trailing: Text(
                          AppLocalizations.of(context)!.zsc,
                          style: trailing,
                        ),
                        leading: Text(
                          AppLocalizations.of(context)!.fullname,
                          style: leading,
                        ),
                      ),
                      ListTile(
                        trailing: Text(
                          AppLocalizations.of(context)!.stadium,
                          style: trailing,
                        ),
                        leading: Text(
                          AppLocalizations.of(context)!.historicalpitch,
                          style: leading,
                        ),
                      ),
                      ListTile(
                        trailing: Text(
                          AppLocalizations.of(context)!.goerge,
                          style: trailing,
                        ),
                        leading: Text(
                          AppLocalizations.of(context)!.founder,
                          style: leading,
                        ),
                        title: Image.asset(
                          presedintsPath + 'morzbakh.jpg',
                          height: 50,
                        ),
                      ),
                      ListTile(
                        trailing: Text(
                          AppLocalizations.of(context)!.foundeddate,
                          textAlign: TextAlign.center,
                          style: trailing,
                        ),
                        leading: Text(
                          AppLocalizations.of(context)!.founded,
                          style: leading,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: localetype == 'ar'
                                  ? MainAxisAlignment.spaceBetween
                                  : MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.nicknames,
                                  style: leading,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Column(
                                    crossAxisAlignment: localetype == 'ar'
                                        ? CrossAxisAlignment.start
                                        : CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!
                                            .schoolofartandengineering,
                                        style: trailing,
                                      ),
                                      Text(
                                        AppLocalizations.of(context)!
                                            .theroyalklub,
                                        style: trailing,
                                      ),
                                      Text(
                                        AppLocalizations.of(context)!
                                            .theconquerorofforeigners,
                                        style: trailing,
                                      ),
                                      Text(
                                        AppLocalizations.of(context)!
                                            .thewhitecastle,
                                        style: trailing,
                                      ),
                                      Text(
                                        AppLocalizations.of(context)!
                                            .thewhiteknight,
                                        style: trailing,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.redAccent,
            thickness: 10,
          ),
          Text(
            AppLocalizations.of(context)!.zamaleksc,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 5),
          ),
          Divider(
            color: Colors.redAccent,
            thickness: 10,
          ),
        ],
      ),
    ));
  }
}
