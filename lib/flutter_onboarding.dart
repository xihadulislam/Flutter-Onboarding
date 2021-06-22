library flutter_onboarding;

import 'package:flutter/material.dart';
import 'package:flutter_onboarding/size_config.dart';

import 'constant.dart';
import 'on_board_page.dart';

class OnBoardingScreen extends StatefulWidget {
  final List<OnBoardPage> list;
  final MaterialPageRoute pageRoute;
  final Text getStartedText;
  final Color getStartedColor;

  OnBoardingScreen(
      {@required this.list,
        @required this.pageRoute,
        this.getStartedText,
        this.getStartedColor});

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentPage = 0;

  PageController _pageController = new PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width,
                  child: GestureDetector(
                      onTap: () {
                        _pageController.jumpToPage(widget.list.length - 1);
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(fontWeight: FontWeight.w800),
                      )),
                ),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    children: widget.list,
                    onPageChanged: (value) => {setCurrentPage(value)},
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                          widget.list.length, (index) => getIndicator(index))),
                ),
                SizedBox(height: 30),
              ],
            ),
            currentPage == widget.list.length - 1
                ? Positioned(
                bottom: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, widget.pageRoute),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0)),
                            color: widget.getStartedColor ?? orange),
                        width: 140,
                        height: 50,
                        child: Center(
                            child: widget.getStartedText ??
                                Text(
                                  "Get Started",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16),
                                ))),
                  ),
                ))
                : Container()
          ],
        ),
      ),
    );
  }

  setCurrentPage(int value) {
    currentPage = value;
    setState(() {});
  }

  AnimatedContainer getIndicator(int pageNo) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 100),
        height: 8,
        width: (currentPage == pageNo) ? 30 : 8,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: (currentPage == pageNo) ? widget.getStartedColor??orange : Colors.grey));
  }

  void changePage() {
    print(currentPage);
    if (currentPage == widget.list.length - 1) {
      setState(() {});
    } else {
      _pageController.animateToPage(currentPage + 1,
          duration: Duration(milliseconds: 300), curve: Curves.linear);
    }
  }
}

