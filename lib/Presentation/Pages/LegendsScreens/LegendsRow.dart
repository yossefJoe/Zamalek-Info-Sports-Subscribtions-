import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_project/Constants/Constants.dart';
import 'package:new_project/Presentation/Pages/LegendsScreens/LegendaryPlayers.dart';
import 'package:new_project/Presentation/Pages/LegendsScreens/LegendaryPresedints.dart';
import 'package:new_project/Presentation/Pages/LegendsScreens/LegenderyCoaches.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LegendsRow extends StatelessWidget {
  LegendsRow({super.key});
  TextStyle style = TextStyle(fontSize: 10, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => LegendaryPres(),
              ));
            },
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(ImagesPath + 'president.jpg'),
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.fill),
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.legendarypresidents,
                  style: style,
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => LegendaryCoaches(),
              ));
            },
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(ImagesPath + 'coach.png'),
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.fill),
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.legendarycoaches,
                  style: style,
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => LegendaryPlayers(),
              ));
            },
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(ImagesPath + 'player.png'),
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.fill),
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.legendaryplayers,
                  style: style,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
