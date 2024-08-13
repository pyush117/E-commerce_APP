import 'package:e_commerce/views/cart_screen/payment_method.dart';
import 'package:e_commerce/widgets_common/custom_textfield.dart';
import 'package:e_commerce/widgets_common/our_button.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Controllers/cart_controller.dart';
import '../../consts/consts.dart';

class ShippingDetails extends StatelessWidget {
  const ShippingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Shipping Info"
            .text
            .fontFamily(semibold)
            .color(darkFontGrey)
            .make(),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: ourBuutton(
          onPress: () {
            if(controller.addressController.text.length>10){
              Get.to(()=>PaymentMethods());

            } else {
              VxToast.show(context, msg: "Please fill the information");
            }
          },
          color: redColor,
          textColor: whiteColor,
          title: "Continue",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            customTextField(
                title: "Address",
                hint: "Address",
                isPass: false,
                controller: controller.addressController),
            customTextField(
                title: "City",
                hint: "City",
                isPass: false,
                controller: controller.cityController),
            customTextField(
                title: "State",
                hint: "State",
                isPass: false,
                controller: controller.stateController),
            customTextField(
                title: "Postal Code",
                hint: "Postal Code",
                isPass: false,
                controller: controller.postalcodeController),
            customTextField(
                title: "Phone",
                hint: "Phone",
                isPass: false,
                controller: controller.phoneController),
          ],
        ),
      ),
    );
  }
}
