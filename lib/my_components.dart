import 'package:flutter/material.dart';
import '../my_colors.dart';
import 'gen/assets.gen.dart';
import 'models/fake_data.dart';

class DividerComponent extends StatelessWidget {
  const DividerComponent({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
      color: Colors.black38,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}

class MainTags extends StatelessWidget {
  MainTags({
    super.key,
    required this.texttheme,
    required this.index,
  });

  final TextTheme texttheme;
  var index;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          gradient: LinearGradient(
              colors: GradiantColors.tags,
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
    );
  }
}
