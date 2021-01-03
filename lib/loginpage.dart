import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:waterapp/settings.dart';
import 'package:waterapp/supplemental/cut_corners_border.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _nameCont = TextEditingController();

  TextEditingController _passCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            Column(children: [
              Container(
                height: size.height * 0.10,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(
                          'assets/images/diamond.png',
                        ))),
              ),
              SizedBox(
                height: 16,
              ),
              LocaleText(
                'diamond',
                style: TextStyle(
                    fontFamily: 'Rubik', fontSize: size.height * 0.05),
              )
            ]),
            SizedBox(
              height: size.height * 0.16,
            ),
            Center(
              child: LocaleText('name',
                  style: TextStyle(
                      fontFamily: 'Rubik',
                      letterSpacing: 2,
                      fontSize: size.height * 0.02,
                      fontWeight: FontWeight.w500)),
            ),
            TextFormField(
              controller: _nameCont,
              decoration: InputDecoration(
                  focusedBorder: CutCornersBorder(),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: '',
                  filled: true,
                  hintStyle: TextStyle(fontFamily: 'Rubik')),
            ),
            SizedBox(height: 20),
            Center(
              child: LocaleText('pass',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    letterSpacing: 2,
                    fontSize: size.height * 0.02,
                    fontWeight: FontWeight.w500,
                  )),
            ),
            TextFormField(
              controller: _passCont,
              obscureText: true,
              decoration: InputDecoration(
                  focusedBorder: CutCornersBorder(),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: '',
                  filled: true,
                  hintStyle: TextStyle(fontFamily: 'Rubik')),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            ButtonBar(
              children: [
                FlatButton(
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7))),
                  child: LocaleText('clear',
                      style: TextStyle(
                        fontSize: size.height * 0.02,
                        fontWeight: FontWeight.w500,
                      )),
                  onPressed: () {
                    _nameCont.clear();
                    _passCont.clear();
                  },
                ),
                RaisedButton(
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7))),
                  elevation: 8,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: LocaleText('next',
                      style: TextStyle(
                        fontSize: size.height * 0.02,
                        fontWeight: FontWeight.w500,
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
