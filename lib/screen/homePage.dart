import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.link,
        foregroundColor: CupertinoColors.systemGroupedBackground,
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 60,
          width: 270,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: CupertinoColors.link,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.home,
                    size: 35,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10,),
                  Container(
                    height: 40,
                    child: VerticalDivider(
                      thickness: 1,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Icon(
                    Icons.home,
                    size: 35,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10,),
                  Container(
                    height: 40,
                    child: VerticalDivider(
                      thickness: 1,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Icon(
                    Icons.favorite,
                    size: 35,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10,),
                  Container(
                    height: 40,
                    child: VerticalDivider(
                      thickness: 1,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Icon(
                    Icons.person_add_alt_1_rounded,
                    size: 35,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){},
      //   backgroundColor: CupertinoColors.link,
      //   foregroundColor: CupertinoColors.systemGroupedBackground,
      //   child: Icon(Icons.person_add_alt_1),
      // ),
    );
  }
}
