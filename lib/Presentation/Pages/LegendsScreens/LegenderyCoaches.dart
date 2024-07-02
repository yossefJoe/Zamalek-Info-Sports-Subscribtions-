import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_project/Constants/Constants.dart';
import 'package:new_project/Models/Coaches.dart';
import 'package:new_project/Models/Legends.dart';

class LegendaryCoaches extends StatelessWidget {
  LegendaryCoaches({super.key});
  TextStyle style = TextStyle(color: Colors.white, fontSize: 10);
  @override
  Widget build(BuildContext context) {
    var locale = Localizations.localeOf(context).languageCode;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImagesPath + 'playerwallpaper.jpg'),
                filterQuality: FilterQuality.high,
                fit: BoxFit.fill)),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                itemCount: coachnames.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 0.5),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(coachesPath + coachimages[index]),
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: 120,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  Text(
                                    locale == 'en'
                                        ? coachnames[index]
                                        : arabiccoachnames[index],
                                    style: style,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      locale == 'en'
                                          ? championships[index]
                                          : arabicchampionships[index],
                                      style: style,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            color: Colors.grey[800],
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
