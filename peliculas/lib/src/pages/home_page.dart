import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('peliculas en cine'),
          backgroundColor: Colors.indigo,
          actions: [IconButton(onPressed: (() {}), icon: Icon(Icons.search))],
        ),
        body: Container(
          child: Column(
            children: [_swiperTarjetas()],
          ),
        ));
  }

  Widget _swiperTarjetas() {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      width: double.infinity,
      height: 300.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            "https://www.xtrafondos.com/wallpapers/satoru-gojo-jujutsu-kaisen-7798.jpg",
            fit: BoxFit.fill,
          );
        },
        itemCount: 3,
        itemWidth: 200.0,
        layout: SwiperLayout.STACK,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
      ),
    );
  }
}
