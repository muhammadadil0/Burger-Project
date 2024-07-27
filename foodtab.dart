import 'package:flutter/material.dart';

class Foodtab extends StatefulWidget {
  const Foodtab({super.key});

  @override
  State<Foodtab> createState() => _FoodtabState();
}

class _FoodtabState extends State<Foodtab> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView(
        children: <Widget>[
          _buildListItem('Declicious hot dog',4.0,'6','https://github.com/rajayogan/FlutterUI---Emojis/blob/master/assets/hotdog.png?raw=true'),
          _buildListItem('Cheez Pasta',5.0,'12','https://github.com/rajayogan/FlutterUI---Emojis/blob/master/assets/pizza.png?raw=true'),
        ],
      ),
    );
  }
  _buildListItem(String foodName,rating,String price,String imagePath){
    return Padding(padding: EdgeInsets.all(15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: 230.0,
          child: Row(
            children: [
              Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.0),
                    color: Color(0xFFFFe3DF),
                  ),
                  child:Image(image: NetworkImage(imagePath),
                  height: 45.0,
                  width: 45.0,

                  ),
              ),
              SizedBox(width: 20.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(foodName,style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w600),
                  ),
                    Row(
                      children: <Widget>[
                        Text('\$'+ price,style: TextStyle(
                          fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                            color: Color(0xFFF68D7F),),),
                        SizedBox(width: 3.0,),
                        Text('\$'+'18',style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.w600,color: Colors.grey.withOpacity(0.4)),),
                      ],
                    )

                ],
              ),
            ],
          ),
        ),
        FloatingActionButton(onPressed: (){},
        heroTag: foodName,
          mini: true,
          child: Center(
            child: Icon(Icons.add,color: Colors.white,),
          ),
          backgroundColor: Color(0xFFFE7D6A),
        ),
      ],
    ),
    );
  }
}
