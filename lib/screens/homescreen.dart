import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:noviindus_task/screens/patientlist.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                "asset/images/loginimage.png",
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 80.h,
                left: 155.w,
                child: Image.asset(
                  "asset/images/noviicon.png",
                  height: 80.h,
                  width: 84.w,
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login Or Register To Book Your Appointments",
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins"),
                ),
                Gap(30.h),
                login(
                  control: email,
                  title: "Email",
                  hinttitle: "Enter Your Email",
                ),
                Gap(25.h),
                login(
                  control: password,
                  title: "Password",
                  hinttitle: "Enter password",
                ),
                Gap(85.h),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .065,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9.r)),
                          backgroundColor: Color(0xff006837)),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PatientList(),));
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins"),
                      )),
                ),
                Gap(104.h),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        "By creating or logging into an account you are agreeing with our ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        fontFamily: "Poppins"),
                    children: [
                      TextSpan(
                        text: "Terms and Conditions",
                        style: TextStyle(
                            color: Color(0xff0028FC),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins"),
                      ),
                      TextSpan(
                        text: " and",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins"),
                      ),
                      TextSpan(
                        text: " Privacy Policy",
                        style: TextStyle(
                            color: Color(0xff0028FC),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class login extends StatelessWidget {
  const login({
    super.key,
    required this.control,
    required this.title,
    required this.hinttitle,
  });

  final TextEditingController control;
  final String title;
  final String hinttitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins"),
        ),
        Gap(8.h),
        SizedBox(
          height: 50.h,
          child: TextField(
            enabled: false,
            controller: control,
            decoration: InputDecoration(
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black.withOpacity(.1)),
                ),
                fillColor: Color(0xffF5F5F5),
                filled: true,
                hintText: hinttitle,
                hintStyle: TextStyle(
                    color: Colors.black.withOpacity(.4),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Inter"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9.r))),
          ),
        )
      ],
    );
  }
}
