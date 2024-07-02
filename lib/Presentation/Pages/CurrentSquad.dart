import 'package:flutter/material.dart';
import 'package:new_project/Constants/Constants.dart';
import 'package:new_project/Models/Squad.dart';
import 'package:new_project/Presentation/Pages/PlayerPage.dart';
import 'package:new_project/Presentation/Widgets/CoachDialoge.dart';
import 'package:new_project/Presentation/Widgets/CustomAppbar.dart';

class SquadPage extends StatelessWidget {
  SquadPage({super.key});
  TextStyle style1 = TextStyle(color: Colors.grey, fontSize: 8);
  TextStyle style2 = TextStyle(color: Colors.white, fontSize: 8);
  @override
  Widget build(BuildContext context) {
    var locale = Localizations.localeOf(context).languageCode;
    return Scaffold(
      appBar: CustomAppbar(context, 'squadwallpaper.jpg', false),
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImagesPath + 'team.jpg'),
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.high)),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImagesPath + 'pitch.jpg'),
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.high)),
            child: Column(
              children: [
                Coach(),
                GridView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 3 / 2),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PlayerPage(
                                      map_index: index,
                                    )));
                          },
                          child: Container(
                            color: Colors.blueGrey[800],
                            child: ListTile(
                              contentPadding: EdgeInsets.all(5),
                              leading: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          squadList[index]['CountryImage'],
                                        ),
                                        fit: BoxFit.fill,
                                        filterQuality: FilterQuality.high),
                                    shape: BoxShape.circle),
                              ),
                              trailing: Text(
                                locale == "ar"
                                    ? arabicsquadList[index]['Player']
                                    : squadList[index]['Player'],
                                style: style2,
                              ),
                              title: Text(
                                squadList[index]['Shortnation'],
                                style: style1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: squadList.length,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
