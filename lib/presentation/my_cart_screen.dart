import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_project/bloc/my_cart_bloc/my_cart_bloc.dart';
import 'package:ecommerce_project/data/models/my_cart_model_res.dart';
import 'package:ecommerce_project/utils/constants.dart';
import 'package:ecommerce_project/utils/formats.dart';
import 'package:ecommerce_project/utils/theme_colors.dart';
import 'package:ecommerce_project/utils/theme_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      BlocProvider.of<MyCartBloc>(context).add(GetMyCartInfoEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.bg,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ThemeColors.bg,
        elevation: 0,
        shadowColor: ThemeColors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 13.h),
                height: 37.h,
                width: 37.w,
                decoration: BoxDecoration(
                  color: ThemeColors.blue,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: InkWell(
                    onTap: () => Navigator.pop(context), child: SvgPicture.asset("assets/icons/close_white.svg")),
              ),
            ),
            Row(
              children: [
                Text(
                  "Add address",
                  style: ThemeTextMedium.size.copyWith(fontSize: 15),
                ),
                SizedBox(
                  width: 9.w,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 11.h),
                  height: 37.h,
                  width: 37.w,
                  decoration: BoxDecoration(
                    color: ThemeColors.orange,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: SvgPicture.asset("assets/icons/geo_white.svg"),
                ),
              ],
            ),
          ],
        ),
      ),
      body: BlocConsumer<MyCartBloc, MyCartState>(
        listener: (context, state) {
          if (state is MyCartError) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                        actions: [
                          TextButton(
                            child: Text("Ok", style: ThemeTextRegular.size.copyWith(fontSize: 13)),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                        title: Text(state.errorMessage, style: ThemeTextRegular.size.copyWith(fontSize: 17)),
                        content: Text(state.errorMessage, style: ThemeTextRegular.size.copyWith(fontSize: 13))));
          }
        },
        builder: (context, state) {
          if (state is MyCartLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 42.w),
                  child: Text(
                    "My Cart",
                    style: ThemeTextBold.size.copyWith(fontSize: 35),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Container(
                  padding: EdgeInsets.only(bottom: 44.h, top: 80.h),
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: BoxDecoration(
                    color: ThemeColors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        30.r,
                      ),
                      topRight: Radius.circular(
                        30.r,
                      ),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.7 * 0.7,
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) => CustomItemInfo(
                              itemInfo: state.myCartInfoModelRes.basket[index],
                            ),
                            itemCount: state.myCartInfoModelRes.basket.length,
                            separatorBuilder: (BuildContext context, int index) => SizedBox(
                              height: 46.h,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Divider(
                            height: 2.h,
                            color: ThemeColors.white.withOpacity(0.25),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 55.w, right: 35.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: ThemeTextRegular.size.copyWith(fontSize: 15, color: ThemeColors.white),
                              ),
                              Text(
                                "${customMoneyFormat(state.myCartInfoModelRes.total.toString())} us",
                                style: ThemeTextRegular.size.copyWith(fontSize: 15, color: ThemeColors.white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 55.w, right: 35.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Delivery",
                                style: ThemeTextRegular.size.copyWith(fontSize: 15, color: ThemeColors.white),
                              ),
                              Text(
                                state.myCartInfoModelRes.delivery,
                                style: ThemeTextRegular.size.copyWith(fontSize: 15, color: ThemeColors.white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 26.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Divider(
                            height: 2.h,
                            color: ThemeColors.white.withOpacity(0.25),
                          ),
                        ),
                        SizedBox(
                          height: 27.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 44.w),
                          child: ElevatedButton(
                              onPressed: () => Navigator.pushNamed(context, AppRoutesString.routeToMainScreen),
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r))),
                                  backgroundColor: MaterialStateProperty.all(ThemeColors.orange),
                                  minimumSize: MaterialStateProperty.all(Size(double.infinity, 54.h)),
                                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                                    vertical: 14.h,
                                  ))),
                              child: Text(
                                "Checkout",
                                style: ThemeTextBold.size.copyWith(fontSize: 20, color: ThemeColors.white),
                              )),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class CustomItemInfo extends StatefulWidget {
  final MyCartInfoBasketModelRes itemInfo;
  CustomItemInfo({
    Key? key,
    required this.itemInfo,
  }) : super(key: key);

  @override
  State<CustomItemInfo> createState() => _CustomItemInfoState();
}

class _CustomItemInfoState extends State<CustomItemInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: ThemeColors.white,
                image: DecorationImage(image: CachedNetworkImageProvider(widget.itemInfo.images)),
                borderRadius: BorderRadius.circular(
                  10.r,
                )),
            height: 88.h,
            width: 88.w,
            // child: CachedNetworkImage(
            //   fit: BoxFit.fitHeight,
            //   imageUrl: widget.itemInfo.images,
            // )
          ),
          SizedBox(
            width: 17.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.itemInfo.title,
                  softWrap: true,
                  style: ThemeTextMedium.size.copyWith(fontSize: 20, color: ThemeColors.white),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  customMoneyFormat(widget.itemInfo.price.toString()),
                  softWrap: true,
                  style: ThemeTextMedium.size.copyWith(fontSize: 20, color: ThemeColors.orange),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 33.w,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 8.h),
            // height: 68.h,
            // width: 26.w,
            decoration: BoxDecoration(color: ThemeColors.darkBlue, borderRadius: BorderRadius.circular(26.r)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.remove,
                    color: ThemeColors.white,
                  ),
                ),
                Text(
                  "2",
                  style: ThemeTextMedium.size.copyWith(fontSize: 20, color: ThemeColors.white),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.add,
                    color: ThemeColors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 17.w,
          ),
          SvgPicture.asset(
            "assets/icons/trash_can_gray.svg",
            height: 16.h,
            width: 15.w,
          )
        ],
      ),
    );
  }
}
