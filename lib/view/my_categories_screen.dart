import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:tech_blog/my_components.dart';
import 'package:tech_blog/my_strings.dart';
import '../my_colors.dart';
import '../gen/assets.gen.dart';

class MyCategoriesScreen extends StatefulWidget {
  const MyCategoriesScreen({super.key});

  @override
  State<MyCategoriesScreen> createState() => _MyCategoriesScreenState();
}

class _MyCategoriesScreenState extends State<MyCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    var texttheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                SvgPicture.asset(
                  Assets.images.robotIcon.path,
                  height: 100,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  MyStrings.welcomeMessageAfterVerify,
                  textAlign: TextAlign.center,
                  style: texttheme.labelMedium?.merge(
                    const TextStyle(color: Colors.black),
                  ),
                ),
                TextField(
                  textAlign: TextAlign.center,
                  style: texttheme.labelMedium,
                  decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintText: "نام و نام خانوادگی",
                      hintStyle: texttheme.labelMedium),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  MyStrings.chooseYourCategory,
                  textAlign: TextAlign.center,
                  style: texttheme.labelMedium?.merge(
                    const TextStyle(color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: SizedBox(
                    width: double.infinity,
                    height: 90,
                    child: GridView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: tagList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        mainAxisExtent: 160.0,
                      ),
                      itemBuilder: ((context, index) {
                        return InkWell(
                            onTap: () {
                              setState(() {
                                if (!tagSelectedList.contains(tagList[index]))
                                  tagSelectedList.add(tagList[index]);
                              });
                            },
                            child:
                                MainTags(texttheme: texttheme, index: index));
                      }),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Image.asset(
                  Assets.images.arrowDown.path,
                  scale: 3,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: SizedBox(
                    width: double.infinity,
                    height: 90,
                    child: GridView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: tagSelectedList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        mainAxisExtent: 160.0,
                      ),
                      itemBuilder: ((context, index) {
                        return Container(
                          height: 60,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              color: SolidColors.surface),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 8, 10, 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  tagSelectedList[index].title,
                                  style: texttheme.titleMedium?.merge(
                                    const TextStyle(color: Colors.black),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      tagSelectedList.removeAt(index);
                                    });
                                  },
                                  child: const Icon(
                                    CupertinoIcons.clear,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
