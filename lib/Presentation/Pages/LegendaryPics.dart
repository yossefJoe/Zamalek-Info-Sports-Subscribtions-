import 'package:flutter/material.dart';
import 'package:new_project/Constants/Constants.dart';
import 'package:new_project/Presentation/Pages/PicDisplayPage.dart';

class PicsPage extends StatefulWidget {
  PicsPage({super.key});

  @override
  State<PicsPage> createState() => _PicsPageState();
}

class _PicsPageState extends State<PicsPage> {
  List<String> pics = [
    '1993.jpg',
    '2003.jpg',
    '2008.jpg',
    '2003_2.jpg',
    '2013.jpg',
    '2015.jpg',
    '2018.jpg',
    '2019.jpg',
    '2020.jpg',
    '2020_2.jpg',
    '2021.jpeg',
    '2022.jpg',
    '2022_2.jpg',
    '2024.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: GridView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PicDisplayPage(
                            pic: picsPath + pics[index],
                          )));
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage(picsPath + pics[index]),
                          fit: BoxFit.fill,
                          filterQuality: FilterQuality.high)),
                ),
              ),
            );
          },
          itemCount: pics.length,
        ),
      ),
    );
  }
}
