import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:untitled2/allData/allData.dart';
import 'package:untitled2/allData/font_sizes.dart';
import 'package:untitled2/ui/videoCallPage.dart';
import 'package:uuid/uuid.dart';

import '../allData/colorPage.dart';

class NewMeeting extends StatefulWidget {
  NewMeeting({Key? key}) : super(key: key);

  @override
  _NewMeetingState createState() => _NewMeetingState();
}

class _NewMeetingState extends State<NewMeeting> {
  String _meetingCode = "abcdfg";

  @override
  void initState() {
    var uuid = Uuid();
    _meetingCode = uuid.v1().substring(0,6);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 12,right: 12,top: 12),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  child: Icon(Icons.arrow_back_ios_new_sharp, size: 35),
                  onTap:() {
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(height: AppFontSize.font60),
              Image.network(
                "https://user-images.githubusercontent.com/67534990/127776392-8ef4de2d-2fd8-4b5a-b98b-ea343b19c03e.png",
                fit: BoxFit.cover,
                height: AppFontSize.font100,
              ),
              SizedBox(height: AppFontSize.font20),
              buildText("Enter meeting code below", AppFontSize.font16,
                  AppTextColor.black, FontWeight.bold),
              SizedBox(height: AppFontSize.font20),
              Card(
                  color: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.link),
                    title: SelectableText(
                      _meetingCode,
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    trailing: Icon(Icons.copy),
                  )),
              Divider(thickness: 1, height: 40, indent: 20, endIndent: 20),
              ElevatedButton.icon(
                onPressed: () {
                  Share.share("Meeting Code : $_meetingCode");

                },
                icon: Icon(Icons.arrow_drop_down,
                    color: AppBodyColor.white, size: AppFontSize.font20),
                label: buildText("Share invite", AppFontSize.font20,
                    AppTextColor.white, FontWeight.bold),
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppBodyColor.deepPurple,
                    fixedSize: Size(
                        MediaQuery.of(context).size.width/2, AppFontSize.font50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
              SizedBox(height: AppFontSize.font20),

              OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoCall(channelName: _meetingCode.trim()),
                      ));
                },
                icon: Icon(Icons.video_call,
                    color: AppBodyColor.deepPurple, size: AppFontSize.font20),
                label: buildText("start call", AppFontSize.font20,
                    AppTextColor.deepPurple, FontWeight.bold),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                        MediaQuery.of(context).size.width, AppFontSize.font50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}