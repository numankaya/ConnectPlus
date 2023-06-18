import '../../../core/utils/color_constant.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_style.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/custom_image_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.lightGreen100,
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: SingleChildScrollView(
                              padding: getPadding(top: 1),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                            height: getVerticalSize(219),
                                            width: getHorizontalSize(352),
                                            child: Stack(
                                                alignment: Alignment.topRight,
                                                children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                "OTP Verification",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtUrbanistRomanBold30),
                                                            Container(
                                                                width:
                                                                    getHorizontalSize(
                                                                        329),
                                                                margin:
                                                                    getMargin(
                                                                        top:
                                                                            14),
                                                                child: Text(
                                                                    "Enter the verification code we just sent on your email address.",
                                                                    maxLines:
                                                                        null,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtUrbanistRomanMedium16Bluegray40001))
                                                          ])),
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgVector12,
                                                      height:
                                                          getVerticalSize(133),
                                                      width: getHorizontalSize(
                                                          294),
                                                      alignment:
                                                          Alignment.topRight),
                                                  CustomIconButton(
                                                      height: 41,
                                                      width: 41,
                                                      margin:
                                                          getMargin(top: 54),
                                                      alignment:
                                                          Alignment.topLeft,
                                                      onTap: () {
                                                        onTapBtnArrowleft(
                                                            context);
                                                      },
                                                      child: CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgArrowleft))
                                                ]))),
                                    Padding(
                                        padding: getPadding(
                                            left: 22, top: 33, right: 21),
                                        child: PinCodeTextField(
                                            appContext: context,
                                            length: 4,
                                            obscureText: false,
                                            obscuringCharacter: '*',
                                            keyboardType: TextInputType.number,
                                            autoDismissKeyboard: true,
                                            enableActiveFill: true,
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            onChanged: (value) {},
                                            textStyle: TextStyle(
                                                color: ColorConstant.gray90001,
                                                fontSize: getFontSize(22),
                                                fontFamily: 'Urbanist',
                                                fontWeight: FontWeight.w700),
                                            pinTheme: PinTheme(
                                                fieldHeight:
                                                    getHorizontalSize(60),
                                                fieldWidth:
                                                    getHorizontalSize(70),
                                                shape: PinCodeFieldShape.box,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        getHorizontalSize(8)),
                                                selectedFillColor:
                                                    ColorConstant.gray50,
                                                activeFillColor:
                                                    ColorConstant.gray50,
                                                inactiveFillColor:
                                                    ColorConstant.gray50,
                                                inactiveColor:
                                                    ColorConstant.indigo50,
                                                selectedColor:
                                                    ColorConstant.indigo50,
                                                activeColor:
                                                    ColorConstant.indigo50))),
                                    CustomButton(
                                        height: getVerticalSize(56),
                                        text: "Verify",
                                        margin: getMargin(
                                            left: 22, top: 38, right: 21),
                                        onTap: () {

                                        }),
                                    SizedBox(
                                        width: double.maxFinite,
                                        child: Container(
                                            margin:
                                                getMargin(top: 293, right: 2),
                                            padding: getPadding(
                                                left: 85,
                                                top: 25,
                                                right: 85,
                                                bottom: 25),
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: fs.Svg(ImageConstant
                                                        .imgGroup4),
                                                    fit: BoxFit.cover)),
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  GestureDetector(
                                                      onTap: () {

                                                      },
                                                      child: Padding(
                                                          padding: getPadding(
                                                              top: 37),
                                                          child: RichText(
                                                              text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                        text:
                                                                            "Didn’t received code? ",
                                                                        style: TextStyle(
                                                                            color: ColorConstant
                                                                                .gray90001,
                                                                            fontSize: getFontSize(
                                                                                15),
                                                                            fontFamily:
                                                                                'Urbanist',
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            letterSpacing: getHorizontalSize(0.15))),
                                                                    TextSpan(
                                                                        text:
                                                                            "Resend",
                                                                        style: TextStyle(
                                                                            color: ColorConstant
                                                                                .cyan400,
                                                                            fontSize: getFontSize(
                                                                                15),
                                                                            fontFamily:
                                                                                'Urbanist',
                                                                            fontWeight:
                                                                                FontWeight.w700,
                                                                            letterSpacing: getHorizontalSize(0.15)))
                                                                  ]),
                                                              textAlign:
                                                                  TextAlign
                                                                      .left)))
                                                ])))
                                  ])))
                    ]))));
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapBtnArrowleft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the createNewPasswordScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the `Navigator` widget
  /// to push the named route for the createNewPasswordScreen.


  /// Navigates to the forgotPasswordScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the `Navigator` widget
  /// to push the named route for the forgotPasswordScreen.

}
