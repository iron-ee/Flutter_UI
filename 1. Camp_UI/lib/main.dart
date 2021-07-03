import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(height: 10,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Friday, February 21',
                    style: TextStyle(color:Colors.grey, fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      'Go to the vacation',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: 'Search anything...'
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.blueGrey,
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: AspectRatio(
                    aspectRatio: 1.5 / 1,
                      child: Image.asset("assets/banner.jpeg",
                      fit: BoxFit.cover,),
                  ),
                ),
                SizedBox(height: 10,),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        'Categories',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )
                ),
                SizedBox(height: 10,),
                Container(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      buildCategories('assets/camping.jpg', 'Camping'),
                      SizedBox(width: 20,),
                      buildCategories('assets/vacation.jpg', 'Vacation'),
                      SizedBox(width: 20,),
                      buildCategories('assets/camping.jpg', 'Camping'),
                      SizedBox(width: 20,),
                      buildCategories('assets/vacation.jpg', 'Vacation'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.near_me), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
        ],
      ),
    );
  }

  Widget buildCategories(String imageUrl, String title) {
    return Container(
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AspectRatio(
                              child: FittedBox(
                                fit: BoxFit.fill,
                                  child: Image.asset(imageUrl)),
                              aspectRatio: 1 / 0.7,
                          ),
                          Text(title),
                        ],
                      ),
                    ),
                  );
  }
}