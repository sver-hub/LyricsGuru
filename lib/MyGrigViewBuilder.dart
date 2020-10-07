import 'package:flutter/material.dart';

class MyGridViewBuilder extends StatelessWidget {
  final List<Widget> content;

  const MyGridViewBuilder({Key key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: content.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 30.0,
          mainAxisSpacing: 50.0,
          childAspectRatio: 0.77),
      itemBuilder: (context, index) => content[index],
    );
  }
}
