
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../Controllers/auth_controller.dart';
import '../../Controllers/profile_controller.dart';
import '../../consts/colors.dart';
import '../../consts/firebase_conts.dart';
import '../../consts/images.dart';
import '../../consts/lists.dart';
import '../../consts/loading_indicator.dart';
import '../../consts/strings.dart';
import '../../consts/styles.dart';
import '../../services/firestore_services.dart';
import '../../widgets_common/bg_widget.dart';
import '../auth_screen/login_screen.dart';
import '../chat_screen/messaging_screen.dart';
import '../orders_screen/orders_screen.dart';
import '../wishlist_screen/wishlist_screen.dart';
import 'components/details_card.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return bgWidget(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: StreamBuilder(
                stream: FirestoreServices.getUser(currentUser!.uid),
                builder:
                    (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(redColor),
                      ),
                    );
                  } else if (snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text('No data found'),
                    );
                  } else {
                    var data = snapshot.data!.docs[0];
                    return SafeArea(
                      child: Column(
                        children: [
                          // edit profile button
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Align(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.edit,
                                color: whiteColor,
                              ),
                            ).onTap(() {
                              controller.nameController.text = data['name'];
                              Get.to(() => EditProfileScreen(data: data));
                            }),
                          ),
                          // users detail section
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                data['imageUrl'] == ''
                                    ? Image.asset(
                                  imgProfile2,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ).box.roundedFull.clip(Clip.antiAlias).make()
                                    : Image.network(
                                  data['imageUrl'],
                                  width: 100,
                                  fit: BoxFit.cover,
                                ).box.roundedFull.clip(Clip.antiAlias).make(),
                                10.widthBox,
                                Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        "${data['name']}"
                                            .text
                                            .fontFamily(semibold)
                                            .white
                                            .make(),
                                        "${data['email']}".text.white.make(),
                                      ],
                                    )),
                                OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        side: const BorderSide(
                                          color: whiteColor,
                                        )),
                                    onPressed: () async {
                                      await Get.put(AuthController())
                                          .signOutMethod(context);
                                      Get.offAll(() => const LoginScreen());
                                    },
                                    child: logout.text
                                        .fontFamily(semibold)
                                        .white
                                        .make()),
                              ],
                            ),
                          ),
                          20.heightBox,
                          FutureBuilder(
                              future: FirestoreServices.getCounts(),
                              builder:
                                  (BuildContext context, AsyncSnapshot snapshot) {
                                if (!snapshot.hasData) {
                                  return Center(child: loadingIndicator());
                                } else {
                                  var countData = snapshot.data;
                                  return Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      detailsCard(
                                          count: countData[0].toString(),
                                          title: "in your cart",
                                          width: context.screenWidth / 3.4),
                                      detailsCard(
                                          count: countData[1].toString(),
                                          title: "in your wishlist",
                                          width: context.screenWidth / 3.4),
                                      detailsCard(
                                          count: countData[2].toString(),
                                          title: "your orders",
                                          width: context.screenWidth / 3.4),
                                    ],
                                  );
                                }
                              }),
                          // buttons section
                          ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  onTap: () {
                                    switch (index) {
                                      case 0:
                                        Get.to(() => OrdersScreen());
                                        break;
                                      case 1:
                                        Get.to(() => WishlistScreen());
                                        break;
                                      case 2:
                                        Get.to(() => MessagesScreen());
                                        break;
                                    }
                                  },
                                  title: "${profileButtonsList[index]}"
                                      .text
                                      .fontFamily(semibold)
                                      .color(darkFontGrey)
                                      .make(),
                                  leading: Image.asset(
                                    profileButtonsIcon[index],
                                    width: 22,
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Divider(
                                  color: lightGrey,
                                );
                              },
                              itemCount: profileButtonsList.length)
                              .box
                              .white
                              .rounded
                              .margin(EdgeInsets.all(12))
                              .padding(const EdgeInsets.symmetric(horizontal: 16))
                              .shadowSm
                              .make()
                              .box
                              .color(redColor)
                              .make()
                        ],
                      ),
                    );
                  }
                }),
          ),
        ));
  }
}

