import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:noviindus_task/screens/register.dart';

class PatientList extends StatefulWidget {
  const PatientList({super.key});

  @override
  State<PatientList> createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  TextEditingController searchname = TextEditingController();
  DateTime pickupDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 85.h,
        scrolledUnderElevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Image.asset(
              "asset/images/notification.png",
              height: 28.h,
              width: 28.w,
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100.h),
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 40.h,
                      width: 248.w,
                      child: TextField(
                        controller: searchname,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(.3))),
                            
                            prefixIcon: Icon(
                              Icons.search,
                              size: 33.sp,
                              color: const Color(0xff647A5F).withOpacity(.3),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Search for treatments",
                            hintStyle: TextStyle(
                              color: Colors.black.withOpacity(.2),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(8.r))),
                      ),
                    ),
                    Gap(7.w),
                    SizedBox(
                      height: 40.h,
                      child: Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.r)),
                                backgroundColor: Color(0xff006837)),
                            onPressed: () {},
                            child: Text(
                              textAlign: TextAlign.center,
                              "Search",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins"),
                            )),
                      ),
                    )
                  ],
                ),
                Gap(17.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sort by :",
                      style: TextStyle(
                          color: Color(0xff404040),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins"),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 11.w),
                      width: 169.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black.withOpacity(.3)),
                        borderRadius: BorderRadius.circular(33.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${DateFormat('dd-MM-yyyy').format(pickupDate)}",
                            style: TextStyle(
                              color: Color(0xff404040),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins",
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              DateTime? selectedDate = await showDatePicker(
                                context: context,
                                initialDate: pickupDate,
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2025),
                              );

                              if (selectedDate != null) {
                                setState(() {
                                  pickupDate = selectedDate;
                                });
                              }
                            },
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xff389A48),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Gap(11.h)
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 40.w, bottom: 20.h),
        child: Container(
            width: double.infinity,
            height: 50.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.r),
            ),
            child: FloatingActionButton(
              backgroundColor: Color(0xff006837),
              elevation: 0,
              child: Center(
                child: Text("Register Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                    )),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Register(),
                    ));
              },
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            children: [
              Gap(11.h),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => SizedBox(
                  height: 12.h,
                ),
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 166.h,
                    decoration: BoxDecoration(color: Color(0xffF1F1F1)),
                    child: Padding(
                      padding: EdgeInsets.only(top: 23.h),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Text("1.",
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Poppins",
                                        )),
                                    SizedBox(
                                      height: 45.h,
                                    )
                                  ],
                                ),
                                Gap(14.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Vikram Singh",
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Poppins",
                                        )),
                                    Text("Couple Combo Package (Rejuven...",
                                        style: TextStyle(
                                          color: Color(0xff006837),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w300,
                                          fontFamily: "Poppins",
                                        )),
                                    Gap(14.sp),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              "asset/images/calendar.png",
                                              height: 16.h,
                                              width: 16.w,
                                            ),
                                            Gap(3.w),
                                            Text("31/01/2024",
                                                style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(.5),
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Poppins",
                                                )),
                                          ],
                                        ),
                                        Gap(22.w),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              "asset/images/persons.png",
                                              height: 16.h,
                                              width: 16.w,
                                            ),
                                            Gap(3.w),
                                            Text("Jithesh",
                                                style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(.5),
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Poppins",
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: EdgeInsets.only(left: 50.w, right: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("View Booking details",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: "Poppins",
                                    )),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xff389A48),
                                  size: 18.sp,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
