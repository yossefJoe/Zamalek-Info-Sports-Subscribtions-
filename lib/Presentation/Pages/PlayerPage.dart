import 'package:flutter/material.dart';
import 'package:new_project/Constants/Constants.dart';
import 'package:new_project/Models/Squad.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PlayerPage extends StatelessWidget {
  PlayerPage({super.key, this.map_index});
  final int? map_index;
  TextStyle mainstyle = TextStyle(fontSize: 20);
  TextStyle substyle = TextStyle(fontSize: 15);
  @override
  Widget build(BuildContext context) {
    var locale = Localizations.localeOf(context).languageCode;
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              image: AssetImage(
                                  squadList[map_index!]['PlayerImage']),
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.fill)),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ListTile(
                        leading: Text(
                          AppLocalizations.of(context)!.fullname + ':',
                          style: mainstyle,
                        ),
                        trailing: Text(
                          locale == "ar"
                              ? arabicsquadList[map_index!]['Full Name']
                              : squadList[map_index!]['Full Name'],
                          style: substyle,
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          AppLocalizations.of(context)!.position + ': ',
                          style: mainstyle,
                        ),
                        trailing: Text(
                          locale == "ar"
                              ? arabicsquadList[map_index!]['Pos.']
                              : squadList[map_index!]['Pos.'],
                          style: substyle,
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          AppLocalizations.of(context)!.nation + ': ',
                          style: mainstyle,
                        ),
                        trailing: Text(
                          locale == "ar"
                              ? arabicsquadList[map_index!]['Nation']
                              : squadList[map_index!]['Nation'],
                          style: substyle,
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          AppLocalizations.of(context)!.kitnumber + ': ',
                          style: mainstyle,
                        ),
                        trailing: Container(
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text(
                              constants().convertToArabicNumbers(
                                  squadList[map_index!]['No.'].toString()),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          )),
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage(ImagesPath + 'officialkit.png'),
                                fit: BoxFit.fill,
                                filterQuality: FilterQuality.high),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          AppLocalizations.of(context)!.dateofbirth + ': ',
                          style: mainstyle,
                        ),
                        trailing: Text(
                          locale == 'ar'
                              ? constants().convertToArabicNumbers(
                                  squadList[map_index!]['Date of Birth'])
                              : squadList[map_index!]['Date of Birth'],
                          style: substyle,
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          AppLocalizations.of(context)!.age + ': ',
                          style: mainstyle,
                        ),
                        trailing: Text(
                          (locale == "ar"
                                  ? constants().convertToArabicNumbers(
                                      squadList[map_index!]['Age'].toString())
                                  : squadList[map_index!]['Age'].toString()) +
                              (locale == "ar" ? ' سنة' : ' Years'),
                          style: substyle,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
