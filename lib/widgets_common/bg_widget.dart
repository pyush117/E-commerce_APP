import 'package:e_commerce/consts/consts.dart';

Widget bgWidget({Widget? child}) {
  return Container(
    decoration: const BoxDecoration(
      image:
          DecorationImage(image: AssetImage(imgBackground), fit: BoxFit.fill),
    ),
    child: child,
  );
}
// Container(
// padding: EdgeInsets.all(12),
// child: Column(
// children: [
// SingleChildScrollView(
// physics: const BouncingScrollPhysics(),
// scrollDirection: Axis.horizontal,
// child: Row(
// children: List.generate(
// 6,
// (index) => "Baby Clothing"
//     .text
//     .size(12)
//     .fontFamily(semibold)
//     .color(darkFontGrey)
//     .makeCentered()
//     .box
//     .white
//     .rounded
//     .size(120, 60)
//     .margin(const EdgeInsets.symmetric(horizontal: 4))
//     .make())),
// ),
// // items container
// 20.heightBox,
// Expanded(
// child: GridView.builder(
// physics: BouncingScrollPhysics(),
// shrinkWrap: true,
// itemCount: 6,
// gridDelegate:
// const SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,
// mainAxisExtent: 250,
// mainAxisSpacing: 8,
// crossAxisSpacing: 8),
// itemBuilder: (context, index) {
// return Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Image.asset(
// imgP5,
// height: 150,
// width: 200,
// fit: BoxFit.cover,
// ),
// "Laptop 4GB/64GB"
//     .text
//     .fontFamily(semibold)
//     .color(darkFontGrey)
//     .make(),
// 10.heightBox,
// "\$600"
//     .text
//     .color(redColor)
//     .fontFamily(bold)
//     .size(16)
//     .make()
// ],
// )
//     .box
//     .white
//     .margin(const EdgeInsets.symmetric(horizontal: 4))
//     .roundedSM
//     .outerShadowSm
//     .padding(const EdgeInsets.all(12))
//     .make()
//     .onTap(() {
// Get.to(() => const ItemDetails(
// title: "Dummy Title",
// ));
// });
// }))
// ],
// ),
// ),
