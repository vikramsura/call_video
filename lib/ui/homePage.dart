import 'package:flutter/material.dart';
import 'package:untitled2/allData/colorPage.dart';
import 'package:untitled2/allData/font_sizes.dart';
import 'package:untitled2/ui/joinWithCode.dart';
import 'package:untitled2/ui/newMeeting.dart';

import '../allData/allData.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    deviceHeight(MediaQuery.of(context).size.height);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Video Call"),
        backgroundColor: AppBodyColor.blue,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 12, right: 12, top: 12),
        child: Column(children: [
          SizedBox(
            height: AppFontSize.font20,
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewMeeting(),
                  ));
            },
            icon: Icon(Icons.add,
                color: AppBodyColor.white, size: AppFontSize.font20),
            label: buildText("New Meeting", AppFontSize.font20,
                AppTextColor.white, FontWeight.bold),
            style: ElevatedButton.styleFrom(
                backgroundColor: AppBodyColor.deepPurple,
                fixedSize:
                    Size(MediaQuery.of(context).size.width, AppFontSize.font50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
          ),
          SizedBox(
            height: AppFontSize.font20,
          ),
          Divider(thickness: 2),
          SizedBox(
            height: AppFontSize.font20,
          ),
          OutlinedButton.icon(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JoinWithCode(),
                  ));
            },
            icon: Icon(Icons.margin,
                color: AppBodyColor.deepPurple, size: AppFontSize.font20),
            label: buildText("Join with a code", AppFontSize.font20,
                AppTextColor.deepPurple, FontWeight.bold),
            style: ElevatedButton.styleFrom(
                fixedSize:
                    Size(MediaQuery.of(context).size.width, AppFontSize.font50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
          ),
          SizedBox(height: AppFontSize.font150),
          Image.network(
              "https://user-images.githubusercontent.com/67534990/127524449-fa11a8eb-473a-4443-962a-07a3e41c71c0.png")
        ]),
      ),
    );
  }
}
