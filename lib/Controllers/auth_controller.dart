
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoading=false.obs;
  // Text controllers
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  // login method
  Future<UserCredential?> loginMethod({context}) async {
       UserCredential ? userCredential;
    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  // signUp method
  Future<UserCredential?> signUpMethod({  email, password, context}) async {
    UserCredential? userCredential;
    try {

     userCredential=  await auth.createUserWithEmailAndPassword(
          email: email, password: password);

    }on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());

    }
    return userCredential;
  }

  // storing data method
  storeUserData({name, password, email}) async {
    DocumentReference store =
     await   firestore.collection(usersCollection).doc(currentUser!.uid);
    store.set({
      'name': name,
      'password': password,
      'id':currentUser!.uid,
      'email': email,
      'imageUrl': '',
      'cart_count':"00",
      'wishlist_count':"00",
      'order_count':"00",
    });
  }

  // signOut method
  signOutMethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
// SafeArea(
// child: Column(
// children: [
// // edit profile button
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: const Align(
// alignment: Alignment.topRight,
// child: Icon(
// Icons.edit,
// color: whiteColor,
// )).onTap(() {
// Get.to(()=>const EditProfileScreen());
// }),
// ),
// //users detail section
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 8.0),
// child: Row(
// children: [
// Image.asset(
// imgProfile2,
// width: 100,
// fit: BoxFit.cover,
// ).box.roundedFull.clip(Clip.antiAlias).make(),
// 10.widthBox,
// Expanded(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// "Dummy User".text.fontFamily(semibold).white.make(),
// "customer@example.com".text.white.make(),
// ],
// )),
// OutlinedButton(
// style: OutlinedButton.styleFrom(
// side: const BorderSide(
// color: whiteColor,
// )),
// onPressed: () async{
// await Get.put(AuthController()).signOutMethod(context);
// Get.offAll(()=>const LoginScreen());
// },
// child: logout.text.fontFamily(semibold).white.make()),
// ],
// ),
// ),
// 20.heightBox,
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// detailsCard(
// count: "00",
// title: "in your cart",
// width: context.screenWidth / 3.4),
// detailsCard(
// count: "32",
// title: "in your wishlist",
// width: context.screenWidth / 3.4),
// detailsCard(
// count: "675",
// title: "your orders",
// width: context.screenWidth / 3.4),
// ],
// ),
// //buttons section
//
// ListView.separated(
// shrinkWrap: true,
// itemBuilder: (BuildContext context, int index) {
// return ListTile(
// title: "${profileButtonsList[index]}"
//     .text
//     .fontFamily(semibold)
//     .color(darkFontGrey)
//     .make(),
// leading: Image.asset(
// profileButtonsIcon[index],
// width: 22,
// ),
// );
// },
// separatorBuilder: (context, index) {
// return const Divider(
// color: lightGrey,
// );
// },
// itemCount: profileButtonsList.length)
//     .box
//     .white
//     .rounded
//     .margin(EdgeInsets.all(12))
//     .padding(const EdgeInsets.symmetric(horizontal: 16))
//     .shadowSm
//     .make()
//     .box
//     .color(redColor)
//     .make()
// ],
// ),
// ),
