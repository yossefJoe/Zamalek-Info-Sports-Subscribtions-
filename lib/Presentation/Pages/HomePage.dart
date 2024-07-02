import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:new_project/Constants/Constants.dart';
import 'package:new_project/Presentation/Widgets/CustomAppbar.dart';
import 'package:new_project/Presentation/Widgets/CustomDrawer.dart';
import "package:latlong2/latlong.dart" as latLng;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  latLng.LatLng zamalek = latLng.LatLng(30.058644625732658, 31.20480357544781);

  @override
  Widget build(BuildContext context) {
    var localetype = Localizations.localeOf(context).languageCode;
    constants z = new constants();
    return Scaffold(
      drawer: MyDrawer(),
      appBar: CustomAppbar(context, 'appbar.jpg', true),
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImagesPath + 'century.jpg'),
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.high)),
          ),
          Container(
            color: Colors.blueGrey,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(AppLocalizations.of(context)!.contactus,
                              style: TextStyle(fontSize: 20)),
                        ),
                        CustomRow(
                          onTap: () {
                            z.launchurl(
                                'https://www.facebook.com/ZSCOfficial/?locale=ar_AR');
                          },
                          icon: Icons.facebook,
                          text: 'Zamalek SC',
                        ),
                        CustomRow(
                          onTap: () {
                            z.launchphone('0233047694');
                          },
                          icon: Icons.phone,
                          text: '33047694',
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                child: FlutterMap(
                                  children: [
                                    TileLayer(
                                      urlTemplate:
                                          'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                                      subdomains: ['a', 'b', 'c'],
                                    ),
                                    MarkerLayer(
                                      markers: [
                                        Marker(
                                          height: 50,
                                          width: 50,
                                          point: zamalek,
                                          builder: (context) {
                                            return Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          ImagesPath +
                                                              'marker.png'),
                                                      fit: BoxFit.cover)),
                                            );
                                          },
                                        )
                                      ],
                                    )
                                  ],
                                  options: MapOptions(
                                    center: zamalek, // Correct LatLng usage
                                    zoom: 15,
                                  ),
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            localetype == 'en'
                                ? AppLocalizations.of(context)!
                                        .address
                                        .substring(0, 32) +
                                    '\n' +
                                    AppLocalizations.of(context)!
                                        .address
                                        .substring(33, 45)
                                : AppLocalizations.of(context)!.address,
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/logo/ZamalekSC.png',
                      height: 50,
                    ),
                    Row(
                      children: [
                        Text(AppLocalizations.of(context)!.rights,
                            style: TextStyle(fontSize: 10)),
                        Icon(Icons.copyright_outlined, size: 20),
                      ],
                    ),
                    Image.asset(
                      ImagesPath + '20_2.png',
                      height: 50,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  CustomRow({super.key, this.text, this.icon, this.onTap});
  final String? text;
  final IconData? icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              icon,
              size: 30,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.27,
            child: Text(
              text!,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
