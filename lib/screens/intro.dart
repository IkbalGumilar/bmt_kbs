import 'package:bmt_kbs/models/slider_model.dart';
import 'package:bmt_kbs/screens/home.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<SliderModel> slides = List<SliderModel>.empty(growable: true);
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);
    slides = getSlides()!;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount: slides.length,
              itemBuilder: (context, index) {
                return Slider(
                  image: slides[index].getImage(),
                  title: slides[index].getTitle(),
                  description: slides[index].getDescriptiion(),
                );
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                slides.length,
                (index) => buildDot(index, context),
              ),
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.all(40),
            width: double.infinity,
            color: Colors.green,
            child: ElevatedButton(
              child:
                  Text(currentIndex == slides.length - 1 ? "Continue" : "Next"),
              onPressed: () {
                if (currentIndex == slides.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                }
                _controller.nextPage(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.bounceIn);
              },
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

// container created for dots
  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.green,
      ),
    );
  }
}

// ignore: must_be_immutable
// slider declared
class Slider extends StatelessWidget {
  String image;
  String title;
  String description;

  Slider({required this.image, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // contains container
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // image given in slider
            Image(image: AssetImage(image)),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
