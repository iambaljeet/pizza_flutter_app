import 'package:flutter/material.dart';
import 'package:pizzaflutterapp/FoodItemDetail.dart';
import 'package:pizzaflutterapp/data.dart';

List<String> _categoriesOption = ["Pizza", "Rolls", "Burger"];
String _selectedCategoryItem = _categoriesOption[0];
int _bottomNavSelectedIndex = 0;

const List<BottomNavigationBarItem> _bottomNavigationOptions =
    <BottomNavigationBarItem>[
  BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
  BottomNavigationBarItem(icon: Icon(Icons.favorite), title: Text('Favorites')),
  BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), title: Text('Cart')),
  BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Person'))
];

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavigationOptions,
        selectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        unselectedItemColor: Colors.grey[400],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Featured',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5.0,
                    fontFamily: 'Bellota',
                  ),
                ),
                Text(
                  'Food',
                  style: TextStyle(
                    fontSize: 26,
                    letterSpacing: 5.0,
                    fontFamily: 'Bellota',
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 30,
                  child: ListView.builder(
                    itemCount: _categoriesOption.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return FoodTypesWidget(
                          category: _categoriesOption[index],
                          isSelected:
                              _selectedCategoryItem == _categoriesOption[index],
                          context: this);
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 370,
                  child: ListView.builder(
                    itemCount: getFoodData().length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return FoodItemsList(
                        index,
                        getFoodData()[index].itemId,
                        getFoodData()[index].foodImage,
                        getFoodData()[index].foodTitle,
                        getFoodData()[index].foodCategory,
                        getFoodData()[index].foodPrice,
                        getFoodData()[index].isFavorite,
                        getFoodData()[index].backgroundColor,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FoodTypesWidget extends StatefulWidget {
  String category;
  bool isSelected;
  _MyHomePageState context;
  FoodTypesWidget({this.category, this.isSelected, this.context});

  @override
  _FoodTypesWidgetState createState() => _FoodTypesWidgetState();
}

class _FoodTypesWidgetState extends State<FoodTypesWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.context.setState(() {
          _selectedCategoryItem = widget.category;
        });
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(right: 25),
        margin: EdgeInsets.only(left: 10),
        child: Text(
          widget.category,
          style: TextStyle(
            color: widget.isSelected ? Colors.black : Colors.grey[400],
            fontSize: 20,
            fontFamily: 'Raleway',
          ),
        ),
      ),
    );
  }
}

class FoodItemsList extends StatelessWidget {
  int index;
  int itemId;
  String foodImage;
  String foodTitle;
  String foodCategory;
  String foodPrice;
  bool isFavorite;
  Color backgroundColor;

  FoodItemsList(this.index, this.itemId, this.foodImage, this.foodTitle,
      this.foodCategory, this.foodPrice, this.isFavorite, this.backgroundColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(24)),
      padding: EdgeInsets.only(top: 16, bottom: 16, right: 16, left: 16),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              child: Expanded(
                child: Image.asset(foodImage, fit: BoxFit.contain),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FoodItemDetail(index)));
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              foodTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: 'Raleway',
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              foodCategory,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    foodPrice,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Raleway'),
                  ),
                ),
                Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
