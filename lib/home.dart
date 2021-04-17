import 'package:flutter/material.dart';
import 'package:travell_app/colors.dart';
import 'package:travell_app/constant.dart';
import 'package:travell_app/destinationDetail.dart';
import 'package:travell_app/style.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: Container(
          width: MediaQuery.of(context).size.width - 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColor.darkSecondaryColor,
                AppColor.lightTertiaryColor,
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white38,
                    size: 40,
                  ),
                  onPressed: null),
              IconButton(
                  icon: Icon(
                    Icons.place,
                    color: AppColor.primaryColor,
                    size: 40,
                  ),
                  onPressed: null),
              IconButton(
                  icon: Icon(
                    Icons.person,
                    color: Colors.white38,
                    size: 40,
                  ),
                  onPressed: null),
            ],
          )),
           floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColor.secondaryColor,
              AppColor.tertiaryColor,
            ],
          ),
        ),
        child: ListView(
          children: [
            customAppBar(),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: destination.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 30 : 0),
                  child: destinationCard(context, destination[index]['imagePath']),
                )
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 25, right: 25, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PrimaryText(
                      text: 'Hot Destination',
                      size: 24,
                     ),
                  PrimaryText(
                      text: 'More',
                      size: 16,
                      color: Colors.white24),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hotDestination.length,
                itemBuilder: (context, index) => 
                  Padding(
                    padding: EdgeInsets.only(left: index  == 0 ? 30: 0),
                    child: hotDestinationCard(hotDestination[index]['imagePath'], hotDestination[index]['placeName'], hotDestination[index]['placeCount'], context ),
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 25, right: 25, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PrimaryText(
                      text: 'Visiter Reviews',
                      size: 20,
                      ),
                  PrimaryText(
                      text: '22 Reviews',
                      size: 14,
                      color: Colors.white24),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 0, left: 25, right: 25, bottom: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        image: AssetImage('assets/man.jpeg'),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PrimaryText(
                                text: 'Arjun Unni',
                                size: 16,
                                ),
                            PrimaryText(
                                text: 'Jan 25',
                                size: 10,
                                color: Colors.white24),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        PrimaryText(
                            text:
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries',
                            size: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.white38),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget hotDestinationCard(String imagePath, String placeName,
      String touristPlaceCount, BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DestinationDetail(imagePath)))
      },
      child: Stack(children: [
        Hero(
          tag: imagePath,
          child: Container(
            height: 200,
            width: 140,
            margin: EdgeInsets.only(right: 25),
            padding: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            height: 200,
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [AppColor.secondaryColor, Colors.transparent]),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PrimaryText(
                    text: placeName,
                    size: 15,
                    fontWeight: FontWeight.w800),
                SizedBox(height: 4),
                PrimaryText(
                    text: touristPlaceCount,
                    color: Colors.white54,
                    size: 10,
                    fontWeight: FontWeight.w800)
              ]),
        ),
      ]),
    );
  }

  Widget destinationCard(BuildContext context, String imagePath) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DestinationDetail(imagePath)))
      },
      child: Stack(
        children: [
          Container(
            height: 200,
            margin: EdgeInsets.only(right: 20),
            width: MediaQuery.of(context).size.width - 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Opacity(
              opacity: 1.0,
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width - 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [AppColor.secondaryColor, Colors.transparent],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding customAppBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PrimaryText(
              text: 'Destination',
              size: 32,
              fontWeight: FontWeight.w700,
              ),
          RawMaterialButton(
            constraints: BoxConstraints(minWidth: 0),
            onPressed: null,
            elevation: 2.0,
            fillColor: Colors.white10,
            padding: EdgeInsets.all(8),
            child: Icon(Icons.search_rounded,
                color: AppColor.primaryColor, size: 30),
            shape: CircleBorder(),
          )
        ],
      ),
    );
  }
}
