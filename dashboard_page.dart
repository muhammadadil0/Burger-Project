import 'package:burger_project/burger_page.dart';
import 'package:burger_project/foodtab.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with SingleTickerProviderStateMixin{
  TabController? tabController;
  void initState(){
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.menu),
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 6.0,
                        spreadRadius: 4.0,
                        offset: Offset(0.0, 3.0),
                      )
                    ],
                    color: Color(0xFFC6E7FE),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://github.com/rajayogan/FlutterUI---Emojis/blob/master/assets/tuxedo.png?raw=true'),
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              'SEARCH FOR',
              style: TextStyle(
                  fontWeight: FontWeight.w800, fontSize: 27.0, color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              'RECIPIES',
              style: TextStyle(
                  fontWeight: FontWeight.w800, color: Colors.black, fontSize: 27.0),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 25.0),
            child: Container(
              padding: EdgeInsets.only(left: 5.0),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                    fontSize: 14.0,
                  ),
                  border: InputBorder.none,
                  fillColor: Colors.grey.withOpacity(0.5),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              'Recommended',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            height: 200.0, // Set a specific height for the inner ListView
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                buildListItem('Hamburger',
                    'https://github.com/rajayogan/FlutterUI---Emojis/blob/master/assets/burger.png?raw=true',
                    '21', Color(0xFD5D45F)),
                buildListItem('Chips',
                    'https://github.com/rajayogan/FlutterUI---Emojis/blob/master/assets/fries.png?raw=true',
                    '15', Color(0xFFC2E3FE)),
                buildListItem('Donuts',
                    'https://github.com/rajayogan/FlutterUI---Emojis/blob/master/assets/doughnut.png?raw=true',
                    '21', Color(0xFFD7FADA)),
                // Add more items here if needed
              ],
            ),
          ),
          SizedBox(height: 10.0,),
          Padding(
              padding:EdgeInsets.only(left: 15.0),
          child: TabBar(
            controller: tabController,
            isScrollable: true,
            indicatorColor: Colors.transparent,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.withOpacity(0.5),
            labelStyle: TextStyle(fontWeight: FontWeight.w700,fontSize: 16.0),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.0),
            tabs: [
              Tab(
                child: Text('FEATURED'),
              ),Tab(
                child: Text('COMBO'),
              ),Tab(
                child: Text('FAVOURITES'),
              ),  Tab(
                child: Text('RECOMMENDED'),
              ),
            ],
          ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 450.0,
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                  Foodtab(),
                  Foodtab(),
                  Foodtab(),
                  Foodtab(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildListItem(String foodName, String url, String price, Color bgcolor) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BurgerPage(heroTag: foodName,foodName: foodName,pricePerItem: price,imagePath: url,)));
        },
        child: Container(
          height: 175.0,
          width: 150.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: bgcolor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: foodName,
                child: Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image(
                      image: NetworkImage(url),
                      height: 50.0,
                      width: 50.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                foodName,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0),
              ),
              SizedBox(height: 5.0),
              Text(
                '\$$price',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
