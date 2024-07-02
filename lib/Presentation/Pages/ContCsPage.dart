import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/Constants/Constants.dart';
import 'package:new_project/Presentation/Widgets/CustomAppbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContCSPage extends StatelessWidget {
  const ContCSPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(context, 'trophies.jpg', false),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomConTrophy(
                  image: 'cupofcups.png',
                  wins: 1,
                  text: AppLocalizations.of(context)!.cafcupofcups,
                ),
                CustomConTrophy(
                  image: 'cc.png',
                  wins: 2,
                  text: AppLocalizations.of(context)!.cafconfiderationcup,
                ),
                CustomConTrophy(
                  image: 'afas.png',
                  wins: 2,
                  text: AppLocalizations.of(context)!.africanasiacup,
                ),
                CustomConTrophy(
                  image: 'sc.png',
                  wins: 4,
                  text: AppLocalizations.of(context)!.cafsupercup,
                ),
                CustomConTrophy(
                  image: 'cl.png',
                  wins: 5,
                  text: AppLocalizations.of(context)!.cafchampionsleague,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomConTrophy extends StatelessWidget {
  CustomConTrophy({super.key, this.wins, this.image, this.text});
  final int? wins;
  final String? image;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              text!,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              color: Colors.cyan,
              height: MediaQuery.of(context).size.height * 0.15,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(trophiesPath + image!))),
                    ),
                  );
                },
                itemCount: wins,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
