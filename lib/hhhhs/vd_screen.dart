import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:skin_care_255/main.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VdScreen extends StatefulWidget {
  const VdScreen({super.key, required this.url});
  final String url;

  @override
  State<VdScreen> createState() => _VdScreenState();
}

class _VdScreenState extends State<VdScreen> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(widget.url);
    controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        showLiveFullscreenButton: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text('Video'),
        titleTextStyle: TextStyle(
          fontFamily: family,
          fontSize: 28.h,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.r),
            child: InkWell(
              onTap: () {
                Share.share(widget.url);
              },
              child: const Icon(
                Icons.ios_share,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: YoutubePlayer(
          controller: controller,
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }
}
