import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter_profile',
      theme: ThemeData(
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.deepPurple.shade400)),
        primarySwatch: Colors.deepPurple,
      ),
      home: Profile(),
    );
  }
}

class Profile extends StatefulWidget {

  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Container(
        width: 200,
        height: double.infinity,
        color: kColor1,
      ),
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text(
            'Profile',
            style: TextStyle(color: Colors.deepPurple.shade200),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            buildProfileInfo(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildPostInfo('50', 'Posts'),
                buildPostLine(),
                buildPostInfo('20k', 'Followers'),
                buildPostLine(),
                buildPostInfo('500', 'Following'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildButton(true),
                buildButton(false),
              ],
            ),
            SizedBox(height: 20),
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(icon: Icon(Icons.image, color: Colors.black54,)),
                Tab(icon: Icon(Icons.grid_on, color: Colors.black54,)),
                ]
            ),
            Expanded(
              child: TabBarView(
                  controller: _tabController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Image.asset('assets/purple_5.jpg',
                      fit: BoxFit.fill,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                        itemBuilder: (context, index) {
                          //return Image.network('https://picsum.photos/id/${index + 110}/200/200');
                          return Image.asset(
                            'assets/purple_${index + 1}.jpg',
                            fit: BoxFit.fill,
                          );
                        },
                      ),
                    ),
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(bool isButton) {
    return InkWell(
                onTap: () {
                  print('클릭됨');
                },
                child: Container(
                  width: 150,
                  height: 45,
                  child: Align(
                    child: Text(
                      isButton ? 'Follow' : 'Message',
                      style: TextStyle(
                          color: isButton ? Colors.white : Colors.deepPurple.shade400,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: isButton ? Colors.deepPurple.shade400 : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: isButton ? null : Border.all(width: 2, color: Colors.deepPurple.shade400)
                  ),
                ),
              );
  }

  Widget buildPostLine() {
    return Opacity(
      opacity: 0.5,
      child: Container(
                  color: Colors.deepPurple.shade100,
                  width: 2,
                  height: 60,
                ),
    );
  }

  Widget buildPostInfo(String num, String title) {
    return Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 65,
                    child: Text(
                      num,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black45,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              );
  }

  Widget buildProfileInfo() {
    return Row(
          children: [
            Container(
              width: 100,
              height: 100,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/avatar_purple.jpg'),
              ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jeongcheol Park',
                  style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w700
                  ), maxLines: 1,
                ),
                SizedBox(height: 5),
                Text(
                  'Programmer/App/Flutter',
                  style: TextStyle(
                    fontSize: 16,
                  ), maxLines: 1,
                ),
                SizedBox(height: 5),
                Text(
                    'Busan',
                  style: TextStyle(
                    fontSize: 14, color: Colors.grey
                  ), maxLines: 1,
                ),
              ],
            )
          ],
        );
  }
}
