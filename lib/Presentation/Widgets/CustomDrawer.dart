import 'package:flutter/material.dart';
import 'package:new_project/Constants/ProviderMethods.dart';
import 'package:new_project/Presentation/Pages/AhlyPage.dart';
import 'package:new_project/Presentation/Pages/HistoryPage.dart';
import 'package:new_project/Presentation/Pages/LegendaryPics.dart';
import 'package:new_project/Constants/Constants.dart';
import 'package:new_project/Presentation/Pages/CurrentSeasonPage.dart';
import 'package:new_project/Presentation/Pages/CurrentSquad.dart';
import 'package:new_project/Presentation/Pages/LegendsScreens/LegendsPage.dart';
import 'package:new_project/Presentation/Pages/MembershipPage.dart';
import 'package:new_project/Presentation/Pages/MemorialPage.dart';
import 'package:new_project/Presentation/Pages/Subsribtions/SubscribtionsType.dart';
import 'package:new_project/Presentation/Widgets/ChampionshipDialoge.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});
  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 2.0;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );

        return FadeTransition(
          opacity: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImagesPath + 'drawer.jpg'),
                filterQuality: FilterQuality.high,
                fit: BoxFit.fitHeight)),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DrawerItem(
                  image: 'flag.jpg',
                  title: AppLocalizations.of(context)!.beamember,
                  ontap: () {
                    Navigator.of(context).push(_createRoute(MembershipPage()));
                  },
                ),
                DrawerItem(
                  image: 'history.png',
                  title: AppLocalizations.of(context)!.history,
                  ontap: () {
                    Navigator.of(context).push(_createRoute(HistoryPage()));
                  },
                ),
                DrawerItem(
                  image: 'legends.jpg',
                  title: AppLocalizations.of(context)!.legends,
                  ontap: () {
                    Navigator.of(context).push(_createRoute(LegendsPage()));
                  },
                ),
                DrawerItem(
                  image: 'squad.jpg',
                  title: AppLocalizations.of(context)!.squad,
                  ontap: () {
                    Navigator.of(context).push(_createRoute(SquadPage()));
                  },
                ),
                CsDialoge(),
                DrawerItem(
                  image: 'sports.jpg',
                  title: AppLocalizations.of(context)!.sports,
                  ontap: () {
                    Navigator.of(context)
                        .push(_createRoute(SubscribtionsType()));
                  },
                ),
                DrawerItem(
                  image: 'season.png',
                  title: AppLocalizations.of(context)!.currentsason,
                  ontap: () {
                    Navigator.of(context).push(_createRoute(CurrentSeason()));
                  },
                ),
                DrawerItem(
                  image: 'rival.png',
                  title: AppLocalizations.of(context)!.historicalrivals,
                  ontap: () {
                    Navigator.of(context).push(_createRoute(AhlyPage()));
                  },
                ),
                DrawerItem(
                  image: '20_2.png',
                  title: AppLocalizations.of(context)!.memorial,
                  ontap: () {
                    Navigator.of(context).push(_createRoute(MemorialPage()));
                  },
                ),
                DrawerItem(
                  image: 'pics.jpg',
                  title: AppLocalizations.of(context)!.pics,
                  ontap: () {
                    Navigator.of(context).push(_createRoute(PicsPage()));
                  },
                ),
                Consumer<ZamalekProvider>(
                  builder: (context, zamalek, child) {
                    return DrawerItem(
                      image: 'language.png',
                      title: AppLocalizations.of(context)!.changelanguage,
                      ontap: () {
                        zamalek.change_language();
                      },
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  DrawerItem({super.key, this.image, this.title, this.ontap});
  final String? image;
  final String? title;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: GestureDetector(
          onTap: ontap,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.1,
            color: Colors.redAccent.withOpacity(0.5),
            child: Center(
              child: ListTile(
                leading: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          ImagesPath + image!,
                        ),
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.fitHeight,
                      )),
                ),
                title: Text(
                  title!,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
