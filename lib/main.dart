import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app/constrants.dart';
import 'package:meditation_app/widgets/category_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meditation App',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        // Theme of context is used to get the text theme of the default and .apply
        // changes the with the given text color.
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //This gonna give us total height and width of our device.
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 70,
        color: Colors.white,
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset("assets/icons/calendar.svg"),
                const Text("Today"),
              ],
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            //Here the height of the container is 45% of our total height.
            height: size.height * .45,
            decoration: const BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF2BEA1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset("assets/icons/menu.svg"),
                    ),
                  ),
                  Text(
                    "Good Morning \nDivya",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontWeight: FontWeight.w900),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(29.5)),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        icon: SvgPicture.asset("assets/icons/search.svg"),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: const [
                        Categorycard(
                          title: "Diet Recommendation",
                          svgSrc: "assets/icons/Hamburger.svg",
                          // press: () {},
                        ),
                        Categorycard(
                          title: "Kegel Exercises",
                          svgSrc: "assets/icons/Excrecises.svg",
                          // press: () {},
                        ),
                        Categorycard(
                          title: "Meditation",
                          svgSrc: "assets/icons/Meditation.svg",
                          // press: () {},
                        ),
                        Categorycard(
                          title: "Yoga",
                          svgSrc: "assets/icons/yoga.svg",
                          // press: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
