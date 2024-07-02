import 'package:flutter/material.dart';
import 'package:new_project/Presentation/Widgets/CustomAppbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MembershipPage extends StatelessWidget {
  MembershipPage({super.key});
  TextStyle Labelstyle =
      TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold);
  TextStyle titlestyle = TextStyle(
      color: Colors.indigo, fontSize: 15, fontWeight: FontWeight.w400);
  TextStyle leadingstyle = TextStyle(fontSize: 15, fontWeight: FontWeight.w400);
  @override
  Widget build(BuildContext context) {
    var locale = Localizations.localeOf(context).languageCode;
    return Scaffold(
      appBar: CustomAppbar(context, 'gate.jpg', false),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                            child: Text(
                          AppLocalizations.of(context)!.membershipfees,
                          style: Labelstyle,
                        )),
                        ListTile(
                          leading: Text(
                              AppLocalizations.of(context)!.higheducation +
                                  ' : ',
                              style: leadingstyle),
                          trailing: Text(
                            locale == 'ar' ? "٢٥٠ ألف جنيه" : '250 Thousand',
                            style: titlestyle,
                          ),
                        ),
                        ListTile(
                          leading: Text(
                            AppLocalizations.of(context)!.averageeducation +
                                ' : ',
                            style: leadingstyle,
                          ),
                          trailing: Text(
                            locale == 'ar' ? "٣١٠ ألف جنيه" : '310 Thousand',
                            style: titlestyle,
                          ),
                        ),
                        ListTile(
                          leading: Text(
                              AppLocalizations.of(context)!.noeducation + ' : ',
                              style: leadingstyle),
                          trailing: Text(
                            locale == 'ar' ? "٣٣٠ ألف جنيه" : '330 Thousand',
                            style: titlestyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    endIndent: 0,
                    color: Colors.redAccent,
                    thickness: 10,
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Divider(
                    color: Colors.redAccent,
                    thickness: 10,
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                            child: Text(
                          AppLocalizations.of(context)!.neededpaper,
                          style: Labelstyle,
                        )),
                        Text(
                          '\u25CF' + AppLocalizations.of(context)!.p1,
                          style: leadingstyle,
                        ),
                        Text(
                          '\u25CF' + AppLocalizations.of(context)!.p2,
                          style: leadingstyle,
                        ),
                        Text(
                          '\u25CF' + AppLocalizations.of(context)!.p3,
                          style: leadingstyle,
                        ),
                        Text(
                          '\u25CF' + AppLocalizations.of(context)!.p4,
                          style: leadingstyle,
                        ),
                        Text(
                          '\u25CF' + AppLocalizations.of(context)!.p5,
                          style: leadingstyle,
                        ),
                        Text(
                          '\u25CF' + AppLocalizations.of(context)!.p6,
                          style: leadingstyle,
                        ),
                        Text(
                          '\u25CF' + AppLocalizations.of(context)!.p7,
                          style: leadingstyle,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    endIndent: 0,
                    color: Colors.redAccent,
                    thickness: 10,
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Divider(
                    color: Colors.redAccent,
                    thickness: 10,
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                            child: Text(
                          AppLocalizations.of(context)!.mempershiprenewalfees,
                          style: Labelstyle,
                        )),
                        ListTile(
                          leading: Text(
                            AppLocalizations.of(context)!.cost + ' : ',
                            style: leadingstyle,
                          ),
                          title: Text(
                            locale == 'ar' ? "٨٥٠ جنيه" : '850 Pounds',
                            style: titlestyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.redAccent, width: 5)),
            ),
          )
        ],
      ),
    );
  }
}
