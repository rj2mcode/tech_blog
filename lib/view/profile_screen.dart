import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';

import '../component/my_colors.dart';
import '../component/my_components.dart';
import '../component/my_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.size,
    required this.texttheme,
    required this.bodyMargin,
  });

  final Size size;
  final TextTheme texttheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Image.asset(
            Assets.images.profile.path,
            height: 100,
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                Image.asset(Assets.icons.pen.path).image,
                color: Colors.blue,
                size: 18,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                MyStrings.editProfileAvatar,
                style: texttheme.labelMedium?.merge(
                  const TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            "رضا جوان معقول",
            style: texttheme.labelMedium?.merge(
              const TextStyle(color: Colors.black),
            ),
          ),
          Text(
            "Rj2mcode@gmail.com",
            style: texttheme.labelMedium?.merge(
              const TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          DividerComponent(size: size),
          SizedBox(
            height: 45,
            child: InkWell(
              onTap: () {
                //Do Somethings
              },
              splashColor: SolidColors.primary,
              child: Center(
                child: Text(
                  "مقالات مورد علاقه من",
                  style: texttheme.labelLarge?.merge(
                    const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          DividerComponent(size: size),
          SizedBox(
            height: 45,
            child: InkWell(
              onTap: () {
                //Do Somethings
              },
              splashColor: SolidColors.primary,
              child: Center(
                child: Text(
                  "پادکست های مورد علاقه من",
                  style: texttheme.labelLarge?.merge(
                    const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          DividerComponent(size: size),
          SizedBox(
            height: 45,
            child: InkWell(
              onTap: () {
                //Do Somethings
              },
              splashColor: SolidColors.primary,
              child: Center(
                child: Text(
                  "خروج از حساب کاربری",
                  style: texttheme.labelLarge?.merge(
                    const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
