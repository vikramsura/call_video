import 'package:flutter/material.dart';
import 'package:untitled2/allData/allData.dart';
import 'package:untitled2/allData/colorPage.dart';
import 'package:untitled2/allData/font_sizes.dart';
import 'package:untitled2/ui/videoCallPage.dart';
class JoinWithCode extends StatefulWidget {
  JoinWithCode({Key? key}) : super(key: key);
  @override
  State<JoinWithCode> createState() => _JoinWithCodeState();
}

class _JoinWithCodeState extends State<JoinWithCode> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 12,
            right: 12,
            left: 12,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  child: Icon(Icons.arrow_back_ios_new_sharp, size: 35),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(height: AppFontSize.font60),
              Image.network(
                "https://user-images.githubusercontent.com/67534990/127776450-6c7a9470-d4e2-4780-ab10-143f5f86a26e.png",
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
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: controller,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsetsDirectional.all(20),
                      border: InputBorder.none,
                      hintText: "Example : abc-efg-dhi"),
                ),
              ),
              SizedBox(height: AppFontSize.font20),
              ElevatedButton.icon(
                onPressed: () {
                  //
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoCall(
                            channelName: controller.text.trim()),
                      ));
                },
                icon: Icon(Icons.add,
                    color: AppBodyColor.white, size: AppFontSize.font20),
                label: buildText("Join", AppFontSize.font20,
                    AppTextColor.white, FontWeight.bold),
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppBodyColor.deepPurple,
                    fixedSize: Size(MediaQuery.of(context).size.width / 2,
                        AppFontSize.font50),
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
