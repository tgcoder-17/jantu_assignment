import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool _isExpanded = false;

  int filterItem = 0;
  String jantu = "";
  String distance = "";
  String litres = "";

  List<String> jantuList = [
    "assets/images/cow2.png",
    "assets/images/cow2.png",
    "assets/images/cow1.png",
    "assets/images/cow2.png",
    "assets/images/cow3.png",
    "assets/images/cow2.png",
  ];

  List<String> distanceList = ["30", "90", "150", "260", "300", "500"];
  List<String> litreList = ["0-10", "10-20", "20-30", "30-40", "50-60"];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0xFFFB8079)));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Jantu",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 10.0,
        leading: Padding(
          padding: EdgeInsets.only(left: 7.0, top: 10.0, bottom: 10.0),
          child: CircleAvatar(
            child: SvgPicture.asset("assets/images/avatar.svg"),
          ),
        ),
        actions: [
          InputChip(
            backgroundColor: Colors.white,
            labelPadding: EdgeInsets.only(left: 5.0, right: 5.0),
            tooltip: "Filter",
            label: Text(
              "Jantu Filters",
              style: TextStyle(
                color: Colors.black,
                fontSize: 10,
              ),
            ),
            deleteIcon: Icon(
              Icons.filter_alt,
              color: Color(0xFFFB8079),
            ),
            deleteButtonTooltipMessage: "Filter",
            onPressed: () {},
            onDeleted: () {},
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            child: InputChip(
              tooltip: "Pin Code",
              deleteButtonTooltipMessage: "Pin Code",
              backgroundColor: Colors.white,
              label: Text(
                "395009",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                ),
              ),
              deleteIcon: Icon(Icons.location_on, color: Color(0xFFFB8079)),
              onDeleted: () {},
              onPressed: () {},
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFFB8079),
                // border: Border.all(color: Colors.black, width: 0.0),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(600, 100),
                    bottomRight: Radius.elliptical(600, 100)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: _isExpanded
                        ? Container(
                            height: 300,
                            child: Column(
                              children: [
                                filterListContainer(jantuList, 1),
                                filterListContainer(distanceList, 2),
                                filterListContainer(litreList, 3),
                              ],
                            ),
                          )
                        : filteredContainer(),
                  ),
                  _isExpanded
                      ? Material(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(20),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                filterItem = 3;
                                jantu = "Cow";
                                distance = "20-30 KM";
                                litres = "20-30 L";
                                _isExpanded = false;
                              });
                            },
                            child: Container(
                              height: 30,
                              width: 130,
                              alignment: Alignment.center,
                              child: Text(
                                "Search",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Text(
                            "Choose your favorite Jantu",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                        ),
                  IconButton(
                    icon: Icon(_isExpanded
                        ? CupertinoIcons.chevron_compact_up
                        : CupertinoIcons.chevron_compact_down),
                    color: Colors.white,
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> FilterScreen()))
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                  )
                ],
              ),
            ),
            cardContainer(
                "Veeranahalli (Approx. 22 KM)",
                "3 days ago",
                "assets/images/cow1.png",
                "Country cow: Rs. 95000",
                "3 years",
                "Gaurav"),
            cardContainer(
                "Surat (Approx. 300 KM)",
                "5 days ago",
                "assets/images/cow2.png",
                "Country bull: Rs. 120000",
                "4 years",
                "Tushar"),
            cardContainer(
                "Puna (Approx. 250 KM)",
                "10 days ago",
                "assets/images/cow3.png",
                "Country cow: Rs. 97000",
                "2 years",
                "Tejash"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Buy Jantu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  filteredContainer() {
    Widget row1;
    if (filterItem != 0) {
      row1 = Wrap(
        spacing: 4.0,
        runSpacing: -10.0,
        children: [
          jantu.isNotEmpty
              ? InputChip(
                  label: Text(
                    jantu,
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                  backgroundColor: Colors.white,
                  avatar: Icon(
                    Icons.nature_people,
                    color: Colors.black,
                  ),
                  deleteIcon: Icon(
                    CupertinoIcons.clear_circled_solid,
                    color: Color(0xFFFB8079),
                    size: 18.0,
                  ),
                  onDeleted: () {
                    setState(() {
                      jantu = "";
                    });
                  },
                )
              : SizedBox(),
          distance.isNotEmpty
              ? InputChip(
                  label: Text(
                    distance,
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                  backgroundColor: Colors.white,
                  avatar: Icon(
                    Icons.add_location_alt,
                    color: Colors.black,
                  ),
                  deleteIcon: Icon(CupertinoIcons.clear_circled_solid,
                      color: Color(0xFFFB8079), size: 18.0),
                  onDeleted: () {
                    setState(() {
                      distance = "";
                    });
                  },
                )
              : SizedBox(),
          litres.isNotEmpty
              ? InputChip(
                  label: Text(
                    litres,
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                  backgroundColor: Colors.white,
                  avatar: Icon(
                    Icons.hourglass_bottom,
                    color: Colors.black,
                  ),
                  deleteIcon: Icon(CupertinoIcons.clear_circled_solid,
                      color: Color(0xFFFB8079), size: 18.0),
                  onDeleted: () {
                    setState(() {
                      litres = "";
                    });
                  },
                )
              : SizedBox(),
        ],
      );
    } else
      row1 = SizedBox(
        height: 20.0,
      );

    return Column(
      children: [
        row1,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            circularContainer("Jantu", Icons.nature_people),
            SizedBox(
              width: 30.0,
            ),
            circularContainer("Distance", Icons.add_location_alt),
            SizedBox(
              width: 30.0,
            ),
            circularContainer("Litres", Icons.hourglass_bottom),
          ],
        ),
      ],
    );
  }

  circularContainer(String title, IconData iconData) {
    return Material(
      elevation: 10.0,
      color: Colors.white,
      borderRadius: BorderRadius.circular(50),
      child: InkResponse(
        onTap: () {},
        child: Container(
          height: 70,
          width: 70,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
              ),
              Icon(
                iconData,
                color: Color(0xFFFB8079),
                size: 24.0,
              )
            ],
          ),
        ),
      ),
    );
  }

  cardContainer(String city, String time, String image, String title,
      String age, String seller) {
    return Padding(
        padding: EdgeInsets.all(5.0),
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.white,
          elevation: 10.0,
          child: InkWell(
            onTap: () {},
            child: Column(
              children: [
                Stack(children: <Widget>[
                  Container(
                    child: Image.asset(
                      image,
                      alignment: Alignment.center,
                      height: 160,
                      width: MediaQuery.of(context).size.width - 10.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // fit: BoxFit.cover,
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0)),
                      ),
                      width: 342,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                        child: Row(
                          children: [
                            Text(
                              city,
                              style: TextStyle(color: Colors.white),
                            ),
                            Spacer(),
                            Text(time, style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      )),
                ]),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 6.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                "Age: " + age,
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SvgPicture.asset(
                              "assets/images/seller.svg",
                              height: 40,
                              width: 40,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Seller: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Text(
                                  seller,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, bottom: 4.0, top: 2.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Read more...",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      Material(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                        child: InkResponse(
                          onTap: () => {},
                          child: Container(
                            height: 30,
                            width: 50,
                            alignment: Alignment.center,
                            child: Text(
                              "Call",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Material(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(20),
                          child: InkResponse(
                            onTap: () => {},
                            child: Container(
                              height: 30,
                              width: 50,
                              alignment: Alignment.center,
                              child: Text(
                                "Share",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  filterListContainer(List<String> list, int type) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 26.0,
        top: 20.0,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 35.0),
            child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: SizedBox(),
            ),
          ),
          Row(
            children: [
              type == 1
                  ? circularContainer("Jantu", Icons.nature_people)
                  : type == 2
                      ? circularContainer("Distance", Icons.add_location_alt)
                      : circularContainer("Litres", Icons.hourglass_bottom),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: SizedBox(
                  width: 230,
                  height: 60,
                  child: Container(
                    // color: Colors.white,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: list.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 5.0,
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0))),
                              child: type == 1
                                  ? Material(
                                      color: Colors.white,
                                      child: InkWell(
                                        onTap: () {},
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment:
                                                  FractionalOffset.bottomCenter,
                                              child: Image.asset(
                                                list[index],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Align(
                                                alignment: FractionalOffset
                                                    .bottomCenter,
                                                child: Container(
                                                  width: 70,
                                                  color: Colors.black54,
                                                  child: Text(
                                                    "Cow",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10),
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                    )
                                  : type == 2
                                      ? Material(
                                          color: Colors.white,
                                          child: InkWell(
                                            onTap: () {},
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(Icons.location_on),
                                                      Text("Kms")
                                                    ],
                                                  ),
                                                  Text(list[index]),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      : Material(
                                          color: Colors.white,
                                          child: InkWell(
                                            onTap: () {},
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4.0,
                                                  right: 4.0,
                                                  top: 8.0,
                                                  bottom: 8.0),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(Icons
                                                          .hourglass_bottom),
                                                      Text("Litres")
                                                    ],
                                                  ),
                                                  Text(list[index]),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                            ),
                          );
                        }),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
