import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_project/Constants/ProviderMethods.dart';
import 'package:new_project/Models/Subscribtions.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RenewalButton extends StatelessWidget {
  RenewalButton({super.key, required this.usersnap});
  final Subscription usersnap;

  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    String staticdate = usersnap.subscriptiondate.toString();
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm");

    DateTime parsedDate = dateFormat.parse(staticdate);

    return Consumer<ZamalekProvider>(
      builder: (context, zamalek, child) {
        return TextButton(
            onPressed: () {
              zamalek.changerenewalstate(usersnap);
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: Center(
                            child: Text(
                          locale == 'ar'
                              ? "موعد تجديد الاشتراك لم يأتي بعد"
                              : 'Your Subscribtion Date is Yet to Come!',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.red),
                        ))),
                  );
                },
              );
            },
            child: Text(
              AppLocalizations.of(context)!.renewsubscribe,
              style: TextStyle(color: Colors.redAccent),
            ));
      },
    );
  }
}
