import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  int selected = 0;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 60, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RotatedBox(
                        quarterTurns: 1,
                        child: Icon(Icons.bar_chart_outlined),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                'https://cdn.pixabay.com/photo/2015/03/08/17/25/musician-664432_960_720.jpg',
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Hey Faruk !',
                    style: TextStyle(fontFamily: "Poppins", color: Colors.grey),
                  ),
                  // const SizedBox(height: 15,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Let's Explore\nThe World",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Icon(
                          Icons.emoji_emotions,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  // buildTabBar(),

                  buildTabBar(),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 300,
                    width: double.infinity,
                    child: TabBarView(controller: tabController, children: [
                      buildTabItem(
                          "assets/images/1.jpeg", "assets/images/2.jpeg"),
                      buildTabItem(
                          "assets/images/3.jpeg", "assets/images/4.jpeg"),
                      buildTabItem(
                          "assets/images/1.jpeg", "assets/images/4.jpeg"),
                      buildTabItem(
                          "assets/images/3.jpeg", "assets/images/1.jpeg"),
                    ]),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  TabBar buildTabBar() {
    return TabBar(
        onTap: (value) {
          setState(() {
            index = value;
            selected = value;
          });
        },
        unselectedLabelColor: Colors.grey,
        isScrollable: true,
        indicatorColor: Colors.transparent,
        controller: tabController,
        labelStyle: TextStyle(fontFamily: "Poppins"),
        tabs: <Container>[
          Container(
            height: 35,
            padding: EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
                color: selected == 0 ? Colors.black : null,
                borderRadius: BorderRadius.circular(29)),
            child: Tab(
              text: "Populer",
            ),
          ),
          Container(
            height: 35,
            padding: EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
                color: selected == 1 ? Colors.black : null,
                borderRadius: BorderRadius.circular(29)),
            child: Tab(
              text: "New",
            ),
          ),
          Container(
            height: 35,
            padding: EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
                color: selected == 2 ? Colors.black : null,
                borderRadius: BorderRadius.circular(29)),
            child: Tab(
              text: "Nearby",
            ),
          ),
          Container(
            height: 35,
            padding: EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
                color: selected == 3 ? Colors.black : null,
                borderRadius: BorderRadius.circular(29)),
            child: Tab(
              text: "Recommendation",
            ),
          ),
        ]);
  }

  Container buildTabItem(String images, String images2) {
    return Container(
      height: 300,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            height: 250,
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(images), fit: BoxFit.cover)),
            child: buildContainerMenor(),
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            height: 250,
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(images2), fit: BoxFit.cover)),
                    child: buildContainerMenor(),
          ),
        ],
      ),
    );
  }

  Column buildContainerMenor() {
    return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white.withOpacity(0.8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nusa Penida Island',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontFamily: "Poppins",
                          fontSize: 18),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 15,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 6,),
                        Text("Bali, Indonesia",
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontFamily: "Poppins",
                              fontSize: 10,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
  }
}
