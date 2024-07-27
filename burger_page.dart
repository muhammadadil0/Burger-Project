import 'package:flutter/material.dart';

class BurgerPage extends StatefulWidget {

  final String imagePath, foodName, pricePerItem, heroTag;
  BurgerPage({super.key, required this.imagePath, required this.foodName, required this.pricePerItem, required this.heroTag});

  @override
  State<BurgerPage> createState() => _BurgerPageState();
}

class _BurgerPageState extends State<BurgerPage> {
  var netPrice = 0.0;
  var quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.menu, color: Colors.black),
                Stack(
                  children: [
                    Container(
                      height: 45.0,
                      width: 45.0,
                      color: Colors.transparent,
                    ),
                    Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFFE7D6A).withOpacity(0.3),
                            blurRadius: 6.0,
                            spreadRadius: 4.0,
                            offset: Offset(0.0, 4.0),
                          ),
                        ],
                        color: Color(0xFFFE7D6A),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(Icons.shopping_cart, color: Colors.white),
                      ),
                    ),
                    Positioned(
                      top: 1.0,
                      right: 4.0,
                      child: Container(
                        height: 12.0,
                        width: 12.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '1',
                            style: TextStyle(fontSize: 7.0, color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 15.0),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              'SUPER',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 27.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              widget.foodName.toString().toUpperCase(),
              style: TextStyle(fontSize: 27.0, fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Hero(
                tag: widget.heroTag,
                child: Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15.0),
              Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 45.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFFE7D6A).withOpacity(0.1),
                              blurRadius: 6.0,
                              spreadRadius: 6.0,
                              offset: Offset(5.0, 11.0),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.favorite_border,
                            color: Color(0xFFFE7D6A),
                            size: 25.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 35.0),
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 45.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFFE7D6A).withOpacity(0.1),
                              blurRadius: 6.0,
                              spreadRadius: 6.0,
                              offset: Offset(5.0, 11.0),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.restore,
                            color: Color(0xFFFE7D6A),
                            size: 25.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10.0,

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 70.0,
                width: 125.0,
                color: Colors.white,
                child: Center(
                  child: Text('\$' + (int.parse(widget.pricePerItem) * quantity ).toString(),
                  style: TextStyle(fontSize: 40.0,color: Color(0xFF5E6166),
                  fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                height: 60.0,
                width: 225.0,
                decoration: BoxDecoration(
                  color: Color(0xFFFE7D6A),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),bottomLeft: Radius.circular(10.0))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                       Container(
                          height: 40.0,
                         width: 105.0,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10.0),
                           color: Colors.white,
                         ),
                         child: Row(
                           children: <Widget>[
                             IconButton(
                                 iconSize: 17.0,
                                 onPressed: (){
                                   adjustQuantity('MINUS');
                                 }, icon: Icon(Icons.remove,color:Color(0xFFFE7D6A) ,)),
                             Text(quantity.toString(),style: TextStyle(fontSize: 14.0,
                                 color:Color(0xFFFE7D6A),
                               fontWeight: FontWeight.w600
                             ),),
                             IconButton(
                                 iconSize: 17.0,
                                 onPressed: (){
                                   adjustQuantity('PLUS');
                                 }, icon: Icon(Icons.add,color:Color(0xFFFE7D6A) ,)),
                           ],
                         ),
                       ),
                    Text('Add to cart',style: TextStyle(fontSize: 14.0,color: Colors.white,fontWeight: FontWeight.w500),
                    ),
                  ],
                ),

              )
            ],
          ),
          Padding(padding: EdgeInsets.all(15.0),
          child: Text('FEATURED',style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w800),),
          ),
          Container(
            height: 225.0,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _buildListItem('1'),
                _buildListItem('2'),
              ],
            ),
          )
        ],
      ),
    );
  }
  _buildListItem(String columnNumber) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          if (columnNumber == '1')
            _buildColumnItem(
                'https://github.com/rajayogan/FlutterUI---Emojis/blob/master/assets/cheese.png?raw=true',
                'Sweet Cheese',
                '11',
                Color(0xFFFBD6F5)
            ),
          if (columnNumber == '2')  // Adjusted to handle another case
            _buildColumnItem(
                'https://github.com/rajayogan/FlutterUI---Emojis/blob/master/assets/popcorn.png?raw=true',
                'Spicy Cheese',
                '12',
                Color(0xFFFFD54F)
            ),

        ],
      ),
    );
  }



  _buildColumnItem(String imagePath,String foodName,String price,Color bgColor){
     return Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children:<Widget>[
         Container(
           width: 210.0,
           child: Row(
             children: [
               Container(
                 height: 75.0,
                 width: 75.0,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(7.0),
                   color: bgColor,
                 ),
                 child: Center(
                   child: Image(image: NetworkImage(imagePath),height: 50.0,width: 50.0,),
                 ),
               ),
               SizedBox(width: 20.0,),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(foodName,style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w600,),),
                   Text('\$' + price,style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600,color: Color(0xFFFE7D6A)),)
                 ],
               )
             ],
           ),
         )
       ],
     );
  }
      adjustQuantity(pressed){
    switch(pressed){
      case 'PLUS':
        setState(() {
          quantity+=1;

        });
        return;
      case 'MINUS':
        setState(() {
          if(quantity!=0){
            quantity-=1;
          }

        });
        return;
    }
      }
}
