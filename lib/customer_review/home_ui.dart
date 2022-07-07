// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_application_review/customer_review/review_ui.dart';

import 'package:flutter_svg/svg.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final ScrollController _scrollController = ScrollController();
  _scrollToBottom() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 25), curve: Curves.linear);
  }

  List<String> images = [
    "https://cdn.pixabay.com/photo/2015/02/02/15/28/bar-621033_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/03/26/13/09/workspace-1280538_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/04/04/14/12/monitor-1307227_960_720.jpg",
  ];

  // ignore: prefer_typing_uninitialized_variables
  var pageController;
  int activePage = 1;
  String dropdownValue = 'One';

  @override
  void initState() {
    super.initState();
    late PageController pageController;
    pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    String val = '''
BUNCH OF TEXT HERE.
''';
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                topImage(),
                topContent(),
                mainContent(),
                offerCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget topImage() {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: PageView.builder(
              itemCount: images.length,
              pageSnapping: true,
              controller: pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                return SizedBox(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    child: Image.network(
                      images[pagePosition],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
        ),
        Positioned(
          left: 7.0,
          top: 7.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Container(
                alignment: Alignment.center,
                height: 37,
                width: 37,
                decoration: const BoxDecoration(color: Colors.white),
                child: const Icon(
                  Icons.arrow_back_rounded,
                  semanticLabel: 'true',
                  color: Colors.pink,
                  size: 23,
                )),
          ),
        ),
        Positioned(
            bottom: 4.0,
            right: 150.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: indicators(
                images.length,
                activePage,
              ),
            )),
      ],
    );
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (
      index,
    ) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.pink : Colors.white,
            shape: BoxShape.circle),
      );
    });
  }

  Widget topContent() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          const Text(
            '50% off for  personal\ntraining session, group\ntraining session and\ngroup fitness classes',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'By Smart Gym',
            style: TextStyle(
                color: Color(0xfffd2b9b),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/images/location-dot.svg',
                height: 20,
                width: 20,
              ),
              const Text(
                "  131/4 pointpedro road nallur jaffna srilanka",
                style: TextStyle(
                    // fontSize: 20,
                    ),
                maxLines: 2,
              ),
            ],
          ),
          Row(
            children: const [
              SizedBox(
                width: 20,
              ),
              Text("srilanka"),
              Text(
                'View map',
                style: TextStyle(color: Colors.pink),
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              const Text(' 4.3 excelent (120) '),
              const SizedBox(
                width: 4,
              ),
              SvgPicture.asset(
                'assets/images/dot.svg',
                color: Colors.black,
                height: 7.0,
                width: 7.0,
                allowDrawingOutsideViewBox: true,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text("0.3 milestone")
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          discountCard(),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: const [
              Icon(Icons.calendar_month_outlined),
              SizedBox(
                width: 8,
              ),
              Text(
                'only 6 days left. Harry up!',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: const [
              Icon(Icons.cancel_outlined),
              SizedBox(
                width: 8,
              ),
              Text(
                'New offers! Claim now and save',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: const [
              SizedBox(
                width: 30,
              ),
              Text(
                "money,",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          )
        ]);
  }

  Widget discountCard() {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: const Color(0xfff3f3f3),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Center(
                          child: Center(
                              child: SizedBox(
                        height: 150,
                        width: 200,
                        child: CustomPaint(
                          painter: PriceTagPaint(),
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(32, 12, 12, 12),
                            child: Text(
                              "50% off *",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ))),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      SizedBox(
                        width: 8.0,
                      ),
                      Icon(
                        Icons.euro,
                        size: 16,
                      ),
                      Text("10.00",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.lineThrough)),
                      SizedBox(
                        width: 10.0,
                      ),
                      Icon(
                        Icons.euro,
                        size: 15,
                      ),
                      Text(
                        "8.00",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ]),
          ),
        ),
      ],
    );
  }

  Widget mainContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 12,
        ),
        const Text(
            'A book review is a description and critical appraisal\nof a books content. It is a type of essay. Since book \nreviews are essentially personal opinions reflecting\nviews of the review. A review can be'),
        const SizedBox(
          height: 12,
        ),
        const Text(
          'About this offer',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SvgPicture.asset(
              'assets/images/dot.svg',
              color: Colors.black,
              height: 8.0,
              width: 8.0,
              allowDrawingOutsideViewBox: true,
            ),
            const SizedBox(
              width: 4,
            ),
            const Text(" what's included"),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 10, 12, 15),
          child: Column(children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/images/dot.svg',
                  color: Colors.black,
                  height: 8.0,
                  width: 8.0,
                  allowDrawingOutsideViewBox: true,
                ),
                const SizedBox(
                  width: 4,
                ),
                const Text(" what is included"),
              ],
            ),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/images/dot.svg',
                  color: Colors.black,
                  height: 8.0,
                  width: 8.0,
                  allowDrawingOutsideViewBox: true,
                ),
                const SizedBox(
                  width: 4,
                ),
                const Text(" what is included"),
              ],
            ),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/images/dot.svg',
                  color: Colors.black,
                  height: 8.0,
                  width: 8.0,
                  allowDrawingOutsideViewBox: true,
                ),
                const SizedBox(
                  width: 4,
                ),
                const Text(" what is included"),
              ],
            ),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/images/dot.svg',
                  color: Colors.black,
                  height: 8.0,
                  width: 8.0,
                  allowDrawingOutsideViewBox: true,
                ),
                const SizedBox(
                  width: 4,
                ),
                const Text(" what is included"),
              ],
            ),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/images/dot.svg',
                  color: Colors.black,
                  height: 8.0,
                  width: 8.0,
                  allowDrawingOutsideViewBox: true,
                ),
                const SizedBox(
                  width: 4,
                ),
                const Text(" what is included"),
              ],
            ),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/images/dot.svg',
                  color: Colors.black,
                  height: 8.0,
                  width: 8.0,
                  allowDrawingOutsideViewBox: true,
                ),
                const SizedBox(
                  width: 4,
                ),
                const Text(" what is included"),
              ],
            ),
          ]),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SvgPicture.asset(
                'assets/images/dot.svg',
                color: Colors.black,
                height: 8.0,
                width: 8.0,
                allowDrawingOutsideViewBox: true,
              ),
            ),
            const SizedBox(
              width: 300,
              child: Text(
                " what is included paragraph is a series of sentences that are organized and coherent, and are all.",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16, top: 10, bottom: 10),
          child: Text("check put our website for more details "),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 14),
          child: InkWell(
              child: const Text(
                "https://www.google.com/",
                style: TextStyle(
                    color: Color(0xfffd2b9b),
                    decoration: TextDecoration.underline),
              ),
              onTap: () => ('https://www.google.com/')),
        ),
        const Text(
          "This offer is avalable for  redemption only on selected date and time",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget offerCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsetsDirectional.all(8),
          height: 40,
          // color: Colors.blue,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.blueAccent)),
          width: MediaQuery.of(context).size.width,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "select dat and time",
                ),
                InkWell(
                    child: Icon(Icons.arrow_forward_ios_outlined,
                        color: Color(0xfffd2b9b)))
              ]),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Customer review for this page",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration:
              BoxDecoration(border: Border.all(color: Colors.blueAccent)),
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.message_outlined),
                  SizedBox(
                    width: 5,
                  ),
                  Text('See All Review'),
                ],
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const customerReviewUI()),
                    );
                  },
                  child: const Icon(Icons.arrow_forward_ios,
                      color: Color(0xfffd2b9b))),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                color: const Color(0xfff3f3f3),
                // decoration:
                //     BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "Share this for your friends",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                      Container(
                        // height: 40,
                        // width: 80,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.white,
                            border: Border.all(
                              color: const Color(0xfffd2b9b),
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                                width: MediaQuery.of(context).size.width,
                                height: 20,
                                // fit: BoxFit.fill,
                                "assets/images/share-solid.svg",
                                color: const Color(0xfffd2b9b)),
                            const SizedBox(
                              width: 8.0,
                            ),
                            const Text(
                              "share",
                              style: TextStyle(color: Color(0xfffd2b9b)),
                            )
                          ],
                        ),
                      )
                    ]),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          color: const Color(0xfffd2b9b),
          // decoration:
          //     BoxDecoration(border: Border.all(color: Colors.blueAccent)),
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: TextButton(
              onPressed: () {},
              child: const Text(
                'clam right now ',
                style: TextStyle(color: Colors.white),
              )),
        ),
      ],
    );
  }
}

class PriceTagPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    Path path = Path();

    path
      ..moveTo(0, 45)
      ..lineTo(160, 45)
      ..lineTo(185, 22.5)
      ..lineTo(160, 0)
      ..lineTo(0, 0)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class MyCustomTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 50, size.height * .1);
    path.lineTo(50, 20);

    path.close();
    return path;
  }

  @override
  // ignore: avoid_renaming_method_parameters
  bool shouldReclip(CustomClipper old) {
    return old != this;
  }
}
