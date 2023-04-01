import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dividerComponent extends StatelessWidget {
  const dividerComponent({
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
