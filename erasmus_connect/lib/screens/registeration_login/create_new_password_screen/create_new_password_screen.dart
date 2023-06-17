import 'package:flutter/material.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_style.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/custom_image_view.dart';
import '../../../widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class CreateNewPasswordScreen extends StatelessWidget {
  CreateNewPasswordScreen({Key? key}) : super(key: key);

  TextEditingController newpasswordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.lightGreen100,
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: SizedBox(
                    width: double.maxFinite,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              child: SingleChildScrollView(
                                  padding: getPadding(top: 1),
                                  child: Padding(
                                      padding: getPadding(left: 2),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: SizedBox(
                                                    height:
                                                        getVerticalSize(222),
                                                    width:
                                                        getHorizontalSize(352),
                                                    child: Stack(
                                                        alignment:
                                                            Alignment.topRight,
                                                        children: [
                                                          Align(
                                                              alignment: Alignment
                                                                  .bottomLeft,
                                                              child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                        "Create new password",
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: AppStyle
                                                                            .txtUrbanistRomanBold30),
                                                                    Container(
                                                                        width: getHorizontalSize(
                                                                            331),
                                                                        margin: getMargin(
                                                                            top:
                                                                                10),
                                                                        child: Text(
                                                                            "Your new password must be unique from those previously used.",
                                                                            maxLines:
                                                                                null,
                                                                            textAlign:
                                                                                TextAlign.left,
                                                                            style: AppStyle.txtUrbanistRomanMedium16))
                                                                  ])),
                                                          CustomImageView(
                                                              svgPath:
                                                                  ImageConstant
                                                                      .imgVector12,
                                                              height:
                                                                  getVerticalSize(
                                                                      133),
                                                              width:
                                                                  getHorizontalSize(
                                                                      294),
                                                              alignment:
                                                                  Alignment
                                                                      .topRight),
                                                          CustomIconButton(
                                                              height: 41,
                                                              width: 41,
                                                              margin: getMargin(
                                                                  top: 54),
                                                              alignment:
                                                                  Alignment
                                                                      .topLeft,
                                                              onTap: () {
                                                                ;
                                                              },
                                                              child: CustomImageView(
                                                                  svgPath:
                                                                      ImageConstant
                                                                          .imgArrowleft))
                                                        ]))),
                                            CustomTextFormField(
                                                focusNode: FocusNode(),
                                                autofocus: true,
                                                controller:
                                                    newpasswordController,
                                                hintText: "New Password",
                                                margin: getMargin(
                                                    left: 20,
                                                    top: 30,
                                                    right: 21),
                                                textInputType: TextInputType
                                                    .visiblePassword,
                                                isObscureText: true),
                                            CustomTextFormField(
                                                focusNode: FocusNode(),
                                                autofocus: true,
                                                controller:
                                                    confirmpasswordController,
                                                hintText: "Confirm Password",
                                                margin: getMargin(
                                                    left: 20,
                                                    top: 15,
                                                    right: 21),
                                                textInputAction:
                                                    TextInputAction.done,
                                                textInputType: TextInputType
                                                    .visiblePassword,
                                                isObscureText: true),
                                            CustomButton(
                                                height: getVerticalSize(56),
                                                text: "Reset Password",
                                                margin: getMargin(
                                                    left: 20,
                                                    top: 38,
                                                    right: 21),
                                                onTap: () {

                                                }),
                                            CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgGroup4,
                                                height: getVerticalSize(111),
                                                width: getHorizontalSize(372),
                                                margin: getMargin(top: 228))
                                          ]))))
                        ])))));
  }


}
