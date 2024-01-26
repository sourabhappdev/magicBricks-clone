
import 'package:flutter/material.dart';
import 'package:magic_bricks/Constants/Constants.dart';



class PostAd_Screen extends StatefulWidget {
  const PostAd_Screen({super.key});

  @override
  State<PostAd_Screen> createState() => _PostAd_ScreenState();
}

class _PostAd_ScreenState extends State<PostAd_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstantsColor.materialButtonColor,
        centerTitle: true,
        title: Text("Post Porperty",style: TextStyle(color: Colors.white),),
      ),
      
    );
  }
}
