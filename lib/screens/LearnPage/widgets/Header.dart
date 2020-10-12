import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final title;
  final subtitle;

  const Header({Key key, this.title, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(15, 20, 20, 0),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                this.title,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
            subtitle: Text(
              this.subtitle,
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(height: 10),
          Divider(
            color: Colors.white54,
            height: 3,
          ),
        ],
      ),
    );
  }
}
