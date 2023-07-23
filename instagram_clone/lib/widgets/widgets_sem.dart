import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_clone/mainbody/mainpage.dart';

class sem extends StatefulWidget {
  final Container box1;
  final Container box2;
  final String text;

  const sem({
    Key? key,
    required this.text,
    required this.box1,
    required this.box2,

    // required this.callback,
  }) : super(key: key);

  @override
  State<sem> createState() => _semState();
}

class _semState extends State<sem> {
  int y = 0;
  var alpha = 0;
  static int x = 0;
  final PageController controller = PageController(initialPage: x);
  int pagechanged = 0;

  final List<String> catagories = [
    'Semester',
    'Practicals',
  ];

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => body()),
            result: (route) => false);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.blue,
            ),
            systemOverlayStyle: const SystemUiOverlayStyle(
              // Status bar color
              statusBarColor: Colors.transparent,

              // Status bar brightness (optional)
              statusBarIconBrightness:
                  Brightness.dark, // For Android (dark icons)
              statusBarBrightness: Brightness.light, // For iOS (dark icons)
            ),
            title: Text(
              widget.text,
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.5,
                fontSize: 22,
              ),
            ),
            elevation: 0.0,
            // titleSpacing: 160,
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 65,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          print('1st container');
                          print(pagechanged);
                          if (pagechanged == alpha) {
                            y = 0;
                            controller.animateToPage(0,
                                duration: Duration(milliseconds: 150),
                                curve: Curves.easeInOut);
                          } else {
                            y = 1;
                          }
                        });
                      },
                      child: Container(
                        child: Text(
                          'Semester',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: y == 0 ? Colors.blue : Colors.black,
                              fontSize: 20,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          print('2nd container');
                          print(y);
                          if (pagechanged == alpha) {
                            y = 1;
                            controller.animateToPage(1,
                                duration: const Duration(milliseconds: 150),
                                curve: Curves.easeInOut);
                          } else {
                            y = 0;
                          }
                        });
                      },
                      child: Text(
                        'Practical',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: y == 1 ? Colors.blue : Colors.black,
                            fontSize: 20,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: PageView(
              onPageChanged: (index) {
                setState(() {
                  pagechanged = index;
                  alpha = index;
                  y = alpha;
                });
              },
              controller: controller,
              children: [
                widget.box1,
                widget.box2,
              ],
            ))
          ],
        ),
      ),
    );
  }
}
