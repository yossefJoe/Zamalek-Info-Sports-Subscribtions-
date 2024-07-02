import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_project/Constants/Constants.dart';
import 'package:new_project/Constants/ProviderMethods.dart';
import 'package:new_project/Constants/SportSubscribtion.dart';
import 'package:new_project/Presentation/Pages/HomePage.dart';
import 'package:new_project/Presentation/Widgets/CustomButton.dart';
import 'package:new_project/Presentation/Widgets/CustomTextField.dart';
import 'package:new_project/Presentation/Widgets/Loading.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SubscribeToSport extends StatelessWidget {
  SubscribeToSport({super.key});
  var username, email, subscribername;
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<String> sports = [
    'Volleyball',
    'Handball',
    'Football',
    'Basketball',
    'Swimming',
    'Tennis',
    'GYM'
  ];

  Random random = Random();
  late int randomNumber;
  DateTime subscriptiondate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    randomNumber = 50000 + random.nextInt(50001);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FutureBuilder<bool>(
                      future: constants().getusername(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData && snapshot.data == true) {
                          return CustomTextField(
                            hinttext: AppLocalizations.of(context)!.username,
                            icon: Icons.person,
                            obscureText: false,
                            onChanged: (newvalue) {
                              username = newvalue;
                            },
                            type: TextInputType.name,
                            validator: (value) {
                              if (value!.length < 5) {
                                return locale == 'ar'
                                    ? "اسم المستخدم يجب ان لا يقل عن ٥ حروف"
                                    : "UserName shouldn't be less than 5 characters";
                              } else {
                                return null;
                              }
                            },
                          );
                        } else {
                          return SizedBox.shrink();
                        }
                      },
                    ),
                    FutureBuilder<bool>(
                      future: constants().getemail(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData && snapshot.data == true) {
                          return CustomTextField(
                            hinttext: AppLocalizations.of(context)!.email,
                            icon: Icons.email_outlined,
                            obscureText: false,
                            onChanged: (newvalue) {
                              email = newvalue;
                            },
                            type: TextInputType.emailAddress,
                            validator: (value) {
                              if (!value!.contains('@')) {
                                return locale == 'ar'
                                    ? "البريد الإلكتروني يجب ان يحتوي على @"
                                    : "Email Should contain @";
                              } else {
                                return null;
                              }
                            },
                          );
                        } else {
                          return SizedBox.shrink();
                        }
                      },
                    ),
                    CustomTextField(
                      hinttext: AppLocalizations.of(context)!.subname,
                      icon: Icons.sports,
                      obscureText: false,
                      onChanged: (newvalue) {
                        subscribername = newvalue;
                      },
                      type: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.length < 5) {
                          return locale == 'ar'
                              ? "اسم المشترك يجب ان لا يقل عن ٥ حروف"
                              : "Subscriber name shouldn't be less than 5 characters";
                        } else {
                          return null;
                        }
                      },
                    ),
                    Consumer<ZamalekProvider>(
                      builder: (context, zamalek, child) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: DropdownButton(
                                style: TextStyle(color: Colors.white),
                                value: zamalek.selectedSport,
                                hint: Text(
                                  "Select a Sport",
                                  style: TextStyle(fontSize: 10),
                                ),
                                focusColor: Colors.redAccent,
                                dropdownColor: Colors.redAccent,
                                items: sports.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newvalue) {
                                  zamalek.changeSport(newvalue!);
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Consumer<ZamalekProvider>(
                      builder: (context, zamalek, child) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                            child: Center(
                              child: CheckboxListTile(
                                activeColor: Colors.white,
                                checkColor: Colors.black,
                                title:
                                    Text(AppLocalizations.of(context)!.member),
                                value: zamalek.member,
                                onChanged: (value) {
                                  zamalek.memberornot(value!);
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                )),
            Consumer<ZamalekProvider>(
              builder: (context, zamalek, child) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(
                        child: Text(AppLocalizations.of(context)!.subfees +
                            ' : ${locale == "ar" ? constants().convertToArabicNumbers(zamalek.getfees().toString()) : zamalek.getfees()}')),
                  ),
                );
              },
            ),
            Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Consumer<ZamalekProvider>(
                  builder: (context, zamalek, child) {
                    return CustomButton(
                      color: Colors.black,
                      text: AppLocalizations.of(context)!.subscribe,
                      onPressed: () {
                        showloading(context);
                        SportSubscribtion().addSubscription(
                            username != null ? username : '',
                            email != null ? email : '',
                            zamalek.selectedSport,
                            zamalek.getfees().toString(),
                            subscriptiondate.toString(),
                            randomNumber.toString(),
                            'false',
                            subscribername);
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                            (route) => false);
                      },
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
