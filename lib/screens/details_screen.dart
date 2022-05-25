import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app/constrants.dart';
import 'package:meditation_app/widgets/bottom_navItem..dart';
import 'package:meditation_app/widgets/search_bar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

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
              color: kBlueLightColor,
              image: DecorationImage(
                  image: AssetImage("assets/images/meditation_bg.png"),
                  fit: BoxFit.fitWidth),
            ),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Text(
                    "Meditation",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "3-10 MIN Course",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width:
                        size.width * .6, //It will just take 60% of total width.
                    child: const Text(
                        "Live happier and healthier by learning the fundamentals of meditaion and mindfullness"),
                  ),
                  SizedBox(
                    width: size.width * .5,
                    child: const SearchBar(),
                  ),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: [
                      SessionCard(
                        sessionNum: 1,
                        isDone: true,
                        press: () {},
                      ),
                      SessionCard(
                        sessionNum: 2,
                        isDone: true,
                        press: () {},
                      ),
                      SessionCard(
                        sessionNum: 3,
                        isDone: true,
                        press: () {},
                      ),
                      SessionCard(
                        sessionNum: 4,
                        isDone: true,
                        press: () {},
                      ),
                      SessionCard(
                        sessionNum: 5,
                        isDone: true,
                        press: () {},
                      ),
                      SessionCard(
                        sessionNum: 6,
                        isDone: true,
                        press: () {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Meditation",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    padding: const EdgeInsets.all(10.0),
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 17),
                          blurRadius: 23,
                          spreadRadius: -13,
                          color: kShadowColor,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/Meditation_women_small.svg",
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Basic 2",
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              const Text("Start your practice")
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset("assets/icons/Lock.svg"),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  final int sessionNum;
  final bool isDone;
  final VoidCallback press;
  const SessionCard({
    Key? key,
    required this.sessionNum,
    required this.isDone,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        child: Container(
          //Constraint.maxWidth provide us the availabe width
          // for this widget.
          width: constraint.maxWidth / 2 - 10,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 23),
                blurRadius: 23,
                spreadRadius: -23,
                color: kShadowColor,
              ),
            ],
          ),

          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(children: [
                  Container(
                    height: 42,
                    width: 43,
                    decoration: BoxDecoration(
                      color: isDone ? kBlueColor : Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.play_arrow,
                      color: isDone ? Colors.white : kBlueColor,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "session $sessionNum",
                    style: Theme.of(context).textTheme.subtitle1,
                  )
                ]),
              ),
            ),
          ),
        ),
      );
    });
  }
}
