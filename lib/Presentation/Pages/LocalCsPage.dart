import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/Constants/Constants.dart';
import 'package:new_project/Presentation/Widgets/CustomAppbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocalTrophy extends StatelessWidget {
  const LocalTrophy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(context, 'trophies.jpg', false),
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomLocalTrophy(
                  image: 'esc.png',
                  wins: 4,
                  text: AppLocalizations.of(context)!.egyptiansupercup,
                ),
                CustomLocalTrophy(
                  image: 'el.png',
                  wins: 14,
                  text: AppLocalizations.of(context)!.egyptianleague,
                ),
                CustomLocalTrophy(
                  image: 'ec.png',
                  wins: 28,
                  text: AppLocalizations.of(context)!.egyptiancup,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomLocalTrophy extends StatelessWidget {
  CustomLocalTrophy({super.key, this.wins, this.image, this.text});
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
                color: Colors.blueAccent[400],
                height: wins! > 14
                    ? MediaQuery.of(context).size.height * 0.5
                    : wins! > 12
                        ? MediaQuery.of(context).size.height * 0.25
                        : MediaQuery.of(context).size.height * 0.15,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Center(
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(trophiesPath + image!))),
                          ),
                        ),
                      );
                    },
                    physics: NeverScrollableScrollPhysics(),
                    reverse: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7, childAspectRatio: 0.5),
                    shrinkWrap: true,
                    itemCount: wins,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
