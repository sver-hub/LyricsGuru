import 'package:flutter/material.dart';

class UserStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '25 words learnt',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Sver',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 30),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        'https://pbs.twimg.com/media/EBTK048WwAEMEnq.jpg'),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.white,
          thickness: 1,
          height: 1,
        ),
        Container(
          height: 100,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          color: Colors.blue,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: icons.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(icons[index]),
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: Text('Your Trophies >>>'),
                width: double.infinity,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

final icons = [
  'https://www.clipartmax.com/png/middle/134-1346627_trophy-vector-material-trophy-icon-vector-png.png',
  'https://img.favpng.com/3/13/9/trophy-icon-png-favpng-RJ9Py9JuiKUrEZ7zcGii1VZT5.jpg',
  'https://image.flaticon.com/icons/png/512/207/207469.png',
  'https://w7.pngwing.com/pngs/80/174/png-transparent-trophy-award-computer-icons-golden-compass-wine-glass-material-prize-thumbnail.png',
  'https://i.pinimg.com/originals/aa/24/7f/aa247f59065b6cf411918de83d58b008.png',
  'https://www.clipartmax.com/png/middle/92-927497_computer-icons-trophy-clip-art-trophy-icon-png.png',
  'https://n7.nextpng.com/sticker-png/284/254/sticker-png-computer-icons-award-trophy-encapsulated-postscript-award-text-sport-logo-material.png',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSlymD7F-LkR28TT7hnxrsca4fZsViUgO-4wQ&usqp=CAU',
  'https://img.lovepik.com/element/40027/6762.png_860.png',
  'https://banner2.cleanpng.com/20180508/jgq/kisspng-computer-icons-icon-design-award-5af2038aec3469.0168008815258100589675.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ9fh0zoqgbxAz0vlc5xr-3ZrM-iUMQtfnVhA&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTkyY_TTWmecf9K1fEA76alA4fQhvYwae2TqQ&usqp=CAU',
];
