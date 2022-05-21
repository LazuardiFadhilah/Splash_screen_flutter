// ignore_for_file: unused_import, use_key_in_widget_constructors, override_on_non_overriding_member, sized_box_for_whitespace, annotate_overrides, prefer_const_constructors, avoid_web_libraries_in_flutter, avoid_print

import 'package:flutter/material.dart';
import 'package:splash_screen/theme.dart';
import 'package:splash_screen/models/splash_model.dart';

class SplashScreen extends StatefulWidget {
  @override
  static List<SplashModel> data = [
    SplashModel('assets/illu1.png', 'Let us take care of you',
        'We are here to take care of you with pleasure. besides that we will monitor your condition 24/Day'),
    SplashModel('assets/illu2.png', 'Always use a mask',
        'always use a mask when you want to travel and keep your body immunity'),
    SplashModel('assets/illu3.png', 'Work from home',
        'to avoid the spread of covid 19. you can do office work from home and always be close to your family'),
  ];

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int pageIndicator = 0;

  Widget header() {
    return Container(
      padding: EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (() {
              setState(() {
                if (pageIndicator > 0) {
                  pageIndicator--;
                  print(pageIndicator);
                }
              });
            }),
            child: pageIndicator > 0
                ? Image.asset(
                    'assets/back_icon.png',
                    height: 14,
                  )
                : SizedBox(),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                pageIndicator = 2;
                print(pageIndicator);
              });
            },
            child: pageIndicator < 2
                ? Text(
                    'Skip',
                    style: titleTextStyle.copyWith(
                      fontWeight: regular,
                      fontSize: 14,
                      color: blackColor,
                    ),
                  )
                : SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget image() {
    if (pageIndicator == 0) {
      return Center(
        child: Container(
          alignment: Alignment.centerLeft,
          width: double.infinity,
          height: 548,
          child: Image.asset(SplashScreen.data[pageIndicator].imageUrl),
        ),
      );
    } else if (pageIndicator == 1) {
      return Center(
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 548,
          child: Image.asset(SplashScreen.data[pageIndicator].imageUrl),
        ),
      );
    } else {
      return Center(
        child: Container(
          alignment: Alignment.centerRight,
          width: double.infinity,
          height: 548,
          child: Image.asset(SplashScreen.data[pageIndicator].imageUrl),
        ),
      );
    }
  }

  Widget footer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 30,
            left: 30,
            right: 30,
          ),
          height: 267,
          width: 500,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                SplashScreen.data[pageIndicator].title,
                style: titleTextStyle,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  SplashScreen.data[pageIndicator].desc,
                  style: subTextStyle.copyWith(
                    letterSpacing: 2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: navigationButtonWidget(),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (pageIndicator < 2) {
                          pageIndicator++;
                          print(pageIndicator);
                        } else {
                          pageIndicator = 0;
                        }
                      });
                    },
                    child: Image.asset(
                      'assets/next_icon.png',
                      height: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget navigationButtonWidget() {
    List<Widget> containerList = [];
    for (var i = 0; i < SplashScreen.data.length; i++) {
      containerList.add(
        Row(
          children: [
            Container(
              width: i == pageIndicator ? 18 : 12,
              height: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: i == pageIndicator ? purpleColor : lightPurpleColor,
              ),
            ),
            SizedBox(
              width: 4,
            ),
          ],
        ),
      );
    }

    return Row(
      children: containerList,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            header(),
            image(),
            footer(),
          ],
        ),
      ),
    );
  }
}
