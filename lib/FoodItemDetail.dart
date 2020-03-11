import 'package:flutter/material.dart';
import 'package:pizzaflutterapp/StarDisplay.dart';
import 'package:pizzaflutterapp/data.dart';
import 'package:pizzaflutterapp/fooditem.dart';

class FoodItemDetail extends StatefulWidget {
  int index;
  List<FoodItems> foodItemList;
  FoodItems foodItems;

  FoodItemDetail(int index) {
    this.index = index;
    this.foodItemList = getFoodData();
    this.foodItems = foodItemList[index];
  }

  @override
  _FoodItemDetailState createState() => _FoodItemDetailState();
}

class _FoodItemDetailState extends State<FoodItemDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            right: -40.0,
            top: -40.0,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  color: widget.foodItems.backgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(200))),
            ),
          ),
          Positioned(
            bottom: -80.0,
            left: -20.0,
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                  color: widget.foodItems.backgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(250))),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BackButton(
                      color: Colors.black,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Image.asset(
                                widget.foodItems.foodImage,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              widget.foodItems.foodTitle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 35,
                                fontFamily: 'Raleway',
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.foodItems.foodCategory,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Raleway',
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            StarDisplay(
                              value: widget.foodItems.rating,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              widget.foodItems.foodDescription,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'Raleway',
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.foodItems.foodPrice,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'Raleway',
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: Text(
                                  'Add to cart',
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Raleway',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
