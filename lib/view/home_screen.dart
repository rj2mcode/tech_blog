import 'package:flutter/material.dart';
import 'package:tech_blog/my_components.dart';

import '../gen/assets.gen.dart';
import '../models/fake_data.dart';
import '../my_colors.dart';
import '../my_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
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
            HomeScreenTopBanner(size: size, texttheme: texttheme),
            const SizedBox(
              height: 16,
            ),
            HomeScreenTagList(bodyMargin: bodyMargin, texttheme: texttheme),
            const SizedBox(
              height: 40,
            ),
            HomeScreenSeeMoreBlogs(
                bodyMargin: bodyMargin, texttheme: texttheme),
            HomeScreenBlogListItems(
                size: size, bodyMargin: bodyMargin, texttheme: texttheme),
            const SizedBox(
              height: 40,
            ),
            HomeScreenSeeMorePodcasts(
                bodyMargin: bodyMargin, texttheme: texttheme),
            HomeScreenPodcastListItems(
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

class HomeScreenPodcastListItems extends StatelessWidget {
  const HomeScreenPodcastListItems({
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
                                    NetworkImage(podcastList[index].imageUrl),
                                fit: BoxFit.cover),
                          ),
                          foregroundDecoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              gradient: LinearGradient(
                                  colors: GradiantColors.mainPageBlogItem,
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
                                  podcastList[index].writer,
                                  style: texttheme.titleSmall,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${podcastList[index].views} ",
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
                      style: const TextStyle(color: Colors.black),
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

class HomeScreenSeeMorePodcasts extends StatelessWidget {
  const HomeScreenSeeMorePodcasts({
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
            MyStrings.showHotPodcasts,
            style: texttheme.labelMedium?.merge(
              const TextStyle(color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }
}

class HomeScreenBlogListItems extends StatelessWidget {
  const HomeScreenBlogListItems({
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
                                  colors: GradiantColors.mainPageBlogItem,
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
                                      "${blogList[index].views} ",
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
                      style: const TextStyle(color: Colors.black),
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

class HomeScreenSeeMoreBlogs extends StatelessWidget {
  const HomeScreenSeeMoreBlogs({
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
            MyStrings.showHotBlogs,
            style: texttheme.labelMedium?.merge(
              const TextStyle(color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }
}

class HomeScreenTagList extends StatelessWidget {
  const HomeScreenTagList({
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
              child: MainTags(texttheme: texttheme, index: index),
            );
          })),
    );
  }
}

class HomeScreenTopBanner extends StatelessWidget {
  const HomeScreenTopBanner({
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
                  colors: GradiantColors.mainPageTopBanner,
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
