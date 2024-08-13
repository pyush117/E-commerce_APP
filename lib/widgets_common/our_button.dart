import 'package:e_commerce/consts/consts.dart';

Widget ourBuutton({onPress,color,textColor,String? title}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: color,
      padding: EdgeInsets.all(12),
    ),
    onPressed:onPress,
    child: title!.text.color(textColor).fontFamily(bold).make(),
  );
}
