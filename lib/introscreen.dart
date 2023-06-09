import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_daily_work/Home_Page.dart';
import 'package:the_daily_work/Options.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List onBoardingData = [
    {
      "image": 'assets/images/jobsearch.png',
      "title": 'Job Search By Loaction',
      "description": 'Find jobs in major States/Cities in India on '
    },
    {
      "image": 'assets/images/jobpostingg.png',
      "title": 'Free Job Posting',
      "description": 'The simplest way to post your jobs. '
    },
    {
      "image": 'assets/images/resumem.png',
      "title": 'Create Free Resume',
      "description": 'Make a Job winning resume with our simple resume maker.'
    },
  ];
  Color background = Colors.blue;
  Color TextColor = Colors.white;

  ContinueMethod() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Options()),
        (Route<dynamic> route) => false);
  }

  int currentPage = 0;
  onChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  //Controller to keep track of which page we're on
  final PageController pagecontroller = PageController();
  //Keep track of if we are on the last page or not
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: ContinueMethod,
            child: Text(
              'Skip',
              style: TextStyle(color: TextColor),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: pagecontroller,
            itemCount: onBoardingData.length,
            onPageChanged: onChanged,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.asset(onBoardingData[index]['image']),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      onBoardingData[index]['title'],
                      style: TextStyle(fontSize: 20, color: TextColor),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Center(
                      child: Text(
                        onBoardingData[index]['description'],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15, color: TextColor),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                (currentPage == (onBoardingData.length - 1))
                    ? ElevatedButton(
                        onPressed: ContinueMethod,
                        child: const Text('Continue'),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List<Widget>.generate(onBoardingData.length,
                            (index) {
                          return AnimatedContainer(
                            duration: const Duration(
                              milliseconds: 200,
                            ),
                            height: 10,
                            width: (index == currentPage) ? 15 : 10,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: (index == currentPage)
                                  ? Colors.white
                                  : Color.fromARGB(255, 201, 201, 223),
                            ),
                          );
                        }),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
