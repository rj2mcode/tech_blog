import 'package:flutter/material.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/view/home_screen.dart';
import 'package:tech_blog/view/profile_screen.dart';
import 'package:tech_blog/view/register_intro_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();

class _MainScreenState extends State<MainScreen> {
  var selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    //Consts
    var size = MediaQuery.of(context).size;
    var texttheme = Theme.of(context).textTheme;
    double bodyMargin = size.width / 16;
    double bodyMarginNavBar = size.width / 10;
    //End Consts

    // List<Widget> screenPagesList = [
    //   HomeScreen(size: size, texttheme: texttheme, bodyMargin: bodyMargin),
    //   profileScreen(size: size, texttheme: texttheme, bodyMargin: bodyMargin),
    // ];

    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
            child: ListView(
              children: [
                DrawerHeader(
                  child: Center(
                    child: Image.asset(
                      Assets.images.logo.path,
                      scale: 2,
                    ),
                  ),
                ),
                ListTile(
                  title: const Text("پروفایل کاربری"),
                  onTap: () {},
                ),
                const Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  title: const Text("درباره تک بلاگ"),
                  onTap: () {},
                ),
                const Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  title: const Text("اشتراک گذاری"),
                  onTap: () {},
                ),
                const Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  title: const Text("تک بلاگ گیت هاب"),
                  onTap: () {},
                ),
                const Divider(
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: SolidColors.mainPagebg,
          elevation: 0,
          //Top Menu
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  _key.currentState!.openDrawer();
                },
                child: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
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
            Positioned.fill(
              child: IndexedStack(
                index: selectedPageIndex,
                children: [
                  HomeScreen(
                      size: size, texttheme: texttheme, bodyMargin: bodyMargin),
                  ProfileScreen(
                      size: size, texttheme: texttheme, bodyMargin: bodyMargin),
                  RegisterIntroScreen(),
                ],
              ),
            ),
            BottomNavigation(
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

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
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
              colors: GradiantColors.mainPageBottomNavBarBg,
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
              gradient: LinearGradient(colors: GradiantColors.bottomNavMenu),
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
                    onPressed: () => changeScreen(2),
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
