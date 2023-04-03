import 'package:flutter/material.dart';

import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
//import widgetsstyles
import 'package:cursis/screens/widgets/line_widgets.dart';
import 'package:cursis/screens/widgets/text_style.dart';

class Curs_page extends StatefulWidget {
  const Curs_page({
    Key? key,
  }) : super(key: key);
  @override
  _Curs_pageState createState() => _Curs_pageState();
}

class _Curs_pageState extends State<Curs_page> {
  late VideoPlayerController controller;
  ChewieController? chewieController;
  String text_test =
      'The famous lorem ipsum dolor passage is not Latin at all. As explained by a site dedicated to the passage, its actually quite historic: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. As for an explanation of why: It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using "Content here, content here", making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for "lorem ipsum" will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).';

  Future<void> loadVideoPlayer() async {
    controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
    await Future.wait([controller.initialize()]);
    chewieController = ChewieController(
      videoPlayerController: controller,
      autoPlay: false,
      looping: false,
    );
  }

  @override
  void initState() {
    super.initState();
    loadVideoPlayer();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    chewieController!.dispose();
  }

  Widget build_video_str(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: chewieController != null &&
                    chewieController!.videoPlayerController.value.isInitialized
                ? Chewie(controller: chewieController!)
                : const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text('Loading'),
                      ]),
          ),
        ),
      ],
    );
  }

  Widget start_splash(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
      ),
      body: ListView(
        children: [
          build_video_str(context),
          line(context),
          Center(
            child: text_style2(context, "TestPage"),
          ),
          Padding(
            padding: EdgeInsets.all(11),
            child: text_style(context, text_test),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: row_Buton__widgets(context),
          ),
        ],
      ),
    );
  }

  Widget row_Buton__widgets(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        button_style_rigth(context),
      ],
    );
  }

  Widget button_style_rigth(BuildContext context) {
    return Container(
      width: 300,
      child: OutlinedButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return start_splash(context);
  }
}
