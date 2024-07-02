import 'package:flutter/material.dart';
import 'package:new_project/Constants/Constants.dart';

class CustomAppbar extends AppBar {
  final String? image;
  final bool? drawer;
  CustomAppbar(BuildContext context, this.image, this.drawer)
      : super(
          toolbarHeight: MediaQuery.of(context).size.height * 0.15,
          leading: drawer == true
              ? Builder(
                  builder: (context) {
                    return IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: new Image.asset(
                          'assets/images/whistle.png',
                          color: Colors.amber,
                          height: 50,
                        ));
                  },
                )
              : Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.8),
                    ),
                    child: Center(
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.redAccent,
                            size: 30,
                          )),
                    ),
                  ),
                ),
          titleSpacing: 0, // Remove title padding
          title: null, // Remove the default title
          flexibleSpace: Image.asset(
            ImagesPath + image!,
            fit: BoxFit.fill,
          ),
        );
}
