import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

class VideoCall extends StatefulWidget {
  const VideoCall({super.key});
  @override
  State<VideoCall> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  late AgoraClient _client;
  bool _loading = true;
  String appId = "6899430a7dba4b1e9aa15211e923c46d";
  String tempToken =
      "007eJxTYOC2MEtJS7u460xC6Xl/3xWtT65XH/XW1+OwONP+4fUazS0KDGYWlpYmxgaJ5ilJiSZJhqmWiYmGpkaGQIaRcbKJWcpCV/20hkBGhntWvYyMDBAI4rMwlKRWlDAwAABHvh9l";
  String channelName = "text";

  // Future<void> getToken() async {
  //   try {
  //     String link =
  //         "https://ba2dda7a-aad9-4e5c-85bc-764c0f035063-00-qcnbfzjs2d8b.pike.replit.dev/access_token?channelName=${widget.channelName}";
  //
  //     Response response = await get(Uri.parse(link));
  //     print(" link......$link");
  //     print("_response.statusCode......${response.statusCode}");
  //     print("response.body.....${response.body}");
  //
  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body);
  //       print("Parsed JSON data: $data");
  //
  //     } else {
  //       print("Failed to fetch token. Status code: ${response.statusCode}");
  //     }
  //   } catch (e) {
  //     print("error.....$e");
  //   }
  // }
  agoraClient() async {
    _client = AgoraClient(
        agoraConnectionData: AgoraConnectionData(
          appId: appId,
          tempToken: tempToken,
          tempRtmToken: tempToken,
          channelName: channelName,
          rtmChannelName: channelName,
          rtmEnabled: true,
        ),
        enabledPermission: [Permission.camera, Permission.microphone]);
    await _client.initialize();

    Future.delayed(const Duration(seconds: 1)).then(
      (value) {
        setState(() {
          _loading = false;
        });
      },
    );
  }

  @override
  void initState() {
    agoraClient();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  AgoraVideoViewer(
                    client: _client,
                    layoutType: Layout.floating,
                    enableHostControls: true,
                    showAVState: true,
                    showNumberOfUsers: true,
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
