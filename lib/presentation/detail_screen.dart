import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_project/bloc/detail_bloc/detail_bloc.dart';
import 'package:ecommerce_project/data/models/detail_info_model_res.dart';
import 'package:ecommerce_project/utils/constants.dart';
import 'package:ecommerce_project/utils/formats.dart';
import 'package:ecommerce_project/utils/theme_colors.dart';
import 'package:ecommerce_project/utils/theme_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      BlocProvider.of<DetailBloc>(context).add(GetDetailInfoEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Text(
              "Filter options",
              style: ThemeTextMedium.size.copyWith(fontSize: 18),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 11.h),
              height: 37.h,
              width: 37.w,
              decoration: BoxDecoration(
                color: ThemeColors.orange,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: SvgPicture.asset("assets/icons/bag_white.svg"),
            ),
          ],
        ),
      ),
      backgroundColor: ThemeColors.bg,
      body: BlocConsumer<DetailBloc, DetailState>(
        listener: (context, state) {
          if (state is DetailError) {
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
          if (state is DetailLoaded) {
            return Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                CustomCarouselWidget2(
                  detailInfo: state.detailInfoModelRes,
                ),
                SizedBox(
                  height: 7.h,
                ),
                const Expanded(child: SizedBox()),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 29.w, vertical: 28.h),
                  height: MediaQuery.of(context).size.height * 0.55,
                  decoration: BoxDecoration(
                    color: ThemeColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 9.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.detailInfoModelRes.title,
                                style: ThemeTextMedium.size.copyWith(fontSize: 24),
                              ),
                              if (state.detailInfoModelRes.isFavorites)
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 10.h),
                                  height: 37.h,
                                  width: 37.w,
                                  decoration: BoxDecoration(
                                    color: ThemeColors.blue,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: InkWell(onTap: () {}, child: SvgPicture.asset("assets/icons/heart_white.svg")),
                                )
                              else
                                SizedBox(
                                  height: 33.h,
                                  width: 37.w,
                                )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 9.w),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/star_yellow.svg",
                                width: 18,
                                height: 18,
                              ),
                              SizedBox(
                                width: 9.w,
                              ),
                              SvgPicture.asset(
                                "assets/icons/star_yellow.svg",
                                width: 18,
                                height: 18,
                              ),
                              SizedBox(
                                width: 9.w,
                              ),
                              SvgPicture.asset(
                                "assets/icons/star_yellow.svg",
                                width: 18,
                                height: 18,
                              ),
                              SizedBox(
                                width: 9.w,
                              ),
                              SvgPicture.asset(
                                "assets/icons/star_yellow.svg",
                                width: 18,
                                height: 18,
                              ),
                              SizedBox(
                                width: 9.w,
                              ),
                              SvgPicture.asset(
                                "assets/icons/star_yellow.svg",
                                width: 18,
                                height: 18,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        const SelectableContainers(),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/cpu_gray.svg",
                                  width: 28.w,
                                  height: 28.h,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(state.detailInfoModelRes.CPU,
                                    style: ThemeTextRegular.size.copyWith(color: ThemeColors.textGray, fontSize: 11)),
                              ],
                            ),
                            Column(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/camera_gray.svg",
                                  width: 28.w,
                                  height: 22.h,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(state.detailInfoModelRes.camera,
                                    style: ThemeTextRegular.size.copyWith(color: ThemeColors.textGray, fontSize: 11)),
                              ],
                            ),
                            Column(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/operative_gray.svg",
                                  width: 28.w,
                                  height: 21.h,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(state.detailInfoModelRes.sd,
                                    style: ThemeTextRegular.size.copyWith(color: ThemeColors.textGray, fontSize: 11)),
                              ],
                            ),
                            Column(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/memory_gray.svg",
                                  width: 19.w,
                                  height: 22.h,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(state.detailInfoModelRes.ssd,
                                    style: ThemeTextRegular.size.copyWith(color: ThemeColors.textGray, fontSize: 11)),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 29.h,
                        ),
                        Text(
                          "Select color and capacity",
                          style: ThemeTextMedium.size.copyWith(fontSize: 16),
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.w, right: 34.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SelectableColorCirlces(colorList: state.detailInfoModelRes.color),
                              SelectableMemoryRow(
                                memory: state.detailInfoModelRes.sd,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 27.h,
                        ),
                        ElevatedButton(
                            onPressed: () => Navigator.pushNamed(context, AppRoutesString.routeToMyCartScreen),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r))),
                                backgroundColor: MaterialStateProperty.all(ThemeColors.orange),
                                minimumSize: MaterialStateProperty.all(Size(double.infinity, 54.h)),
                                padding: MaterialStateProperty.all(EdgeInsets.only(
                                  left: 45.w,
                                  right: 38.w,
                                  top: 14.h,
                                  bottom: 14.h,
                                ))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Add to Cart ",
                                  style: ThemeTextBold.size.copyWith(fontSize: 20, color: ThemeColors.white),
                                ),
                                Text(
                                  customMoneyFormat(state.detailInfoModelRes.price.toString()),
                                  style: ThemeTextBold.size.copyWith(fontSize: 20, color: ThemeColors.white),
                                ),
                              ],
                            )),
                        // SizedBox(
                        //   height: 30.h,
                        // ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class SelectableMemoryRow extends StatefulWidget {
  final String memory;
  SelectableMemoryRow({
    Key? key,
    required this.memory,
  }) : super(key: key);

  @override
  State<SelectableMemoryRow> createState() => _SelectableMemoryRowState();
}

