import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oh_media_app/Article.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:oh_media_app/HomePage.dart';



class ArticlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],

        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(
              fontSize: 14.0, fontFamily: 'Hind', color: Colors.white),
        ),
      ),
      home: CarouselWithIndicatorDemo(),
    );
  }
}

class CarouselWithIndicatorDemo extends StatefulWidget {
  final Article article;
  const CarouselWithIndicatorDemo({Key key, @required this.article})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
  child: Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.asset('Assets/Icons/Image -1.png', fit: BoxFit.cover, width: 1000.0),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Text(
                  'No. ${imgList.indexOf(item)} image',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        )),
  ),
))
    .toList();

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color
            .
        fromARGB
          (
            255,238,238,238
        )
        ,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 233, 10, 10),
          title: Text("Articles"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_sharp),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IntroPage()),
              );
            },
          ),

        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: new SafeArea(
                top: true,
                child: Column(children: [
                  CarouselSlider(
                    items: imageSliders,
                    options: CarouselOptions(
                        autoPlay: true,
                        height: 200.0,
                        enlargeCenterPage: false,
                        aspectRatio: 2.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imgList.map((url) {
                      int index = imgList.indexOf(url);
                      return Container(
                        width: 12.0,
                        height: 8.0,
                        margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(3.0),
                          color: _current == index
                              ? Color.fromRGBO(0, 0, 0, 0.9)
                              : Color.fromRGBO(0, 0, 0, 0.4),
                        ),
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:15.0, right: 15.0),
                    child: Image.asset("Assets/Icons/ad.png", ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top:28.0,left: 15.0),
                      child: Text("Today Trending",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.black),),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top:5.0,left: 15.0),
                          child: Text("Total Tamilnadu articles in open horizon is 1267",style: TextStyle(fontSize: 14.0,color: Colors.black),),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top:5.0,left: 20.0),
                          child: InkWell(
                            child: Text("View All",style: TextStyle(fontSize: 14.0,color: Colors.blue),),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0),
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0,top: 10.0),
                        child: new Card(
                            elevation: 3.0,
                            child: new GestureDetector(
                              child: new Container(
                                child: Row(
                                  children: <Widget>[

                                    new Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: Container(
                                        width: 220.0,
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.only(bottom:10.0),
                                                child:  Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5.0),
                                                    color: Color.fromARGB(255, 233, 10, 10),
                                                  ),
                                                  height: 25.0,
                                                  width: 60.0,
                                                  child: Center(child: const Text('WORLD',style: TextStyle(fontSize: 14.0),)),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "450 crore best selling painting "
                                                  "Guinness world record",
                                              style: TextStyle(
                                                  fontSize: 16.0, color: Colors.black),
                                              textAlign: TextAlign.left,
                                              softWrap: true,
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,

                                              child: Text(
                                                "Posted by Open Horizon",
                                                style: TextStyle(
                                                    fontSize: 14.0, color: Colors.grey),
                                                textAlign: TextAlign.left,textScaleFactor: 1.0,
                                                softWrap: true,
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.only(top: 10.0,right: 30.0),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Wrap(
                                                      crossAxisAlignment: WrapCrossAlignment.start,
                                                      children: [
                                                        Image.asset('Assets/Icons/clock-1.png', scale: 3,),
                                                        Text(' 19 Apr 2021',style: TextStyle(color: Colors.grey.withOpacity(0.8))),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 6.0),
                                                      child: Wrap(
                                                        crossAxisAlignment: WrapCrossAlignment.center,
                                                        children: [
                                                          Image.asset('Assets/Icons/eye-fill.png', scale: 3,),
                                                          Text(' 2.9k',style: TextStyle(color: Colors.grey.withOpacity(0.8))),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        "Assets/Icons/Group -1.png",
                                        alignment: Alignment.center,
                                        width: 120.0,
                                        height: 120.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {

                              },
                            )),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0),
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0,top: 10.0),
                        child: new Card(
                            elevation: 3.0,
                            child: new GestureDetector(
                              child: new Container(
                                child: Row(
                                  children: <Widget>[

                                    new Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: Container(
                                        width: 220.0,
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.only(bottom:10.0),
                                                child:  Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5.0),
                                                    color: Color.fromARGB(255, 233, 10, 10),
                                                  ),
                                                  height: 25.0,
                                                  width: 60.0,
                                                  child: Center(child: const Text('WORLD',style: TextStyle(fontSize: 14.0),)),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "450 crore best selling painting "
                                                  "Guinness world record",
                                              style: TextStyle(
                                                  fontSize: 16.0, color: Colors.black),
                                              textAlign: TextAlign.left,
                                              softWrap: true,
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,

                                              child: Text(
                                                "Posted by Open Horizon",
                                                style: TextStyle(
                                                    fontSize: 14.0, color: Colors.grey),
                                                textAlign: TextAlign.left,textScaleFactor: 1.0,
                                                softWrap: true,
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.only(top: 10.0,right: 30.0),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Wrap(
                                                      crossAxisAlignment: WrapCrossAlignment.start,
                                                      children: [
                                                        Image.asset('Assets/Icons/clock-1.png', scale: 3,),
                                                        Text(' 19 Apr 2021',style: TextStyle(color: Colors.grey.withOpacity(0.8))),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 6.0),
                                                      child: Wrap(
                                                        crossAxisAlignment: WrapCrossAlignment.center,
                                                        children: [
                                                          Image.asset('Assets/Icons/eye-fill.png', scale: 3,),
                                                          Text(' 2.9k',style: TextStyle(color: Colors.grey.withOpacity(0.8))),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        "Assets/Icons/Group -1.png",
                                        alignment: Alignment.center,
                                        width: 120.0,
                                        height: 120.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {

                              },
                            )),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0),
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0,top: 10.0),
                        child: new Card(
                            elevation: 3.0,
                            child: new GestureDetector(
                              child: new Container(
                                child: Row(
                                  children: <Widget>[

                                    new Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: Container(
                                        width: 220.0,
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.only(bottom:10.0),
                                                child:  Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5.0),
                                                    color: Color.fromARGB(255, 233, 10, 10),
                                                  ),
                                                  height: 25.0,
                                                  width: 60.0,
                                                  child: Center(child: const Text('WORLD',style: TextStyle(fontSize: 14.0),)),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "450 crore best selling painting "
                                                  "Guinness world record",
                                              style: TextStyle(
                                                  fontSize: 16.0, color: Colors.black),
                                              textAlign: TextAlign.left,
                                              softWrap: true,
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,

                                              child: Text(
                                                "Posted by Open Horizon",
                                                style: TextStyle(
                                                    fontSize: 14.0, color: Colors.grey),
                                                textAlign: TextAlign.left,textScaleFactor: 1.0,
                                                softWrap: true,
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.only(top: 10.0,right: 30.0),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Wrap(
                                                      crossAxisAlignment: WrapCrossAlignment.start,
                                                      children: [
                                                        Image.asset('Assets/Icons/clock-1.png', scale: 3,),
                                                        Text(' 19 Apr 2021',style: TextStyle(color: Colors.grey.withOpacity(0.8))),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 6.0),
                                                      child: Wrap(
                                                        crossAxisAlignment: WrapCrossAlignment.center,
                                                        children: [
                                                          Image.asset('Assets/Icons/eye-fill.png', scale: 3,),
                                                          Text(' 2.9k',style: TextStyle(color: Colors.grey.withOpacity(0.8))),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        "Assets/Icons/Group -1.png",
                                        alignment: Alignment.center,
                                        width: 120.0,
                                        height: 120.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {

                              },
                            )),
                      ),
                    ),
                  )
                ]),
              ),
            ),
          ),
        ));
  }
}
