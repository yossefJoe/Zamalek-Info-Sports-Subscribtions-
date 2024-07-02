import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_project/Constants/Constants.dart';
import 'package:new_project/Presentation/Pages/Subsribtions/SubscribeToSport.dart';
import 'package:new_project/Presentation/Pages/Subsribtions/SubscribedList.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SubscribtionsType extends StatelessWidget {
  SubscribtionsType({super.key});
  TextStyle textStyle =
      TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImagesPath + 'cpres.jpg'),
                fit: BoxFit.fill,
                filterQuality: FilterQuality.high)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SubscribeToSport()));
                  },
                  child: Container(
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Divider(
                          color: Colors.redAccent,
                          thickness: 10,
                        ),
                        Text(
                          AppLocalizations.of(context)!.subscribe,
                          style: textStyle,
                        ),
                        Divider(
                          color: Colors.redAccent,
                          thickness: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SubscribedList()));
                  },
                  child: Container(
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Divider(
                          color: Colors.redAccent,
                          thickness: 10,
                        ),
                        Text(
                          AppLocalizations.of(context)!.renew,
                          style: textStyle,
                        ),
                        Divider(
                          color: Colors.redAccent,
                          thickness: 10,
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
    );
  }
}
