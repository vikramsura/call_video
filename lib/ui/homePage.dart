import 'package:flutter/material.dart';
import 'package:untitled2/allData/colorPage.dart';
import 'package:untitled2/allData/font_sizes.dart';
import 'package:untitled2/ui/videoCallPage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, String>> userData = [
    {
      "name": "Vikram",
      "phone": "7988971724",
      "image": "assets/IMG-20240330-WA0006.jpg"
    },
    {
      "name": "Naresh",
      "phone": "7988971724",
      "image": "assets/IMG-20240427-WA0006.jpg"
    },
    {"name": "Vikas", "phone": "7988971724", "image": "assets/DSC_6767.JPG"},
    {"name": "Dinesh", "phone": "7988971724", "image": "assets/IMG_4889.JPG"},
  ];
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
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: userData.length,
                  itemBuilder: (context, index) {
                    var item = userData[index];
                    return Column(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VideoCall(),
                                ));
                          },
                          contentPadding: EdgeInsets.all(AppFontSize.font10),
                          title: Text(item["name"].toString()),
                          leading: Container(
                            height: AppFontSize.font100,
                            width: AppFontSize.font50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        AssetImage(item["image"].toString()))),
                          ),
                          trailing: Text(item["phone"].toString()),
                        ),
                        Divider(thickness: 2)
                      ],
                    );
                  },
                ),
              )
            ],
          )
          // Column(
          //     children: [
          //   SizedBox(
          //     height: AppFontSize.font20,
          //   ),
          //   ElevatedButton.icon(
          //     onPressed: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => NewMeeting(),
          //           ));
          //     },
          //     icon: Icon(Icons.add,
          //         color: AppBodyColor.white, size: AppFontSize.font20),
          //     label: buildText("New Meeting", AppFontSize.font20,
          //         AppTextColor.white, FontWeight.bold),
          //     style: ElevatedButton.styleFrom(
          //         backgroundColor: AppBodyColor.deepPurple,
          //         fixedSize:
          //             Size(MediaQuery.of(context).size.width, AppFontSize.font50),
          //         shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(12))),
          //   ),
          //   SizedBox(
          //     height: AppFontSize.font20,
          //   ),
          //   Divider(thickness: 2),
          //   SizedBox(
          //     height: AppFontSize.font20,
          //   ),
          //   OutlinedButton.icon(
          //     onPressed: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => JoinWithCode(),
          //           ));
          //     },
          //     icon: Icon(Icons.margin,
          //         color: AppBodyColor.deepPurple, size: AppFontSize.font20),
          //     label: buildText("Join with a code", AppFontSize.font20,
          //         AppTextColor.deepPurple, FontWeight.bold),
          //     style: ElevatedButton.styleFrom(
          //         fixedSize:
          //             Size(MediaQuery.of(context).size.width, AppFontSize.font50),
          //         shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(12))),
          //   ),
          //   SizedBox(height: AppFontSize.font150),
          //   Image.network(
          //       "https://user-images.githubusercontent.com/67534990/127524449-fa11a8eb-473a-4443-962a-07a3e41c71c0.png")
          // ]),
          ),
    );
  }
}
