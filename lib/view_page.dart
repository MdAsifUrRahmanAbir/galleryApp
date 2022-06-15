import 'package:flutter/material.dart';
import 'package:gallery_app/Model.dart';

class ViewPage extends StatelessWidget {
   ViewPage({Key? key, required this.model}) : super(key: key);
  Model? model;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.network('${model?.downloadUrl}',fit: BoxFit.contain,),
            Positioned(
              top: 10,
                left: 1,
                right: 1,
                child: Text("${model!.author}",textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 25),)
            )
          ],
        ),
      ),
    );
  }
}
