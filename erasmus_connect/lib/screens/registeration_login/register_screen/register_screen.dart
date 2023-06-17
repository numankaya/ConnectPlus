import 'package:cloud_firestore/cloud_firestore.dart';
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
class RegisterScreen extends ConsumerWidget {
  RegisterScreen({Key? key}) : super(key: key);

  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.deepPurple200Aa,
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
                                                        getVerticalSize(200),
                                                    width:
                                                        getHorizontalSize(352),
                                                    child: Stack(
                                                        alignment:
                                                            Alignment.topRight,
                                                        children: [
                                                          Align(
                                                              alignment: Alignment
                                                                  .bottomLeft,
                                                              child: SizedBox(
                                                                  width:
                                                                      getHorizontalSize(
                                                                          272),
                                                                  child: Text(
                                                                      "Hello! Register to get started",
                                                                      maxLines:
                                                                          null,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: AppStyle
                                                                          .txtUrbanistRomanBold30))),
                                                          CustomImageView(
                                                              svgPath: ImageConstant
                                                                  .imgVector13Indigo5001,
                                                              height:
                                                                  getVerticalSize(
                                                                      133),
                                                              width:
                                                                  getHorizontalSize(
                                                                      293),
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
                                                controller: usernameController,
                                                hintText: "Username",
                                                margin: getMargin(
                                                    left: 20,
                                                    top: 33,
                                                    right: 21),
                                                variant: TextFormFieldVariant
                                                    .OutlineIndigo50),
                                            CustomTextFormField(
                                                focusNode: FocusNode(),
                                                autofocus: true,
                                                controller: emailController,
                                                hintText: "Email",
                                                margin: getMargin(
                                                    left: 20,
                                                    top: 12,
                                                    right: 21),
                                                variant: TextFormFieldVariant
                                                    .OutlineIndigo50,
                                                textInputType:
                                                    TextInputType.emailAddress),
                                            CustomTextFormField(
                                                focusNode: FocusNode(),
                                                autofocus: true,
                                                controller: passwordController,
                                                hintText: "Password",
                                                margin: getMargin(
                                                    left: 20,
                                                    top: 12,
                                                    right: 21),
                                                textInputType: TextInputType
                                                    .visiblePassword,
                                                isObscureText: true),
                                            CustomTextFormField(
                                                focusNode: FocusNode(),
                                                autofocus: true,
                                                controller:
                                                    confirmpasswordController,
                                                hintText: "Confirm password",
                                                margin: getMargin(
                                                    left: 20,
                                                    top: 12,
                                                    right: 21),
                                                textInputAction:
                                                    TextInputAction.done,
                                                textInputType: TextInputType
                                                    .visiblePassword,
                                                isObscureText: true),
                                            CustomButton(
                                              onTap: () {
                                                if(passwordController.text == confirmpasswordController.text && usernameController.text.isNotEmpty) {
                                                  CreateAccountWithMail(mail: emailController.text, password: passwordController.text, fullName: usernameController.text, ref: ref, context: context);
                                                }
                                              },
                                                height: getVerticalSize(56),
                                                text: "Register",
                                                margin: getMargin(
                                                    left: 20,
                                                    top: 30,
                                                    right: 21)),
                                            Container(
                                                height: getVerticalSize(195),
                                                width: getHorizontalSize(372),
                                                margin: getMargin(top: 36),
                                                child: Stack(
                                                    alignment:
                                                        Alignment.topCenter,
                                                    children: [
                                                      Align(
                                                          alignment: Alignment
                                                              .bottomCenter,
                                                          child: Container(
                                                              padding:
                                                                  getPadding(
                                                                      left: 59,
                                                                      top: 23,
                                                                      right: 59,
                                                                      bottom:
                                                                          23),
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: fs
                                                                          .Svg(ImageConstant
                                                                              .imgGroup6),
                                                                      fit: BoxFit
                                                                          .cover)),
                                                              child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                              Navigator.of(context).pop();
                                                                        },
                                                                        child: Padding(
                                                                            padding: getPadding(top: 41),
                                                                            child: RichText(
                                                                                text: TextSpan(children: [
                                                                                  TextSpan(text: "Already have an account? ", style: TextStyle(color: ColorConstant.gray90001, fontSize: getFontSize(15), fontFamily: 'Urbanist', fontWeight: FontWeight.w500, letterSpacing: getHorizontalSize(0.15))),
                                                                                  TextSpan(text: "Login Now", style: TextStyle(color: ColorConstant.cyan400, fontSize: getFontSize(15), fontFamily: 'Urbanist', fontWeight: FontWeight.w700, letterSpacing: getHorizontalSize(0.15)))
                                                                                ]),
                                                                                textAlign: TextAlign.left)))
                                                                  ]))),
                                                      Align(
                                                          alignment: Alignment
                                                              .topCenter,
                                                          child: Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 20,
                                                                      right:
                                                                          21),
                                                              child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                              padding: getPadding(top: 8, bottom: 8),
                                                                              child: SizedBox(width: getHorizontalSize(103), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.indigo50))),
                                                                          Text(
                                                                              "Or Register with",
                                                                              overflow: TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.left,
                                                                              style: AppStyle.txtUrbanistRomanSemiBold14),
                                                                          Padding(
                                                                              padding: getPadding(top: 8, bottom: 8),
                                                                              child: SizedBox(width: getHorizontalSize(103), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: ColorConstant.indigo50)))
                                                                        ]),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            top:
                                                                                21),
                                                                        child: Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Card(
                                                                                  clipBehavior: Clip.antiAlias,
                                                                                  elevation: 0,
                                                                                  margin: EdgeInsets.all(0),
                                                                                  color: ColorConstant.whiteA700,
                                                                                  shape: RoundedRectangleBorder(side: BorderSide(color: ColorConstant.indigo50, width: getHorizontalSize(1)), borderRadius: BorderRadiusStyle.roundedBorder8),
                                                                                  child: Container(
                                                                                      height: getVerticalSize(56),
                                                                                      width: getHorizontalSize(105),
                                                                                      padding: getPadding(left: 37, top: 15, right: 37, bottom: 15),
                                                                                      decoration: AppDecoration.outlineIndigo50.copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
                                                                                      child: Stack(children: [
                                                                                        CustomImageView(svgPath: ImageConstant.imgFacebookic, height: getSize(26), width: getSize(26), alignment: Alignment.centerLeft)
                                                                                      ]))),
                                                                              GestureDetector(
                                                                                onTap: () {
                                                                                  if (usernameController.text.isNotEmpty) {
                                                                                    CreateAccountWithGoogleAccount(fullName: usernameController.text,ref: ref, context: context);
                                                                                  }
                                                                                },
                                                                                child: Card(
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    elevation: 0,
                                                                                    margin: EdgeInsets.all(0),
                                                                                    color: ColorConstant.whiteA700,
                                                                                    shape: RoundedRectangleBorder(side: BorderSide(color: ColorConstant.indigo50, width: getHorizontalSize(1)), borderRadius: BorderRadiusStyle.roundedBorder8),
                                                                                    child: Container(
                                                                                        height: getVerticalSize(56),
                                                                                        width: getHorizontalSize(105),
                                                                                        padding: getPadding(left: 37, top: 15, right: 37, bottom: 15),
                                                                                        decoration: AppDecoration.outlineIndigo50.copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
                                                                                        child: Stack(children: [
                                                                                          CustomImageView(svgPath: ImageConstant.imgGoogleic, height: getSize(26), width: getSize(26), alignment: Alignment.centerLeft)
                                                                                        ]))),
                                                                              ),
                                                                              Card(
                                                                                  clipBehavior: Clip.antiAlias,
                                                                                  elevation: 0,
                                                                                  margin: EdgeInsets.all(0),
                                                                                  color: ColorConstant.whiteA700,
                                                                                  shape: RoundedRectangleBorder(side: BorderSide(color: ColorConstant.indigo50, width: getHorizontalSize(1)), borderRadius: BorderRadiusStyle.roundedBorder8),
                                                                                  child: Container(
                                                                                      height: getVerticalSize(56),
                                                                                      width: getHorizontalSize(105),
                                                                                      padding: getPadding(left: 37, top: 15, right: 37, bottom: 15),
                                                                                      decoration: AppDecoration.outlineIndigo50.copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
                                                                                      child: Stack(children: [
                                                                                        CustomImageView(svgPath: ImageConstant.imgCibapple, height: getSize(26), width: getSize(26), alignment: Alignment.centerLeft)
                                                                                      ])))
                                                                            ]))
                                                                  ])))
                                                    ]))
                                          ]))))
                        ])))));
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapBtnArrowleft(BuildContext context) {
    Navigator.of(context).pop(false);
  }

  /// Navigates to the loginScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the `Navigator` widget
  /// to push the named route for the loginScreen.
  CreateAccountWithGoogleAccount({required String fullName, required WidgetRef ref, required BuildContext context }) async{
    final bool isSuccess = await FirebaseAuthServiceMethods(FirebaseAuth.instance).SignInWithGoogle(context, fullName: fullName, isCreatingAcc: true);
    if (isSuccess) {
      CreateProviderDatas(ref: ref, context: context);
    }
  }

  CreateAccountWithMail({required String mail, required String password, required String fullName, required WidgetRef ref, required BuildContext context}) async{
    final bool isSuccess = await FirebaseAuthServiceMethods(FirebaseAuth.instance).signUpWithEmail(fullName: fullName, email: mail, password: password, context: context);
    if (isSuccess) {
      CreateProviderDatas(ref: ref, context: context);
    }
  }

  Future<void> CreateProviderDatas({required WidgetRef ref, required BuildContext context}) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final Map<String, dynamic>? userCollection = await FirebaseFireStoreMethods(FirebaseFirestore.instance).GetUser(currentUser!.uid);
    ref.read(userProvider.notifier).ChangeUser(ConnectPlusUserUser(uId: currentUser!.uid, fullName: userCollection!["fullName"], mail: currentUser.email, phone: currentUser.phoneNumber, isMailVerified: currentUser.emailVerified));
    Navigator.of(context).pop(true);
  }

}
