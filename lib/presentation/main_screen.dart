import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_project/bloc/main_bloc/main_bloc.dart';
import 'package:ecommerce_project/data/models/main_info_model_res.dart';
import 'package:ecommerce_project/utils/constants.dart';
import 'package:ecommerce_project/utils/formats.dart';
import 'package:ecommerce_project/utils/theme_colors.dart';
import 'package:ecommerce_project/utils/theme_shadows.dart';
import 'package:ecommerce_project/utils/theme_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int activeIndex = 0;
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      BlocProvider.of<MainBloc>(context).add(GetMainInfoEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBarWidget(),
      backgroundColor: ThemeColors.bg,
      body: BlocConsumer<MainBloc, MainState>(
        listener: (context, state) {
          if (state is MainError) {
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
          if (state is MainLoaded) {
            return Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 22.h),
              child: CustomScrollView(
                slivers: [
                  const CustomSliverAppBar(),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    const CustomRowWidget(
                      textLeft: "Select Category",
                      textRight: "view all",
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                  ])),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 100.h,
                      child: ListView.separated(
                        // shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Column(
                          children: [
                            InkWell(
                              splashColor: ThemeColors.transparent,
                              focusColor: ThemeColors.transparent,
                              hoverColor: ThemeColors.transparent,
                              onTap: () {
                                setState(() {
                                  activeIndex = index;
                                });
                              },
                              child: Container(
                                width: 71.w,
                                height: 71.h,
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    ThemeShadows.commonShadow,
                                  ],
                                  shape: BoxShape.circle,
                                  color: activeIndex == index ? ThemeColors.orange : ThemeColors.white,
                                ),
                                child: SvgPicture.asset(
                                  "assets/icons/${Constants.mainCircleAssetNames[index]}",
                                  width: 18.w,
                                  fit: BoxFit.none,
                                  height: 30.h,
                                  color: activeIndex == index ? ThemeColors.white : ThemeColors.iconGray,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 7.h,
                            ),
                            Text(
                              Constants.mainAssetNames[index],
                              style: ThemeTextMedium.size.copyWith(
                                fontSize: 15,
                                color: activeIndex == index ? ThemeColors.orange : ThemeColors.blue,
                              ),
                            ),
                          ],
                        ),
                        itemCount: Constants.mainCircleAssetNames.length,
                        separatorBuilder: (BuildContext context, int index) => SizedBox(
                          width: 23.w,
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    SizedBox(
                      height: 35.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 34.h,
                              child: CustomTextFromField(
                                controller: searchController,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 11.w,
                          ),
                          Container(
                            padding: const EdgeInsets.all(9),
                            width: 34,
                            height: 34,
                            decoration: const BoxDecoration(shape: BoxShape.circle, color: ThemeColors.orange),
                            child: SvgPicture.asset(
                              "assets/icons/filter_white.svg",
                              height: 14,
                              width: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    const CustomRowWidget(
                      textLeft: "Hot sales",
                      textRight: "see more",
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomCarouselWidget(
                      homeStoreList: state.mainInfoModelRes.home_store,
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    const CustomRowWidget(
                      textLeft: "Best Seller",
                      textRight: "see more",
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                  ])),
                  CustomSliverGridWidget(
                    bestSellInfo: state.mainInfoModelRes.best_seller,
                  ),
                ],
              ),
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

class CustomBottomNavigationBarWidget extends StatelessWidget {
  const CustomBottomNavigationBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 68.w,
        vertical: 26.h,
      ),
      height: 72.h,
      decoration: BoxDecoration(
          color: ThemeColors.blue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 8,
                width: 8,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ThemeColors.white,
                ),
              ),
              SizedBox(
                width: 7.w,
              ),
              Text(
                "Explorer",
                style: ThemeTextBold.size.copyWith(
                  fontSize: 15,
                  color: ThemeColors.white,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () => Navigator.pushNamed(context, AppRoutesString.routeToMyCartScreen),
            splashColor: ThemeColors.transparent,
            focusColor: ThemeColors.transparent,
            hoverColor: ThemeColors.transparent,
            child: SvgPicture.asset(
              'assets/icons/bag_gray.svg',
              height: 18.h,
              width: 18.w,
            ),
          ),
          InkWell(
            splashColor: ThemeColors.transparent,
            focusColor: ThemeColors.transparent,
            hoverColor: ThemeColors.transparent,
            child: SvgPicture.asset(
              'assets/icons/heart_white.svg',
              height: 18.h,
              width: 18.w,
            ),
          ),
          InkWell(
            splashColor: ThemeColors.transparent,
            focusColor: ThemeColors.transparent,
            hoverColor: ThemeColors.transparent,
            child: SvgPicture.asset(
              'assets/icons/profile_white.svg',
              height: 18.h,
              width: 18.w,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSliverGridWidget extends StatelessWidget {
  final List<MainInfoModelBestSellerRes> bestSellInfo;

  const CustomSliverGridWidget({
    Key? key,
    required this.bestSellInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 227.h,
        crossAxisSpacing: 12.w,
        childAspectRatio: 2.0,
      ),
      delegate: SliverChildBuilderDelegate(
          (context, index) => InkWell(
                splashColor: ThemeColors.transparent,
                focusColor: ThemeColors.transparent,
                hoverColor: ThemeColors.transparent,
                onTap: () => Navigator.pushNamed(context, AppRoutesString.routeToDetailScreen),
                child: Container(
                  margin: EdgeInsets.only(bottom: 12.h),
                  decoration: BoxDecoration(
                      color: ThemeColors.white,
                      boxShadow: const [
                        ThemeShadows.commonShadow,
                      ],
                      borderRadius: BorderRadius.circular(
                        10.r,
                      )),
                  child: Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl: bestSellInfo[index].picture,
                            height: 168.h,
                            fit: BoxFit.fill,
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: 21.w),
                            child: Row(
                              children: [
                                Text(
                                  customMoneyFormat(bestSellInfo[index].discount_price.toString()),
                                  style: ThemeTextBold.size.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: 7.w,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 4.h),
                                  child: Text(
                                    customMoneyFormat(bestSellInfo[index].price_without_discount.toString()),
                                    style: ThemeTextMedium.size.copyWith(
                                      fontSize: 10,
                                      color: ThemeColors.gray,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 21.w,
                                ),
                                child: Text(
                                  bestSellInfo[index].title,
                                  style: ThemeTextRegular.size.copyWith(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // SizedBox(
                          //   height: 15.h,
                          // ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(7),
                        margin: EdgeInsets.only(top: 11.h, right: 16.w),
                        decoration: const BoxDecoration(
                          boxShadow: [ThemeShadows.commonShadow2],
                          shape: BoxShape.circle,
                          color: ThemeColors.white,
                        ),
                        width: 25,
                        height: 25,
                        child: SvgPicture.asset(
                          bestSellInfo[index].is_favorites
                              ? "assets/icons/heart_red_fill.svg"
                              : 'assets/icons/heart_red.svg',
                          // height: 10.h,
                          // width: 11.w,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          childCount: bestSellInfo.length),
    );
  }
}

class CustomCarouselWidget extends StatelessWidget {
  final List<MainInfoModelHomeStoreRes> homeStoreList;
  const CustomCarouselWidget({
    Key? key,
    required this.homeStoreList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: homeStoreList
          .map(
            (e) => Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              padding: EdgeInsets.only(right: 5.w),
              width: double.infinity,
              height: 182.h,
              decoration: BoxDecoration(
                  image: DecorationImage(image: CachedNetworkImageProvider(e.picture)),
                  // color: ThemeColors.blue,
                  borderRadius: BorderRadius.circular(
                    10.r,
                  )),
              child: Padding(
                padding: EdgeInsets.only(left: 25.w, top: 14.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (e.is_new)
                      Container(
                        alignment: Alignment.center,
                        // padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 7.h),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ThemeColors.orange,
                        ),
                        width: 27,
                        height: 27,
                        child: Text(
                          'New',
                          style: ThemeTextBold.size.copyWith(
                            fontSize: 10,
                            color: ThemeColors.white,
                          ),
                        ),
                      )
                    else
                      const SizedBox(
                        height: 27,
                        width: 27,
                      ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Text(
                      e.title,
                      style: ThemeTextBold.size.copyWith(
                        color: ThemeColors.white,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      e.subtitle,
                      style: ThemeTextRegular.size.copyWith(
                        color: ThemeColors.white,
                        fontSize: 11,
                      ),
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r))),
                            backgroundColor: MaterialStateProperty.all(ThemeColors.white),
                            minimumSize: MaterialStateProperty.all(Size(98.w, 23.h)),
                            padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                              horizontal: 27.w,
                              vertical: 5.h,
                            ))),
                        child: Text(
                          "Buy now!",
                          style: ThemeTextBold.size.copyWith(fontSize: 11),
                        ))
                  ],
                ),
              ),
            ),
          )
          .toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        // enableInfiniteScroll: false,
        aspectRatio: 16 / 9,
      ),
    );
  }
}

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: ThemeColors.bg,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/geo_red.svg',
            width: 12.w,
            height: 15.h,
          ),
          SizedBox(
            width: 11.w,
          ),
          Text(
            "Zihuatanejo, Gro",
            style: ThemeTextMedium.size.copyWith(
              fontSize: 15,
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          InkWell(
            splashColor: ThemeColors.transparent,
            focusColor: ThemeColors.transparent,
            hoverColor: ThemeColors.transparent,
            onTap: () async {},
            child: SvgPicture.asset(
              'assets/icons/arrow_down_gray.svg',
              width: 10.w,
              height: 5.h,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () async {
            await showModalBottomSheet(
                barrierColor: Colors.black.withAlpha(1),
                isDismissible: false,
                isScrollControlled: true,
                // useRootNavigator: true,
                backgroundColor: Colors.transparent,
                builder: (_) => _builder(context),
                context: context);
          },
          icon: SvgPicture.asset(
            'assets/icons/filter_black.svg',
            width: 11.w,
            height: 13.h,
          ),
        ),
      ],
    );
  }

  Widget _builder(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 24.h, bottom: 44.h),
      height: 375.h,
      decoration: BoxDecoration(
        color: ThemeColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
        boxShadow: [ThemeShadows.commonShadow3],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                    child: SvgPicture.asset("assets/icons/close_white.svg"),
                  ),
                ),
                Text(
                  "Filter options",
                  style: ThemeTextMedium.size.copyWith(fontSize: 18),
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r))),
                        backgroundColor: MaterialStateProperty.all(ThemeColors.orange),
                        minimumSize: MaterialStateProperty.all(Size(86.w, 37.h)),
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 7.h,
                        ))),
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        "Done",
                        style: ThemeTextMedium.size.copyWith(
                          fontSize: 18,
                          color: ThemeColors.white,
                        ),
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Brand",
              style: ThemeTextMedium.size.copyWith(fontSize: 18),
            ),
            SizedBox(
              height: 12.h,
            ),
            const CustomDropDown(
              itemList: ["Samsung", "Apple"],
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Price",
              style: ThemeTextMedium.size.copyWith(fontSize: 18),
            ),
            SizedBox(
              height: 12.h,
            ),
            CustomDropDown(
              itemList: [
                "${customMoneyFormat("500")} - ${customMoneyFormat("100")}",
                "${customMoneyFormat("1000")} - ${customMoneyFormat("2000")}",
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Size",
              style: ThemeTextMedium.size.copyWith(fontSize: 18),
            ),
            SizedBox(
              height: 12.h,
            ),
            const CustomDropDown(
              itemList: ["4.5 to 5.5 inches", "5.5 to 6.5 inches"],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDropDown extends StatefulWidget {
  final List<String> itemList;
  const CustomDropDown({
    Key? key,
    required this.itemList,
  }) : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  List<DropdownMenuItem<String>> items = [];
  String? valueD;

  @override
  Widget build(BuildContext context) {
    valueD ??= widget.itemList[0];
    if (items.isEmpty) {
      items = widget.itemList
          .map<DropdownMenuItem<String>>((e) => DropdownMenuItem(
                value: e,
                child: Text(
                  e,
                  softWrap: true,
                  style: ThemeTextRegular.size.copyWith(fontSize: 14),
                ),
              ))
          .toList();
    }
    debugPrint("is equal ${valueD == items.first.value}");

    return ButtonTheme(
      height: 37.h,
      padding: EdgeInsets.zero,
      alignedDropdown: true,
      child: DropdownButtonFormField(
        isDense: true,
        elevation: 0,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            gapPadding: 0,
            borderSide: const BorderSide(color: ThemeColors.borderGray, width: 1),
            borderRadius: BorderRadius.circular(5.r),
          ),
          border: OutlineInputBorder(
            gapPadding: 7,
            borderSide: const BorderSide(color: ThemeColors.borderGray, width: 1),
            borderRadius: BorderRadius.circular(5.r),
          ),
          filled: true,
          fillColor: ThemeColors.white,
        ),
        isExpanded: true,
        value: valueD,
        items: items,
        onChanged: (val) => setState(() {
          valueD = val.toString();
        }),
      ),
    );
  }
}

