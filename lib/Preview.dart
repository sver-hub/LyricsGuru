import 'package:flutter/material.dart';

class Preview extends StatelessWidget {
  final imgUrl;
  final title;
  final rounded;

  const Preview({Key key, this.imgUrl, this.title, this.rounded})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: NetworkImage(this.imgUrl),
                  ),
                  borderRadius: BorderRadius.circular(this.rounded ? 100 : 0),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              this.title,
              style: TextStyle(color: Colors.white, fontSize: 20),
              softWrap: false,
            ),
          ],
        ),
      ),
    );
  }
}
