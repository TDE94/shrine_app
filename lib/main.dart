import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:waterapp/home.dart';
import 'package:waterapp/homeAsymetric.dart';
import 'package:waterapp/loginpage.dart';
import 'package:waterapp/settings.dart';
import 'package:waterapp/thema.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['tr', 'en', 'de']);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: Consumer(builder: (context, ThemeNotifier notifier, child) {
        return LocaleBuilder(
          builder: (locale) => MaterialApp(
            initialRoute: '/home',
            routes: {
              "/login": (context) => LoginPage(),
              "/": (context) => HomePage(),
              "/settings": (context) => Settings(),
              "/home": (context) => HomeAsymetric()
            },
            localizationsDelegates: Locales.delegates,
            locale: locale,
            supportedLocales: Locales.supportedLocales,
            title: 'Water App',
            theme: notifier.darkTheme ? dark : light,
          ),
        );
      }),
    );
  }
}
