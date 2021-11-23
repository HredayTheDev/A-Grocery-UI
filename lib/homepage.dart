import 'package:dashing_ui/widget/categories_title.dart';
import 'package:dashing_ui/widget/top_product_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedOptionsIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("A Grocery UI",style: TextStyle(color: Colors.black),),
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.gripLines,
          ),
          color: Colors.black,
          tooltip: 'Menu',
          onPressed: () {},
        ),
        actions: _buildActions(),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/banner.jpg",
                  height: 200,
                  width: 350,
                  fit: BoxFit.cover,
                ),
                _buildCategories(),
                _buildTopProducts(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buidBottomNavigationBar(),
    );
  }

  List<Widget> _buildActions() => <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            size: 20,
          ),
          onPressed: () {},
          color: Colors.black,
          tooltip: 'Search',
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.shoppingBasket),
          onPressed: () {},
          color: Colors.black,
          tooltip: 'Cart',
        ),
      ];

  Widget _buildCategories() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: GoogleFonts.varelaRound(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                _ExploreAllButton(
                  onTap: () {},
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          _buildCaterogyList(),
        ],
      ),
    );
  }

  Widget _buildCaterogyList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CategoriesTitle(
          assetPath: 'assets/images/apple.png',
          color: Colors.pink.shade100,
          title: 'Apple',
        ),
        CategoriesTitle(
          assetPath: 'assets/images/bread.png',
          color: Colors.green[100],
          title: 'Bread',
        ),
        CategoriesTitle(
          assetPath: 'assets/images/kiwi.png',
          color: Colors.blue[200],
          title: 'Kiwi',
        ),
        CategoriesTitle(
          assetPath: 'assets/images/milk.png',
          color: Colors.black,
          title: 'Milk',
        ),
        //  CategoriesTitle(
        //   assetPath: 'assets/images/milk.png',
        //   color: Colors.purple[200],
        //   title: 'Milk',
        // ),
      ],
    );
  }

  Widget _buildTopProducts() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Products",
                  style: GoogleFonts.varelaRound(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                _ExploreAllButton(
                  onTap: () {},
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          _buildTopProductList(),
        ],
      ),
    );
  }

  Widget _buildTopProductList() {
    List topProductlist = [
      TopProductTile(
        assetPath: 'assets/images/kiwi.png',
        title: 'Kiwi Fruits',
        color: Colors.lightBlue.shade100,
        price: '\$2.25',
      ),
      TopProductTile(
        assetPath: 'assets/images/apple.png',
        title: 'Apple',
        color: Colors.amber.shade100,
        price: '\$3.25',
      ),
      TopProductTile(
        assetPath: 'assets/images/bread.png',
        title: 'Bread',
        color: Colors.purple.shade100,
        price: '\$4.25',
      ),
    ];
    return Column(
      children: [
        Container(
          height: 200,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => topProductlist[index],
              separatorBuilder: (context, index) => SizedBox(
                    width: 20,
                  ),
              itemCount: topProductlist.length),
        )
      ],
    );
  }

  Widget _buidBottomNavigationBar() {
    List<String> bottonNavigatioBarOptions = [
      'Home',
      'Favourites',
      'Notifications',
      'Profile'
    ];

    List<IconData> bottomNavigationBarIcons = [
      Icons.home,
      Icons.favorite_outline_outlined,
      Icons.notification_add_outlined,
      Icons.person
    ];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
          children: List.generate(bottonNavigatioBarOptions.length, (index) {
        if (index == selectedOptionsIndex) {
          return Expanded(
              flex: 2,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedOptionsIndex = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          bottomNavigationBarIcons[index],
                          color: Colors.green,
                        ),
                        Text(
                          bottonNavigatioBarOptions[index],
                          style: GoogleFonts.varelaRound(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
              ));
        }

        return Expanded(
            child: GestureDetector(
          onTap: () {
            setState(() {
              selectedOptionsIndex = index;
            });
          },
          child: Icon(
            bottomNavigationBarIcons[index],
            color: Colors.white,
          ),
        ));
      })),
      height: 55,
      decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
    );
  }
}

class _ExploreAllButton extends StatelessWidget {
  final Function onTap;
  const _ExploreAllButton({
    Key key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
        //  color: Color(0xffE0E6EE),
        color: Colors.deepOrangeAccent,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10)),
        ),
        child: Text(
          'Explore All',
          style: GoogleFonts.varelaRound(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ),
    );
  }
}
