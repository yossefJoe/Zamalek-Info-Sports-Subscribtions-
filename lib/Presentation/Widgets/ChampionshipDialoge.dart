import 'package:flutter/material.dart';
import 'package:new_project/Constants/Constants.dart';
import 'package:new_project/Presentation/Pages/ContCsPage.dart';
import 'package:new_project/Presentation/Pages/LocalCsPage.dart';
import 'package:new_project/Presentation/Widgets/CustomDrawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CsDialoge extends StatelessWidget {
  CsDialoge({super.key});
  TextStyle style = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w400, color: Colors.blueGrey[500]);
  @override
  Widget build(BuildContext context) {
    return DrawerItem(
      image: 'championship.png',
      title: AppLocalizations.of(context)!.championships,
      ontap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                AppLocalizations.of(context)!.choosechtype,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.green[900]),
              ),
              content: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ContCSPage(),
                        ));
                      },
                      contentPadding: EdgeInsets.all(10),
                      trailing: Text(
                        AppLocalizations.of(context)!.choosecontchamp,
                        style: style,
                      ),
                      leading: Image.asset(
                        ImagesPath + 'caf.png',
                        height: 50,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LocalTrophy(),
                        ));
                      },
                      contentPadding: EdgeInsets.all(10),
                      trailing: Text(
                        AppLocalizations.of(context)!.chooselocalchamp,
                        style: style,
                      ),
                      leading: Image.asset(
                        ImagesPath + 'epl.png',
                        height: 50,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
