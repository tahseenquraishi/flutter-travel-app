import 'package:flutter/material.dart';
import 'package:travell_app/colors.dart';
import 'package:travell_app/style.dart';

class DestinationDetail extends StatefulWidget {
  final String imagePath;
  const DestinationDetail(this.imagePath);

  @override
  _DestinationDetailState createState() => _DestinationDetailState();
}

class _DestinationDetailState extends State<DestinationDetail>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return DestinationPage(
      controller: _controller,
      imagePath: widget.imagePath,
    );
  }
}

class DestinationPage extends StatelessWidget {
  final imagePath;
  DestinationPage(
      {Key key, @required AnimationController controller, this.imagePath})
      : animation = DestinationPageEnterAnimation(controller),
        super(key: key);
  final DestinationPageEnterAnimation animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation.controller,
      builder: (context, child) => _buildAnimation(context),
    );
  }

  Hero _buildAnimation(BuildContext context) {
    return Hero(
      tag: imagePath,
      child: Scaffold(
          floatingActionButton: ButtonTheme(
            minWidth: MediaQuery.of(context).size.width - 60,
            height: 56,
            child: RaisedButton(
                onPressed: () => {},
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)),
                color: AppColor.lightSecondary,
                child: PrimaryText(
                    text: 'Select location',
                    size: 20,
                    )),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: ListView(
            children: [
              Container(
                padding: EdgeInsets.only(top: 30),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () => {Navigator.pop(context)},
                          icon: Icon(
                            Icons.chevron_left,
                            color: Colors.white70,
                            size: 40,
                          ),
                        ),
                        RawMaterialButton(
                          onPressed: null,
                          shape: CircleBorder(),
                          child: Image.asset(
                            'assets/info.png',
                            width: 4,
                          ),
                          fillColor: Colors.white30,
                          padding: EdgeInsets.all(8),
                        )
                      ],
                    ),
                    Container(
                      // height: MediaQuery.of(context).size.height - 350,
                      height: animation.barHeight.value,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 30, left: 30, right: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PrimaryText(
                                  text: 'America',
                                  size: 24),
                              SizedBox(height: 10),
                              PrimaryText(
                                  text:
                                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.',
                                  size: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white38),
                              SizedBox(height: 30),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  PrimaryText(
                                      text: 'Tourist Places',
                                      size: 20,
                                      fontWeight: FontWeight.w600,
                                      ),
                                  PrimaryText(
                                      text: '18',
                                      size: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white24),
                                ],
                              ),
                              SizedBox(height: 20),
                              SizedBox(
                                height: 160,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    hotDestinationCard('assets/bridge.jpg',
                                        'AMERICA', '18 Tourist Place', context),
                                    hotDestinationCard('assets/japan-home.jpg',
                                        'JAPAN', '18 Tourist Place', context),
                                    hotDestinationCard('assets/city.jpg',
                                        'NEWYORK', '18 Tourist Place', context),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Widget hotDestinationCard(String imagePath, String placeName,
      String touristPlaceCount, BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DestinationDetail(imagePath)))
      },
      child: Stack(children: [
        Container(
          height: 160,
          width: 160,
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
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [AppColor.secondaryColor, Colors.transparent]),
            ),
          ),
        ),
      ]),
    );
  }
}

class DestinationPageEnterAnimation {
  DestinationPageEnterAnimation(this.controller)
       : barHeight = Tween<double>(begin: 0, end: 600).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0, 0.5),
          ),
        );

  final AnimationController controller;
  final Animation<double> barHeight;
}
