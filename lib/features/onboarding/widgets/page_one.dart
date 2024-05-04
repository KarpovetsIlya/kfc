import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kfc/common/utils/constants.dart';
import 'package:kfc/common/widgets/appstyle.dart';
import 'package:kfc/common/widgets/hieght_spacer.dart';
import 'package:kfc/common/widgets/reusable_text.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConst.kHieght,
      width: AppConst.kWidth,
      color: AppConst.kBkDark,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Image.asset("assets/img/todo.png"),
          ),
          const HieghtSpacer(hieght: 50),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ReusableText(
                text: "Todo with Riverpod",
                style: appsStyle(30, AppConst.kLight, FontWeight.w600),
              ),
              const HieghtSpacer(hieght: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(
                  "Welcome! Do you want to create a task fast and with ease",
                  textAlign: TextAlign.center,
                  style: appsStyle(16, AppConst.kGreyLight, FontWeight.normal),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