class _SelectableMemoryRowState extends State<SelectableMemoryRow> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => setState(() {
            activeIndex = 0;
          }),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: activeIndex == 0 ? ThemeColors.orange : ThemeColors.transparent,
            ),
            child: Text(
              "128 GB",
              style: ThemeTextBold.size
                  .copyWith(color: activeIndex == 0 ? ThemeColors.white : ThemeColors.textGray, fontSize: 13),
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        InkWell(
          onTap: () => setState(() {
            activeIndex = 1;
          }),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: activeIndex == 1 ? ThemeColors.orange : ThemeColors.transparent,
            ),
            child: Text(
              widget.memory,
              style: ThemeTextBold.size
                  .copyWith(color: activeIndex == 1 ? ThemeColors.white : ThemeColors.textGray, fontSize: 13),
            ),
          ),
        ),
      ],
    );
  }
}

class SelectableColorCirlces extends StatefulWidget {
  final List<String> colorList;
  const SelectableColorCirlces({
    Key? key,
    required this.colorList,
  }) : super(key: key);

  @override
  State<SelectableColorCirlces> createState() => _SelectableColorCirlcesState();
}

class _SelectableColorCirlcesState extends State<SelectableColorCirlces> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int index = 0; index < widget.colorList.length; index++)
          Row(
            children: [
              InkWell(
                onTap: () => setState(() {
                  activeIndex = index;
                }),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 11.h),
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(int.parse(_getHashColor(widget.colorList[index]))),
                  ),
                  child: activeIndex == index
                      ? SvgPicture.asset(
                          "assets/icons/check_white.svg",
                          height: 12.h,
                          width: 17.w,
                        )
                      : null,
                ),
              ),
              if (index != widget.colorList.length)
                SizedBox(
                  width: 18.w,
                ),
            ],
          ),
      ],
    );
  }

  _getHashColor(String hashColor) {
    return "0xFF${hashColor.substring(1)}";
  }
}

class SelectableContainers extends StatefulWidget {
  const SelectableContainers({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectableContainers> createState() => _SelectableContainersState();
}

class _SelectableContainersState extends State<SelectableContainers> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => setState(() {
            activeIndex = 0;
          }),
          child: Container(
            padding: activeIndex == 0 ? EdgeInsets.only(bottom: 5.h) : EdgeInsets.only(bottom: 8.h),
            decoration: activeIndex == 0
                ? const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: ThemeColors.orange,
                        width: 3,
                      ),
                    ),
                  )
                : null,
            child: Text(
              "Shop",
              style: activeIndex == 0
                  ? ThemeTextBold.size.copyWith(fontSize: 20)
                  : ThemeTextRegular.size.copyWith(
                      color: ThemeColors.black.withOpacity(0.5),
                    ),
            ),
          ),
        ),
        InkWell(
          onTap: () => setState(() {
            activeIndex = 1;
          }),
          child: Container(
            padding: activeIndex == 1 ? EdgeInsets.only(bottom: 5.h) : EdgeInsets.only(bottom: 8.h),
            decoration: activeIndex == 1
                ? const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: ThemeColors.orange,
                        width: 3,
                      ),
                    ),
                  )
                : null,
            child: Text(
              "Details",
              style: activeIndex == 1
                  ? ThemeTextBold.size.copyWith(fontSize: 20)
                  : ThemeTextRegular.size.copyWith(
                      color: ThemeColors.black.withOpacity(0.5),
                    ),
            ),
          ),
        ),
        InkWell(
          onTap: () => setState(() {
            activeIndex = 2;
          }),
          child: Container(
            padding: activeIndex == 2 ? EdgeInsets.only(bottom: 5.h) : EdgeInsets.only(bottom: 8.h),
            decoration: activeIndex == 2
                ? const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: ThemeColors.orange,
                        width: 3,
                      ),
                    ),
                  )
                : null,
            child: Text(
              "Features",
              style: activeIndex == 2
                  ? ThemeTextBold.size.copyWith(fontSize: 20)
                  : ThemeTextRegular.size.copyWith(
                      color: ThemeColors.black.withOpacity(0.5),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomCarouselWidget2 extends StatelessWidget {
  final DetailInfoModelRes detailInfo;
  const CustomCarouselWidget2({
    Key? key,
    required this.detailInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: detailInfo.images
          .map(
            (e) => Container(
              // margin: EdgeInsets.symmetric(horizontal: 10.w),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  // image: DecorationImage(image: CachedNetworkImageProvider(e), fit: BoxFit.fitHeight),
                  color: ThemeColors.white,
                  borderRadius: BorderRadius.circular(
                    20.r,
                  )),
              child: CachedNetworkImage(
                fit: BoxFit.fitHeight,
                // height: 700,
                imageUrl: e,
              ),
            ),
          )
          .toList(),
      options: CarouselOptions(
        viewportFraction: 0.8,
        // enableInfiniteScroll: false,
        aspectRatio: 16 / 9,
      ),
    );
  }
}
