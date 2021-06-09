import 'package:flutter/material.dart';
import 'package:oh_media_app/ArticlePage.dart' as article;
import 'package:oh_media_app/PodcastPage.dart' as podcast;
import 'package:oh_media_app/TelecastPage.dart' as telecast;
import 'package:carousel_slider/carousel_slider.dart';

import 'Authentication/SignUp.dart';


class IntroPage extends StatefulWidget {
  TabController _tabController;
  @override
  _IntroPageState createState() => _IntroPageState();
}
Icon menuIcon = new Icon(Icons.menu_sharp);
Image appLogo = new Image(
    image: new ExactAssetImage("Assets/Icons/Logo.png"),

    alignment: FractionalOffset.bottomCenter);
final List<String> imgList = [
     '/Assets/Icons/Image -1.png',
  'C:/Users/Appu/AndroidStudioProjects/flutter_trainning/Tasks/oh_media_app/Assets/Icons/Image -1.png',
  'C:/Users/Appu/AndroidStudioProjects/flutter_trainning/Tasks/oh_media_app/Assets/Icons/Image -1.png',
  'C:/Users/Appu/AndroidStudioProjects/flutter_trainning/Tasks/oh_media_app/Assets/Icons/Image -1.png',

];
final List<Widget> imageSliders = imgList.map((item) => Container(
  child: Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15.0, right: 50.0),
                  child: Column(
                    children: [
                      Text(
                        'Thala Dhoni Started '
                            'web training',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: <Widget>[
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Image.asset('Assets/Icons/clock-4.png', scale: 3,),
                                Text(' 19 Apr 2021',style: TextStyle(color: Colors.white.withOpacity(0.8))),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6.0),
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Image.asset('Assets/Icons/Group 106.png', scale: 3,),
                                  Text(' 2.9k',style: TextStyle(color: Colors.white.withOpacity(0.8))),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
    ),
  ),
)).toList();
class _IntroPageState extends State<IntroPage> {
  int _currentIndex = 0;
  int _current = 0;
  static const kPrimaryColor =  Color(0xe50000);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Color
            .
        fromARGB
          (
            255,238,238,238
        )
        ,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: SafeArea(
            child: AppBar(
              backgroundColor: Color
                  .
              fromARGB
                (
                  255,233,10,10
              )
              ,
             toolbarHeight: 100.0,
             centerTitle: true,
             title: SafeArea(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                 Container(

                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Image.asset(
                     'Assets/Icons/Logo-1.png',
                     fit: BoxFit.cover,
                     height: 60,

               ),
                   ),
                 )],

            ),
             ),
              actions: [
                IconButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                  );
                },
                    icon: Padding(
                      padding: EdgeInsets.only(left: 0.0,top: 5.0,bottom: 20.0, right: 10.0),
                      child: new Image.asset(
                        "Assets/Icons/Group 218.png",
                        scale: 4,
                      ),
                ),
                )
              ],
              bottom: TabBar(
                tabs: [
                  Tab(child: Text("All", style: TextStyle(fontSize: 18.0),),),
                  Tab(child: GestureDetector(
                      child: Text("Articles", style: TextStyle(fontSize: 18.0),),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => article.ArticlePage()),
                      );
                    },
                  ),),
                  Tab(child: Text("Podcast", style: TextStyle(fontSize: 18.0),),),
                  Tab(child: Text("Telecast", style: TextStyle(fontSize: 18.0),),),
                ],
              ),
      ),
          ),
        ),
        body:SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              new SafeArea(
                top: true,
                child:
                Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:8.0),
                        child: CarouselSlider(
                          items: imageSliders,
                          options: CarouselOptions(
                              autoPlay: true,
                              enlargeCenterPage: false,
                              aspectRatio: 2.0,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index;
                                });
                              }
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imgList.map((url) {
                          int index = imgList.indexOf(url);
                          return Container(
                            width: 12.0,
                            height: 8.0,
                            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
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
                    ]
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 70.0,
          child: BottomNavigationBar(
             type: BottomNavigationBarType.fixed,

            currentIndex: _currentIndex,
            backgroundColor: Color
                .
            fromARGB
              (
                255,233,10,10
            )
            ,
            onTap: (value) {
               setState(() {
                 _currentIndex = value;
               });
            },
            items: [
              BottomNavigationBarItem(
                           icon: Padding(
                  padding: EdgeInsets.only(left: 0.0,top: 5.0,bottom: 5.0),
                  child: new Image.asset(
                    "Assets/Icons/home.png",
                    scale: 3,
                  ),
                ),
                label: "HOME"
              ),
              BottomNavigationBarItem(
                  label: "SEARCH",
                icon: Padding(
                  padding: EdgeInsets.only(left: 0.0,top: 5.0,bottom: 5.0),
                  child: new Image.asset(
                    "Assets/Icons/Group -3.png",
                    scale: 3,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                  label: "BOOKMARK",
                icon: Padding(
                  padding: EdgeInsets.only(left: 0.0,top: 5.0,bottom: 5.0),
                  child: new Image.asset(
                    "Assets/Icons/bookmark-1.png",
                    scale: 3,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                  label: "ACCOUNT",
                icon: Padding(
                  padding: EdgeInsets.only(left: 0.0,top: 5.0,bottom: 5.0),
                  child: new Image.asset(
                    "Assets/Icons/Path 37.png",
                    scale: 3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildNews(BuildContext context, String query) {
  return (Text("Article"));
}