import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogUi extends StatefulWidget {
  BlogUi({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _BlogUiState createState() => _BlogUiState();
}

class _BlogUiState extends State<BlogUi> {
  var selectedIndex = 0;
  var _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo), title: Text("Exercise")),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_comment), title: Text("Nutrition/Diet"))
        ],
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: Duration(microseconds: 300), curve: Curves.easeInOut);
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: 3,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return returnFragment(index);
        },
      ),
    );
  }

  Widget returnFragment(int index) {
    switch (index) {
      case 1:
        return Random();
        break;
      default:
        return AddNewPost();
    }
  }
}

class SwasthyaPala extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Swasthya Pala",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlogUi(title: "Blog Swasthya Pala"),
    );
  }
}
