import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../gen/assets.gen.dart';
import '../models/fake_data.dart';
import '../my_colors.dart';
import '../my_components.dart';
import '../my_strings.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({
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
                myStrings.editProfileAvatar,
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
          dividerComponent(size: size),
          SizedBox(
            height: 45,
            child: InkWell(
              onTap: () {
                //Do Somethings
              },
              splashColor: solidColors.primary,
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
          dividerComponent(size: size),
          SizedBox(
            height: 45,
            child: InkWell(
              onTap: () {
                //Do Somethings
              },
              splashColor: solidColors.primary,
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
          dividerComponent(size: size),
          SizedBox(
            height: 45,
            child: InkWell(
              onTap: () {
                //Do Somethings
              },
              splashColor: solidColors.primary,
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
            height: 100,
          ),
        ],
      ),
    );
  }
}
