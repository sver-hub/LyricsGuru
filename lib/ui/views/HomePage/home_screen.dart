import 'package:flutter/material.dart';
import 'package:lyrics_guru/ui/views/HomePage/widgets/user_stats.dart';
import 'package:lyrics_guru/ui/views/HomePage/widgets/word_of_the_day.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(-0.5, -0.5),
          end: FractionalOffset.bottomRight,
          colors: [Colors.orange[900], Colors.black],
        ),
      ),
      padding: EdgeInsets.only(top: 30),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 150,
              child: Center(
                child: Text(
                  'Welcome Back, Sver',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                WordOfTheDay(
                  word: 'Agonizing',
                  definition: 'causing great physical or mental pain.',
                ),
                UserStats(),
                SizedBox(
                  height: 5000,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
