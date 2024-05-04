import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:kfc/common/utils/constants.dart';
import 'package:kfc/common/widgets/appstyle.dart';
import 'package:kfc/common/widgets/hieght_spacer.dart';
import 'package:kfc/common/widgets/reusable_text.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HieghtSpacer(hieght: AppConst.kHieght * 0.12),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Image.asset(
                  "assets/img/todo.png",
                  width: AppConst.kWidth * 0.5,
                ),
              ),
              const HieghtSpacer(hieght: 26),
              ReusableText(
                text: "Enter OTP",
                style: appsStyle(18, AppConst.kLight, FontWeight.bold),
              ),
              const HieghtSpacer(hieght: 26),
              Pinput(
                length: 6,
                showCursor: true,
                onCompleted: (value) {
                  if (value.length == 6) {}
                },
                onSubmitted: (value) {
                  if (value.length == 6) {}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
