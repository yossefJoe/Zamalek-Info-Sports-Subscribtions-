import 'package:flutter/material.dart';
import 'package:new_project/Constants/Constants.dart';
import 'package:new_project/Presentation/Pages/LegendsScreens/LegendsRow.dart';
import 'package:new_project/Presentation/Widgets/CustomAppbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LegendsPage extends StatelessWidget {
  LegendsPage({super.key});
  TextStyle style = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    var locale = Localizations.localeOf(context).languageCode;
    return Scaffold(
      appBar: CustomAppbar(context, 'legends.png', false),
      body: ListView(
        children: [
          LegendsRow(),
          CustomCard(
            uppertext: AppLocalizations.of(context)!.mosttitledpresident,
            downtext: locale == "ar" ? "كمال درويش" : 'Kamal Darweesh',
            image: 'darweesh.jpg',
          ),
          Divider(
            height: 10,
            color: Colors.black,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  AppLocalizations.of(context)!.football + ' :',
                  style: style,
                ),
              ),
              CustomCard(
                uppertext:
                    AppLocalizations.of(context)!.mosttitledplayerfootball,
                downtext:
                    locale == "ar" ? "عبد الواحد السيد" : 'Abdelwahed El Said',
                image: 'wahed.jpg',
              ),
              CustomCard(
                uppertext: AppLocalizations.of(context)!.highestscorefootball,
                downtext: locale == "ar" ? "عبد الحليم علي" : 'Abdelhalim Ali',
                image: 'halim.jpeg',
              ),
            ],
          ),
          Divider(
            height: 10,
            color: Colors.black,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  AppLocalizations.of(context)!.handball + ' :',
                  style: style,
                ),
              ),
              CustomCard(
                uppertext:
                    AppLocalizations.of(context)!.mosttitledplayerhandball,
                downtext: locale == "ar" ? "أحمد الاحمر" : 'Ahmed El Ahmar',
                image: 'ahmar.jpg',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  CustomCard({super.key, this.uppertext, this.downtext, this.image});
  final String? uppertext;
  final String? downtext;
  final String? image;
  TextStyle style = TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
  TextStyle style2 =
      TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                uppertext!,
                style: style2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage(ImagesPath + image!),
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.fill)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                downtext!,
                style: style,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
