import 'package:erasmus_connect/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_style.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/custom_image_view.dart';
import '../../../widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

// ignore_for_file: must_be_immutable
class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

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
                                                                        "Forgot Password?",
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
                                                                            310),
                                                                        margin: getMargin(
                                                                            top:
                                                                                10),
                                                                        child: Text(
                                                                            "Don't worry! It occurs. Please enter the email address linked with your account.",
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
                                                                onTapBtnArrowleft(
                                                                    context);
                                                              },
                                                              child: CustomImageView(
                                                                  svgPath:
                                                                      ImageConstant
                                                                          .imgArrowleft))
                                                        ]))),
                                            CustomTextFormField(
                                                focusNode: FocusNode(),
                                                autofocus: true,
                                                controller: emailController,
                                                hintText: "Enter your email",
                                                margin: getMargin(
                                                    left: 20,
                                                    top: 30,
                                                    right: 21),
                                                padding: TextFormFieldPadding
                                                    .PaddingT19_2,
                                                textInputAction:
                                                    TextInputAction.done,
                                                textInputType:
                                                    TextInputType.emailAddress),
                                            CustomButton(
                                                height: getVerticalSize(56),
                                                text: "Send Mail",
                                                margin: getMargin(
                                                    left: 20,
                                                    top: 38,
                                                    right: 21),
                                                onTap: () {
                                                  if (emailController.text.isNotEmpty) {
                                                    SendForgotPasswordMail(mail: emailController.text, context: context);
                                                  }
                                                }),
                                            SizedBox(
                                                width: double.maxFinite,
                                                child: Container(
                                                    margin: getMargin(top: 297),
                                                    padding: getPadding(
                                                        left: 89,
                                                        top: 23,
                                                        right: 89,
                                                        bottom: 23),
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: fs.Svg(
                                                                ImageConstant
                                                                    .imgGroup4),
                                                            fit: BoxFit.cover)),
                                                    child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          GestureDetector(
                                                              onTap: () {
                                                              },
                                                              child: Padding(
                                                                  padding:
                                                                      getPadding(
                                                                          top:
                                                                              41),
                                                                  child: RichText(
                                                                      text: TextSpan(children: [
                                                                        TextSpan(
                                                                            text:
                                                                                "Remember Password? ",
                                                                            style: TextStyle(
                                                                                color: ColorConstant.gray90001,
                                                                                fontSize: getFontSize(15),
                                                                                fontFamily: 'Urbanist',
                                                                                fontWeight: FontWeight.w500,
                                                                                letterSpacing: getHorizontalSize(0.15))),
                                                                        TextSpan(
                                                                            text:
                                                                                "Login",
                                                                            style: TextStyle(
                                                                                color: ColorConstant.cyan400,
                                                                                fontSize: getFontSize(15),
                                                                                fontFamily: 'Urbanist',
                                                                                fontWeight: FontWeight.w700,
                                                                                letterSpacing: getHorizontalSize(0.15)))
                                                                      ]),
                                                                      textAlign: TextAlign.left)))
                                                        ])))
                                          ]))))
                        ])))));
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapBtnArrowleft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the otpVerificationScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the `Navigator` widget
  /// to push the named route for the otpVerificationScreen.
  void SendForgotPasswordMail({required String mail, required BuildContext context}) {
    FirebaseAuthServiceMethods(FirebaseAuth.instance).ForgotPassword(mail: mail, context: context);
  }

  /// Navigates to the loginScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the `Navigator` widget
  /// to push the named route for the loginScreen.

}
