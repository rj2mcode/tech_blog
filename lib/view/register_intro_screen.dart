import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/view/my_categories_screen.dart';
import '../component/my_strings.dart';
import 'package:validators/validators.dart';

class RegisterIntroScreen extends StatelessWidget {
  const RegisterIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var texttheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.images.robotIcon.path,
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: MyStrings.welcome,
                  style: texttheme.labelMedium?.merge(
                    const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: ElevatedButton(
                onPressed: () {
                  _showEmailBottomSheet(context, size, texttheme);
                },
                child: const Text("بزن بریم"),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Future<dynamic> _showEmailBottomSheet(
      BuildContext context, Size size, TextTheme texttheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 3,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  MyStrings.insertYourEmail,
                  style: texttheme.labelMedium?.merge(
                    const TextStyle(color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 24, 32, 24),
                  child: TextField(
                    onChanged: (value) {
                      isEmail(value);
                    },
                    style: texttheme.labelMedium?.merge(
                      const TextStyle(color: Colors.black),
                    ),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: MyStrings.sampleEmail,
                        hintStyle: texttheme.labelMedium),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _activationCodeBottomSheet(context, size, texttheme);
                    },
                    child: const Text("ارسال"))
              ],
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> _activationCodeBottomSheet(
      BuildContext context, Size size, TextTheme texttheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 3,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  MyStrings.insertYourActivationCode,
                  style: texttheme.labelMedium?.merge(
                    const TextStyle(color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 24, 32, 24),
                  child: TextField(
                    onChanged: (value) {
                      isEmail(value);
                    },
                    style: texttheme.labelMedium?.merge(
                      const TextStyle(color: Colors.black),
                    ),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: MyStrings.insertYourActivationCodeHint,
                        hintStyle: texttheme.labelMedium),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const MyCategoriesScreen()));
                    },
                    child: const Text("ارسال"))
              ],
            ),
          ),
        );
      },
    );
  }
}
