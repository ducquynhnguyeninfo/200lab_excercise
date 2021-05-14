import 'package:flutter/material.dart';
import 'package:hw1_layout/utils/shared_key.dart';
import 'package:hw1_layout/utils/ui_resource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatefulWidget {
  @override
  _ScreenLoginState createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  bool isFirstTime = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies

    var sharedPref = await SharedPreferences.getInstance();
    setState(() {
      this.isFirstTime = sharedPref.getBool(SharedKey.isFirstTime);
      if (this.isFirstTime == null) {
        this.isFirstTime = false;
      }
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    Widget background = new Image.asset(
      UIResource.background1,
      fit: BoxFit.cover,
      width: w,
      height: h,
    );

    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: background,
          ),
          Column(
            children: [
              Expanded(
                  child: Stack(
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: w / 4,
                              height: w / 4,
                              child: Center(
                                  child: Text(
                                'logo here',
                                style: TextStyle(color: Colors.grey.shade600),
                              )),
                              decoration: BoxDecoration(
                                  color: Color(0xffF1F1EF),
                                  shape: BoxShape.circle),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'BRAND-HERE',
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400),
                            )
                          ]))
                ],
              )),
              Expanded(
                  child: Container(
                      child: this.isFirstTime
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: w - w / 6,
                                      height: 40.0,
                                      child: InkWell(
                                        onTap: () {
                                          print("Connect with Facebook");
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          decoration: BoxDecoration(
                                              color: Colors.blue[500],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4.0))),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.face_outlined,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                    // color: Colors.orange,
                                                    child: Text(
                                                  'Connect with Facebook',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                  textAlign: TextAlign.center,
                                                )),
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                  SizedBox(height: 8.0),
                                  SizedBox(
                                      width: w - w / 6,
                                      height: 40.0,
                                      child: InkWell(
                                        onTap: () {
                                          print(
                                              "Connect with your phone number");
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4.0))),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Icon(Icons.smartphone,
                                                    color: Colors.orange),
                                              ),
                                              Expanded(
                                                child: Container(
                                                    // color: Colors.orange,
                                                    child: Text(
                                                  'Connect with your phone number',
                                                  style: TextStyle(
                                                      color: Colors.orange),
                                                  textAlign: TextAlign.center,
                                                )),
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            )
                          : Container()))
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() async {
    super.dispose();

    var sharedPref = await SharedPreferences.getInstance();
    // this.isFirstTime = sharedPref.getBool(SharedKey.isFirstTime);
    sharedPref.setBool(SharedKey.isFirstTime, !this.isFirstTime);
  }
}
