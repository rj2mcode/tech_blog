import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/my_strings.dart';
import 'package:tech_blog/view/home_screen.dart';
import 'package:tech_blog/view/profile_screen.dart';

import '../models/fake_data.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  var selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    //Consts
    var size = MediaQuery.of(context).size;
    var texttheme = Theme.of(context).textTheme;
    double bodyMargin = size.width / 16;
    double bodyMarginNavBar = size.width / 10;
    //End Consts

    List<Widget> screenPagesList = [
      homeScreen(size: size, texttheme: texttheme, bodyMargin: bodyMargin),
      profileScreen(size: size, texttheme: texttheme, bodyMargin: bodyMargin),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: solidColors.mainPagebg,
          elevation: 0,
          //Top Menu
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              Assets.images.logo.image(height: size.height / 13.8),
              const Icon(
                Icons.search,
                color: Colors.black,
              )
            ],
          ),
        ),
        body: Stack(
          children: [
            Center(
              child: Positioned.fill(
                child: IndexedStack(
                  index: selectedPageIndex,
                  children: [
                    homeScreen(
                        size: size,
                        texttheme: texttheme,
                        bodyMargin: bodyMargin),
                    profileScreen(
                        size: size,
                        texttheme: texttheme,
                        bodyMargin: bodyMargin),
                  ],
                ),
              ),
            ),
            bottomNavigation(
              size: size,
              bodyMarginNavBar: bodyMarginNavBar,
              changeScreen: (int value) {
                setState(() {
                  selectedPageIndex = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class bottomNavigation extends StatelessWidget {
  const bottomNavigation({
    super.key,
    required this.size,
    required this.bodyMarginNavBar,
    required this.changeScreen,
  });

  final Size size;
  final double bodyMarginNavBar;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: size.height / 10,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: gradiantColors.MainPageBottomNavBarBg,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Padding(
          padding:
              EdgeInsets.fromLTRB(bodyMarginNavBar, 5, bodyMarginNavBar, 5),
          child: Container(
            height: size.height / 8,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              gradient: LinearGradient(colors: gradiantColors.bottomNavMenu),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () => changeScreen(0),
                    icon: ImageIcon(
                      Image.asset(Assets.icons.home.path).image,
                      color: Colors.white,
                      size: 42,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: ImageIcon(
                      Image.asset(Assets.icons.write.path).image,
                      color: Colors.white,
                      size: 42,
                    )),
                IconButton(
                    onPressed: () => changeScreen(1),
                    icon: ImageIcon(
                      Image.asset(Assets.icons.user.path).image,
                      color: Colors.white,
                      size: 42,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
