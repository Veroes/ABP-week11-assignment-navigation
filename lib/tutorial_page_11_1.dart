import 'package:flutter/material.dart';
import 'package:week_10/main.dart';
import 'package:week_10/tutorial_page_11_2.dart';

void main() {
  runApp(const TutorialPage_11_1());
}

class TutorialPage_11_1 extends StatelessWidget {
  const TutorialPage_11_1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ABP Minggu 11",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyProfilePage(title: "ABP Minggu 11"),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key, required this.title});
  final String title;

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  int selected = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              selected = index;
            });
          },
          children: [
            Center(
              child: InkWell(
                child: const Text(
                  "Go to Home page",
                  style: TextStyle(fontSize: 30),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyApp(),
                    ),
                  );
                },
              ),
            ),
            const TutorialPage_11_2(),
            const Center(
              child: Text(
                "Profile Page",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.white,
        currentIndex: selected,
        onTap: (index) {
          setState(() {
            selected = index;
          });
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email),
            label: "Email",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
