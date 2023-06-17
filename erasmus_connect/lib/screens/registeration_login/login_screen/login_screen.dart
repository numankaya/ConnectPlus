import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erasmus_connect/screens/registeration_login/forgot_password_screen/forgot_password_screen.dart';
import 'package:erasmus_connect/screens/registeration_login/register_screen/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../models/connect_plus_user.dart';
import '../../../services/auth.dart';
import '../../../services/database.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/custom_image_view.dart';
import '../../../widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

// ignore_for_file: must_be_immutable
class LoginScreen extends ConsumerWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.lightGreen100,
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Form(
                  key: _formKey,
                  child: Container(
                      width: double.maxFinite,
                      padding: getPadding(top: 1, bottom: 1),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                    height: getVerticalSize(209),
                                    width: getHorizontalSize(352),
                                    child: Stack(
                                        alignment: Alignment.topRight,
                                        children: [
                                          Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Container(
                                                  width: getHorizontalSize(272),
                                                  margin: getMargin(left: 7),
                                                  child: Text(
                                                      "Welcome back! Glad to see you, Again!",
                                                      maxLines: null,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtUrbanistRomanBold30))),
                                          Positioned.fill(
                                            child: Align(
                                              alignment: Alignment.topCenter,
                                              child: Image.asset(
                                                'assets/images/line_image_4.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          CustomIconButton(
                                              height: 41,
                                              width: 41,
                                              margin: getMargin(top: 54),
                                              alignment: Alignment.topLeft,
                                              onTap: () {
                                                onTapBtnArrowleft(context);
                                              },
                                              child: CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgArrowleft))
                                        ]))),
                            CustomTextFormField(
                                focusNode: FocusNode(),
                                autofocus: true,
                                controller: emailController,
                                hintText: "Enter your email",
                                margin: getMargin(left: 22, top: 24, right: 22),
                                variant: TextFormFieldVariant.OutlineIndigo50,
                                padding: TextFormFieldPadding.PaddingT19_2,
                                textInputType: TextInputType.emailAddress),
                            CustomTextFormField(
                                focusNode: FocusNode(),
                                autofocus: true,
                                controller: passwordController,
                                hintText: "Enter your password",
                                margin: getMargin(left: 22, top: 15, right: 22),
                                padding: TextFormFieldPadding.PaddingT19,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.visiblePassword,
                                suffix: Container(
                                    margin: getMargin(
                                        left: 12,
                                        top: 17,
                                        right: 16,
                                        bottom: 17),
                                    child: CustomImageView(
                                        svgPath: ImageConstant
                                            .imgFluenteye20filled)),
                                suffixConstraints: BoxConstraints(
                                    maxHeight: getVerticalSize(56)),
                                isObscureText: true),
                            Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ForgotPasswordScreen()));
                                    },
                                    child: Padding(
                                        padding: getPadding(top: 16, right: 22),
                                        child: Text("Forgot Password?",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtUrbanistRomanSemiBold14)))),
                            CustomButton(
                                onTap: () {
                                  LoginWithEmailAndPass(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      ref: ref,
                                      context: context);
                                },
                                height: getVerticalSize(56),
                                text: "Login",
                                margin:
                                    getMargin(left: 22, top: 29, right: 22)),
                            Padding(
                                padding:
                                    getPadding(left: 22, top: 36, right: 22),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                          padding:
                                              getPadding(top: 8, bottom: 8),
                                          child: SizedBox(
                                              width: getHorizontalSize(112),
                                              child: Divider(
                                                  height: getVerticalSize(1),
                                                  thickness: getVerticalSize(1),
                                                  color:
                                                      ColorConstant.indigo50))),
                                      Padding(
                                          padding: getPadding(left: 12),
                                          child: Text("Or Login with",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtUrbanistRomanSemiBold14)),
                                      Padding(
                                          padding:
                                              getPadding(top: 8, bottom: 8),
                                          child: SizedBox(
                                              width: getHorizontalSize(123),
                                              child: Divider(
                                                  height: getVerticalSize(1),
                                                  thickness: getVerticalSize(1),
                                                  color: ColorConstant.indigo50,
                                                  indent:
                                                      getHorizontalSize(12))))
                                    ])),
                            Padding(
                                padding: getPadding(
                                    left: 22, top: 21, right: 22, bottom: 5),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Card(
                                          clipBehavior: Clip.antiAlias,
                                          elevation: 0,
                                          margin: EdgeInsets.all(0),
                                          color: ColorConstant.whiteA700,
                                          shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color: ColorConstant.indigo50,
                                                  width: getHorizontalSize(1)),
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder8),
                                          child: Container(
                                              height: getVerticalSize(56),
                                              width: getHorizontalSize(105),
                                              padding: getPadding(
                                                  left: 37,
                                                  top: 15,
                                                  right: 37,
                                                  bottom: 15),
                                              decoration: AppDecoration
                                                  .outlineIndigo50
                                                  .copyWith(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .roundedBorder8),
                                              child: Stack(children: [
                                                CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgFacebookic,
                                                    height: getSize(26),
                                                    width: getSize(26),
                                                    alignment:
                                                        Alignment.centerLeft)
                                              ]))),
                                      GestureDetector(
                                        onTap: () {
                                          LoginWithGoogleAccount(
                                              ref: ref, context: context);
                                        },
                                        child: Card(
                                            clipBehavior: Clip.antiAlias,
                                            elevation: 0,
                                            margin: getMargin(left: 8),
                                            color: ColorConstant.whiteA700,
                                            shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color:
                                                        ColorConstant.indigo50,
                                                    width:
                                                        getHorizontalSize(1)),
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder8),
                                            child: Container(
                                                height: getVerticalSize(56),
                                                width: getHorizontalSize(105),
                                                padding: getPadding(
                                                    left: 37,
                                                    top: 15,
                                                    right: 37,
                                                    bottom: 15),
                                                decoration: AppDecoration
                                                    .outlineIndigo50
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder8),
                                                child: Stack(children: [
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgGoogleic,
                                                      height: getSize(26),
                                                      width: getSize(26),
                                                      alignment:
                                                          Alignment.centerLeft)
                                                ]))),
                                      ),
                                      Card(
                                          clipBehavior: Clip.antiAlias,
                                          elevation: 0,
                                          margin: getMargin(left: 8),
                                          color: ColorConstant.whiteA700,
                                          shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color: ColorConstant.indigo50,
                                                  width: getHorizontalSize(1)),
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder8),
                                          child: Container(
                                              height: getVerticalSize(56),
                                              width: getHorizontalSize(105),
                                              padding: getPadding(
                                                  left: 37,
                                                  top: 15,
                                                  right: 37,
                                                  bottom: 15),
                                              decoration: AppDecoration
                                                  .outlineIndigo50
                                                  .copyWith(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .roundedBorder8),
                                              child: Stack(children: [
                                                CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgCibapple,
                                                    height: getSize(26),
                                                    width: getSize(26),
                                                    alignment:
                                                        Alignment.centerLeft)
                                              ])))
                                    ]))
                          ]))),
            ),
            bottomNavigationBar: Container(
                margin: getMargin(left: 61, right: 60, bottom: 23),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: fs.Svg(ImageConstant.imgGroup4),
                        fit: BoxFit.cover)),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () async {
                            bool isAccountOpened = await Navigator.of(context)
                                .push(MaterialPageRoute(
                                    builder: (context) => RegisterScreen()));
                            if (isAccountOpened) {
                              Navigator.of(context).pop();
                            }
                          },
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "Don’t have an account? ",
                                    style: TextStyle(
                                        color: ColorConstant.gray90001,
                                        fontSize: getFontSize(15),
                                        fontFamily: 'Urbanist',
                                        fontWeight: FontWeight.w500,
                                        letterSpacing:
                                            getHorizontalSize(0.15))),
                                TextSpan(
                                    text: "Register Now",
                                    style: TextStyle(
                                        color: ColorConstant.deepPurple200,
                                        fontSize: getFontSize(15),
                                        fontFamily: 'Urbanist',
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: getHorizontalSize(0.15)))
                              ]),
                              textAlign: TextAlign.left)),
                    ]))));
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapBtnArrowleft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the forgotPasswordScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the `Navigator` widget
  /// to push the named route for the forgotPasswordScreen.

  /// Navigates to the registerScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the `Navigator` widget
  /// to push the named route for the registerScreen.
  void LoginWithEmailAndPass(
      {required String email,
      required String password,
      required BuildContext context,
      required WidgetRef ref}) async {
    final bool x = await FirebaseAuthServiceMethods(FirebaseAuth.instance)
        .SignInWithEmail(email: email, password: password, context: context);
    if (x) {
      CreateProviderDatas(ref: ref, context: context);
    }
  }

  void LoginWithGoogleAccount(
      {required WidgetRef ref, required BuildContext context}) async {
    final bool x = await FirebaseAuthServiceMethods(FirebaseAuth.instance)
        .SignInWithGoogle(context, isCreatingAcc: false);
    if (x) {
      CreateProviderDatas(ref: ref, context: context);
    }
  }

  Future<void> CreateProviderDatas(
      {required WidgetRef ref, required BuildContext context}) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final Map<String, dynamic>? userCollection =
        await FirebaseFireStoreMethods(FirebaseFirestore.instance)
            .GetUser(currentUser!.uid);
    ref.read(userProvider.notifier).ChangeUser(ConnectPlusUserUser(
        uId: currentUser!.uid,
        fullName: userCollection!["fullName"],
        mail: currentUser.email,
        phone: currentUser.phoneNumber,
        isMailVerified: currentUser.emailVerified));
    Navigator.of(context).pop();
  }
}
