import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_project/Constants/Constants.dart';
import 'package:new_project/Presentation/Widgets/CustomAppbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MemorialPage extends StatelessWidget {
  const MemorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(context, '20_3.jpg', false),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(ImagesPath + 'amrhussein.jpg'),
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(ImagesPath + 'memorial.jpg'),
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                    child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    AppLocalizations.of(context)!.rip,
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
