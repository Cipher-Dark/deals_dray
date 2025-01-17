import 'package:carousel_slider/carousel_slider.dart';
import 'package:deals_dray/data/exclusive_data.dart';
import 'package:deals_dray/data/slider_data.dart';
import 'package:flutter/material.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 4,
          shadowColor: Colors.grey,
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu),
                Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width * .7,
                  padding: EdgeInsets.only(left: 15, top: 5, bottom: 5),
                  decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Image.asset(
                        "assets/images/logo.png",
                        scale: 12,
                      ),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      hintText: "Search here",
                    ),
                  ),
                ),
                Icon(
                  Icons.notifications_none,
                  color: Colors.black,
                  semanticLabel: "notification",
                )
              ],
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            spacing: 20,
            children: [
              CarouselSlider.builder(
                itemCount: SliderData().getSliderData().length,
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        SliderData().getSliderData()[index],
                        height: 250,
                        fit: BoxFit.contain,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 200,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(seconds: 3),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayInterval: Duration(seconds: 5),
                ),
              ),
              Container(
                height: 180,
                padding: const EdgeInsets.symmetric(
                  horizontal: 35,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      Colors.deepPurple,
                      Colors.purple
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 20,
                  children: [
                    Text(
                      "KYC Pending",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "You need to provide the required\ndocuments for your account activation.",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Click Here",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  iconImage(
                    icons: Icon(
                      Icons.smartphone,
                      color: Colors.white,
                    ),
                    text: "Mobile",
                    color1: Colors.deepPurpleAccent,
                    color2: Colors.purple[200],
                  ),
                  iconImage(
                    icons: Icon(
                      Icons.laptop,
                      color: Colors.white,
                    ),
                    text: "Laptop",
                    color1: Colors.green,
                    color2: Colors.greenAccent[200],
                  ),
                  iconImage(
                    icons: Icon(
                      Icons.photo_camera_rounded,
                      color: Colors.white,
                    ),
                    text: "Camera",
                    color1: Colors.pinkAccent,
                    color2: Colors.pink[200],
                  ),
                  iconImage(
                    icons: Icon(
                      Icons.lightbulb_outline,
                      color: Colors.white,
                    ),
                    text: "LED",
                    color1: Colors.orange,
                    color2: Colors.deepOrange[200],
                  ),
                ],
              ),
              Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.teal[100]!,
                      Colors.teal[300]!,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    spacing: 20,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("EXCLUSIVE FOR YOU"),
                          Icon(
                            Icons.arrow_forward_sharp,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 250,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: ExclusiveData().exclusiveData.length,
                          itemBuilder: (context, index) {
                            var data = ExclusiveData().exclusiveData;
                            return Container(
                              width: 230,
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              padding: EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 10,
                                    right: 0,
                                    child: Container(
                                      height: 30,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                          child: Padding(
                                        padding: const EdgeInsets.all(4),
                                        child: Text(
                                          "${data[index].offer} off",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      )),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 25),
                                    child: Column(
                                      children: [
                                        Image.network(data[index].icon),
                                        SizedBox(height: 10),
                                        Text(data[index].price),
                                        SizedBox(height: 5),
                                        Text(
                                          data[index].label,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Text(
            'Chat',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          icon: Icon(
            Icons.wechat_outlined,
            size: 30,
            color: Colors.white,
          ),
          backgroundColor: Colors.red,
        ));
  }
}

Column iconImage({
  required icons,
  required text,
  required color1,
  required color2,
}) {
  return Column(
    spacing: 5,
    children: [
      Container(
        height: 60,
        width: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          gradient: LinearGradient(
            colors: [
              color1,
              color2,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: icons,
      ),
      Text(text),
    ],
  );
}
