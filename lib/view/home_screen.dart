import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../gen/assets.gen.dart';
import '../models/fake_data.dart';
import '../my_colors.dart';
import '../my_strings.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({
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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(
          children: [
            homeScreenTopBanner(size: size, texttheme: texttheme),
            const SizedBox(
              height: 16,
            ),
            homeScreenTagList(bodyMargin: bodyMargin, texttheme: texttheme),
            const SizedBox(
              height: 40,
            ),
            homeScreenSeeMoreBlogs(
                bodyMargin: bodyMargin, texttheme: texttheme),
            homeScreenBlogListItems(
                size: size, bodyMargin: bodyMargin, texttheme: texttheme),
            const SizedBox(
              height: 40,
            ),
            homeScreenSeeMorePodcasts(
                bodyMargin: bodyMargin, texttheme: texttheme),
            homeScreenPodcastListItems(
                size: size, bodyMargin: bodyMargin, texttheme: texttheme),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}

class homeScreenPodcastListItems extends StatelessWidget {
  const homeScreenPodcastListItems({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.texttheme,
  });

  final Size size;
  final double bodyMargin;
  final TextTheme texttheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.9,
      child: ListView.builder(
          itemCount: blogList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 10),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: index == blogList.length - 1 ? bodyMargin : 0),
                    child: SizedBox(
                      height: size.height / 5.3,
                      width: size.width / 2.3,
                      child: Stack(children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                                image:
                                    NetworkImage(PodcastList[index].imageUrl),
                                fit: BoxFit.cover),
                          ),
                          foregroundDecoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              gradient: LinearGradient(
                                  colors: gradiantColors.MainPageBlogItem,
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)),
                        ),
                        Positioned(
                          bottom: 8,
                          right: 0,
                          left: 0,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  PodcastList[index].writer,
                                  style: texttheme.titleSmall,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      PodcastList[index].views + " ",
                                      style: texttheme.titleSmall,
                                    ),
                                    const Icon(
                                      Icons.remove_red_eye,
                                      color: Colors.white,
                                      size: 16,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ]),
                    ),
                  ),
                  SizedBox(
                    width: size.width / 2.3,
                    child: Text(
                      blogList[index].title,
                      style: TextStyle(color: Colors.black),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class homeScreenSeeMorePodcasts extends StatelessWidget {
  const homeScreenSeeMorePodcasts({
    super.key,
    required this.bodyMargin,
    required this.texttheme,
  });

  final double bodyMargin;
  final TextTheme texttheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, bodyMargin, 8),
      child: Row(
        children: [
          ImageIcon(
            Image.asset(Assets.icons.mic.path).image,
            color: Colors.blue,
            size: 18,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            myStrings.showHotPodcasts,
            style: texttheme.labelMedium?.merge(
              const TextStyle(color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }
}

class homeScreenBlogListItems extends StatelessWidget {
  const homeScreenBlogListItems({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.texttheme,
  });

  final Size size;
  final double bodyMargin;
  final TextTheme texttheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.9,
      child: ListView.builder(
          itemCount: blogList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 10),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: index == blogList.length - 1 ? bodyMargin : 0),
                    child: SizedBox(
                      height: size.height / 5.3,
                      width: size.width / 2.3,
                      child: Stack(children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                                image: NetworkImage(blogList[index].imageUrl),
                                fit: BoxFit.cover),
                          ),
                          foregroundDecoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              gradient: LinearGradient(
                                  colors: gradiantColors.MainPageBlogItem,
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)),
                        ),
                        Positioned(
                          bottom: 8,
                          right: 0,
                          left: 0,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  blogList[index].writer,
                                  style: texttheme.titleSmall,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      blogList[index].views + " ",
                                      style: texttheme.titleSmall,
                                    ),
                                    const Icon(
                                      Icons.remove_red_eye,
                                      color: Colors.white,
                                      size: 16,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ]),
                    ),
                  ),
                  SizedBox(
                    width: size.width / 2.3,
                    child: Text(
                      blogList[index].title,
                      style: TextStyle(color: Colors.black),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class homeScreenSeeMoreBlogs extends StatelessWidget {
  const homeScreenSeeMoreBlogs({
    super.key,
    required this.bodyMargin,
    required this.texttheme,
  });

  final double bodyMargin;
  final TextTheme texttheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, bodyMargin, 8),
      child: Row(
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
            myStrings.showHotBlogs,
            style: texttheme.labelMedium?.merge(
              const TextStyle(color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }
}

class homeScreenTagList extends StatelessWidget {
  const homeScreenTagList({
    super.key,
    required this.bodyMargin,
    required this.texttheme,
  });

  final double bodyMargin;
  final TextTheme texttheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          itemCount: tagList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(
                  index == tagList.length - 1 ? bodyMargin : 0,
                  8,
                  index == 0 ? bodyMargin : 12,
                  8),
              child: Container(
                height: 60,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    gradient: LinearGradient(
                        colors: gradiantColors.tags,
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 10, 8),
                  child: Row(
                    children: [
                      ImageIcon(
                        Image.asset(Assets.icons.hashtag.path).image,
                        color: Colors.grey.shade400,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        tagList[index].title,
                        style: texttheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ),
            );
          })),
    );
  }
}

class homeScreenTopBanner extends StatelessWidget {
  const homeScreenTopBanner({
    super.key,
    required this.size,
    required this.texttheme,
  });

  final Size size;
  final TextTheme texttheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width / 1.15,
          height: size.height / 4.5,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              image: DecorationImage(
                  image: AssetImage(mainPageTopBannerMap["imageAsset"]),
                  fit: BoxFit.cover)),
          foregroundDecoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              gradient: LinearGradient(
                  colors: gradiantColors.MainPageTopBanner,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
        Positioned(
          bottom: 8,
          right: 0,
          left: 0,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      mainPageTopBannerMap["writer"] +
                          " - " +
                          mainPageTopBannerMap["date"],
                      style: texttheme.titleSmall,
                    ),
                    Row(
                      children: [
                        Text(
                          mainPageTopBannerMap["view"] + " ",
                          style: texttheme.titleSmall,
                        ),
                        const Icon(
                          Icons.remove_red_eye,
                          color: Colors.white,
                          size: 16,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                mainPageTopBannerMap["title"],
                style: texttheme.titleLarge,
              ),
            ],
          ),
        )
      ],
    );
  }
}
