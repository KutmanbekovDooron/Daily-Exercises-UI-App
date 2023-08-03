import 'package:daily_exercises/constants.dart';
import 'package:daily_exercises/screens/detail_screen.dart';
import 'package:daily_exercises/widgets/bottom_nav_bar.dart';
import 'package:daily_exercises/widgets/category_card.dart';
import 'package:daily_exercises/widgets/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Cairo",
          scaffoldBackgroundColor: kBackgroundColor,
          textTheme:
              Theme.of(context).textTheme.apply(displayColor: kTextColor)),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: Stack(
        children: [
          Container(
            height: size.height * .45,
            decoration: const BoxDecoration(
                color: Color(0xffF5CEB8),
                image: DecorationImage(
                    alignment: Alignment.centerLeft,
                    image:
                        AssetImage("assets/images/undraw_pilates_gpdb.png"))),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    alignment: Alignment.center,
                    height: 52,
                    width: 52,
                    decoration: const BoxDecoration(
                        color: Color(0xffF2BEA1), shape: BoxShape.circle),
                    child: SvgPicture.asset("assets/icons/menu.svg"),
                  ),
                ),
                Text(
                  "Good morning\nShiShir",
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.w900),
                ),
                const SearchInput(),
                Expanded(
                    child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: .85,
                  crossAxisSpacing: 25,
                  mainAxisSpacing: 25,
                  children: [
                    CategoryCard(
                      title: "Diet recommendation",
                      icon: "Hamburger",
                      press: () {},
                    ),
                    CategoryCard(
                      title: "Kegel Excrecises",
                      icon: "Excrecises",
                      press: () {},
                    ),
                    CategoryCard(
                      title: "Meditation",
                      icon: "Meditation",
                      press: () {
                        Navigator.push(context,
                            CupertinoPageRoute(builder: (_) => DetailScreen()));
                      },
                    ),
                    CategoryCard(
                      title: "Yoga",
                      icon: "yoga",
                      press: () {},
                    ),
                  ],
                ))
              ],
            ),
          ))
        ],
      ),
    );
  }
}

