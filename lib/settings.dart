import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import 'package:waterapp/thema.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: LocaleText('settings'),
      ),
      body: Column(
        children: [
          Consumer<ThemeNotifier>(
            builder: (context, notifier, child) => SwitchListTile(
              title: LocaleText('themaMod',
                  style: TextStyle(fontSize: size.height * 0.02)),
              onChanged: (val) {
                notifier.toggleTheme();
              },
              value: notifier.darkTheme,
            ),
          ),
          Divider(),
          LocaleText(
            'changeLang',
            style: TextStyle(fontSize: size.height * 0.02),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Spacer(
                flex: 4,
              ),
              RaisedButton(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: LocaleText('turkish'),
                onPressed: () {
                  LocaleNotifier.of(context).change('tr');
                },
              ),
              Spacer(
                flex: 1,
              ),
              RaisedButton(
                color: Colors.yellow,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: LocaleText('english'),
                onPressed: () {
                  LocaleNotifier.of(context).change('en');
                },
              ),
              Spacer(
                flex: 1,
              ),
              RaisedButton(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: LocaleText('german'),
                onPressed: () {
                  LocaleNotifier.of(context).change('de');
                },
              ),
              Spacer(
                flex: 4,
              )
            ],
          )
        ],
      ),
    );
  }
}
