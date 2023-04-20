import 'package:emart_app/consts/consts.dart';
import 'package:flutter/cupertino.dart';

Widget detailsCard({width, String? count, String? title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      title!.text.fontFamily(bold).color(whiteColor).size(16).make(),
      5.heightBox,
      title.text.color(whiteColor).make(),
    ],
  )
      .box
      .black
      .rounded
      .height(80)
      .width(width)
      .padding(const EdgeInsets.all(4))
      .make();
}
