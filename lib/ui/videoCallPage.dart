import 'dart:convert';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
//id  : 9280222aa4714481bf17a651c347b30d
// token  :https://agora-node-tokenserver.vikramsura35.repl.co/
// temptoken  :007eJxTYGBqiHeYl9HQY5bs96u71OGcwt+TD3ev/2/wv119wW6d/+8UGMwsLC1NjA0SzVOSEk2SDFMtExMNTY0MgQwj42QTsxTvwKTUhkBGBj/L74yMDBAI4rMwhKQWlzAwAACy4iCd
class VideoCall extends StatefulWidget {
  String ?channelName ;

  VideoCall({required this.channelName});
  @override
  _VideoCallState createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  late final AgoraClient _client;
  bool _loading = true;
  String? tempToken;

  @override
  void initState() {
    getToken();
    super.initState();
  }

  Future<void> getToken() async {
    String link =
        "https://agora-node-tokenserver.vikramsura35.repl.co/access_token?channelName=${widget.channelName}";

    Response _response = await get(Uri.parse(link));
    Map data = jsonDecode(_response.body);
    setState(() {
      tempToken = data["token"];
    });

    _client = AgoraClient(
        agoraConnectionData: AgoraConnectionData(
          appId: "6899430a7dba4b1e9aa15211e923c46d",
          tempToken: tempToken,
          channelName: widget.channelName.toString(),
        ),
        enabledPermission: [Permission.camera, Permission.microphone]);

    await _client.initialize();

    Future.delayed(Duration(seconds: 1)).then((value) {
      setState(() {
        _loading=false;

      });
    },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _loading
            ? Center(
          child: CircularProgressIndicator(),
        )
            : Stack(
          children: [
            AgoraVideoViewer(
              client: _client,
              layoutType: Layout.floating,
              enableHostControls: true,
            ),

            AgoraVideoButtons(
                client: _client,
              autoHideButtons: true,
            )
          ],
        ),
      ),
    );
    ;
  }
}