class CustomRowWidget extends StatelessWidget {
  final String textLeft;
  final String textRight;
  const CustomRowWidget({
    Key? key,
    required this.textLeft,
    required this.textRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textLeft,
            style: ThemeTextBold.size.copyWith(
              fontSize: 24,
            ),
          ),
          Text(
            textRight,
            style: ThemeTextRegular.size.copyWith(
              fontSize: 15,
              color: ThemeColors.orange,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextFromField extends StatefulWidget {
  TextEditingController controller;

  CustomTextFromField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomTextFromField> createState() => _CustomTextFromFieldState();
}

class _CustomTextFromFieldState extends State<CustomTextFromField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.only(
              top: 9.h,
              bottom: 9.h,
            ),
            child: InkWell(
                focusNode: FocusNode(),
                splashColor: ThemeColors.transparent,
                focusColor: ThemeColors.transparent,
                hoverColor: ThemeColors.transparent,
                onTap: () {},
                child: SvgPicture.asset(
                  "assets/icons/search_red.svg",
                  height: 16.h,
                  width: 16.w,
                )),
          ),
          filled: true,
          fillColor: ThemeColors.white,
          hintText: "Search",
          hintStyle: ThemeTextRegular.size.copyWith(fontSize: 12, color: ThemeColors.blue.withOpacity(0.5)),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(50.r),
          ),
          contentPadding: EdgeInsets.only(
            top: 10.h,
            bottom: 9.h,
            left: 24.w,
            right: 24.w,
          )),
      style: ThemeTextRegular.size.copyWith(
        fontSize: 14,
      ),
      controller: widget.controller,
    );
  }
}
