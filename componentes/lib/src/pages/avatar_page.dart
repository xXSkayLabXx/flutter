import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Avatar Page'),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 2.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.cinconoticias.com/wp-content/uploads/Stan-Lee-696x391.jpg'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
          image: NetworkImage(
              'https://sm.ign.com/ign_es/screenshot/default/ejl-r9dwkaejkvu_sepx.jpg'),
        ),
      ),
    );
  }
}
