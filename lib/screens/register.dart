import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  DateTime selectedDate = DateTime.now();

  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController branch = TextEditingController();
  String paymentOption = 'Cash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 95.h,
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
          preferredSize: Size.fromHeight(22.h),
          child: Padding(
            padding: EdgeInsets.only(left: 34.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Register",
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins"),
                ),
                Gap(22.h),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textfieldswidget(
                name: name,
                hint: "Enter your full name",
                title: "Name",
              ),
              textfieldswidget(
                name: number,
                hint: "Enter your Whatsapp number",
                title: "Whatsapp Number",
              ),
              textfieldswidget(
                name: address,
                hint: "Enter your full address",
                title: "Address",
              ),
              textfieldswidget(
                name: location,
                hint: "Choose your location",
                title: "Location",
                suffix: SizedBox(),
                suffixico: Icons.keyboard_arrow_down,
              ),
              textfieldswidget(
                name: branch,
                hint: "Select the branch",
                title: "Branch",
                suffix:const SizedBox(),
                suffixico: Icons.keyboard_arrow_down,
              ),
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r)),
                      backgroundColor: Color(0xffC4E1C9)),
                  child: Text('+ Add Treatments',
                  style: TextStyle(
                    color: Colors.black,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Inter")
                  ),
                ),
              ),
              textfieldswidget(
                name: address,
                title: "Total Amount",
              ),
              textfieldswidget(
                name: address,
                title: "Discount Amount",
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Payment Option'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Cash',
                            groupValue: paymentOption,
                            onChanged: (value) {
                              setState(() {
                                paymentOption = value!;
                              });
                            },
                          ),
                          Text('Cash',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Poppins")),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Card',
                            groupValue: paymentOption,
                            onChanged: (value) {
                              setState(() {
                                paymentOption = value!;
                              });
                            },
                          ),
                          Text('Card',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Poppins")),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'UPI',
                            groupValue: paymentOption,
                            onChanged: (value) {
                              setState(() {
                                paymentOption = value!;
                              });
                            },
                          ),
                          Text('UPI',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Poppins")),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              textfieldswidget(
                name: address,
                title: "Advance Amount",
              ),
              textfieldswidget(
                name: address,
                title: "Balance Amount",
              ),
              textfieldswidget(
                name: branch,
                hint: DateFormat('dd-MM-yyyy').format(selectedDate),
                title: "Treatment Date",
                suffix: SizedBox(),
                onpress: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2025),
                  );

                  if (pickedDate != null && pickedDate != selectedDate) {
                    setState(() {
                      selectedDate = pickedDate;
                    });
                  }
                },
                suffixico: Icons.calendar_today,
              ),
              Text("Treatment Time",
                  style: TextStyle(
                      color: Color(0xff404040),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Poppins")),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50.h,
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(.2))),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(.2))),
                          hintText: 'Hour',
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(.4),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w300,
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black12)),
                          filled: true,
                          fillColor: Color(0xffF5F5F5),
                        ),
                        items: List.generate(24, (index) {
                          return DropdownMenuItem(
                            value: index.toString(),
                            child: Text(index.toString().padLeft(2, '0')),
                          );
                        }),
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  Gap(8.w),
                  Expanded(
                    child: SizedBox(
                      height: 50.h,
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(.2))),
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(.4),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w300,
                          ),
                          hintText: 'Minutes',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Color(0xffF5F5F5),
                        ),
                        items: List.generate(60, (index) {
                          return DropdownMenuItem(
                            value: index.toString(),
                            child: Text(
                              index.toString().padLeft(2, '0'),
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        }),
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                ],
              ),
              Gap(50.h),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .065,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9.r)),
                        backgroundColor: Color(0xff006837)),
                    onPressed: () {},
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins"),
                    )),
              ),
              Gap(50.h),
            ],
          ),
        ),
      ),
    );
  }
}

class textfieldswidget extends StatelessWidget {
  const textfieldswidget({
    super.key,
    required this.name,
    required this.title,
    this.hint,
    this.suffix,
    this.suffixico,
    this.onpress,
  });

  final TextEditingController name;
  final String title;
  final String? hint;
  final Widget? suffix;
  final IconData? suffixico;
  final void Function()? onpress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
                color: Color(0xff404040),
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                fontFamily: "Poppins")),
        Gap(6.h),
        SizedBox(
          height: 50.h,
          width: double.infinity,
          child: TextField(
            controller: name,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.black.withOpacity(.1))),
                suffixIcon: suffix != null
                    ? GestureDetector(
                        onTap: onpress,
                        child: Icon(
                          suffixico,
                          color: Color(0xff389A48),
                        ),
                      )
                    : SizedBox(),
                fillColor: Color(0xffF5F5F5),
                filled: true,
                hintText: hint,
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(.4),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(8.r))),
          ),
        ),
      ],
    );
  }
}
