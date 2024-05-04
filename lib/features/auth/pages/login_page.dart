import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kfc/common/utils/constants.dart';
import 'package:kfc/common/widgets/appstyle.dart';
import 'package:kfc/common/widgets/custom_otn_btn.dart';
import 'package:kfc/common/widgets/custom_text.dart';
import 'package:kfc/common/widgets/hieght_spacer.dart';
import 'package:kfc/common/widgets/reusable_text.dart';
import 'package:kfc/features/auth/pages/otp_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController phone = TextEditingController();

  Country country = Country(
    phoneCode: "+7",
    countryCode: "RU",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "Russia",
    example: "Russia",
    displayName: "Russia",
    displayNameNoCountryCode: "Russia",
    e164Key: "",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Image.asset(
                  "assets/img/todo.png",
                  width: 300,
                ),
              ),
              const HieghtSpacer(hieght: 20),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 16.w),
                child: ReusableText(
                  text: "Please enter your phone number",
                  style: appsStyle(17, AppConst.kLight, FontWeight.w500),
                ),
              ),
              const HieghtSpacer(hieght: 20),
              Center(
                child: CustomTextField(
                  controller: phone,
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(14),
                    child: GestureDetector(
                      onTap: () {
                        showCountryPicker(
                            context: context,
                            countryListTheme: CountryListThemeData(
                              backgroundColor: AppConst.kLight,
                              bottomSheetHeight: AppConst.kHieght * 0.6,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(AppConst.kRadius),
                                topRight: Radius.circular(AppConst.kRadius),
                              ),
                            ),
                            onSelect: (code) {
                              setState(() {});
                            });
                      },
                      child: ReusableText(
                        text: "${country.flagEmoji}  ${country.phoneCode}",
                        style: appsStyle(15, AppConst.kBkDark, FontWeight.bold),
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  hintText: "Enter your phone number",
                  hintStyle: appsStyle(16, AppConst.kBkDark, FontWeight.w600),
                ),
              ),
              const HieghtSpacer(hieght: 20),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomOtlBtn(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OtpPage(),
                      ),
                    );
                  },
                  width: AppConst.kWidth * 0.9,
                  height: AppConst.kHieght * 0.07,
                  color: AppConst.kBkDark,
                  color2: AppConst.kLight,
                  text: "Send code",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
