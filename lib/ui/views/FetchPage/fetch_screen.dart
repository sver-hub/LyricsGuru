import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/view_models/fetch_model.dart';
import 'package:lyrics_guru/services/service_locator.dart';
import 'package:lyrics_guru/ui/widgets/my_progress_indicator.dart';

class FetchScreen extends StatefulWidget {
  final status;
  final auth;

  const FetchScreen({Key key, this.status, this.auth}) : super(key: key);

  @override
  _FetchScreenState createState() => _FetchScreenState();
}

class _FetchScreenState extends State<FetchScreen> {
  final model = serviceLocator<FetchModel>();

  @override
  void initState() {
    super.initState();
    model.loadData(widget.auth, widget.status);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset(-0.5, -0.5),
            end: FractionalOffset.bottomRight,
            colors: [Colors.orange[900], Colors.black],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyProgressIndicator(),
            SizedBox(height: 50),
            Text(
              'Loading Your Favourite Songs On Spotify',
              style: TextStyle(color: Colors.white, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
