

import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/widgets_common/our_button.dart';
import 'package:flutter/services.dart';

Widget exitDialog(context){
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisSize:MainAxisSize.min ,
      children: [
        "Confirm".text.fontFamily(bold).size(18).color(darkFontGrey).make(),
        Divider(),
        10.heightBox,
        "Are you sure you want to exit?".text.size(16).color(darkFontGrey).make(),
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ourBuutton(color: redColor,onPress: (){
              SystemNavigator.pop();
            },textColor: whiteColor,title: "yes"),
            ourBuutton(color: redColor,onPress: (){
              Navigator.pop(context);
            },textColor: whiteColor,title: "No"),
          ],
        )
      ],
    ).box.color(lightGrey).padding(EdgeInsets.all(12)).roundedSM.make(),
  );
}