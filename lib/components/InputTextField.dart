import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'TitleText1.dart';

class InputTextField extends StatelessWidget {
  InputTextField(
      {Key? key,
      required this.hintText,
      required this.labelText,
      required this.maxline,
      required this.widget})
      : super(key: key);

  String hintText, labelText;
  static Color hintTextColor = Colors.black;
  final Widget? widget;
  int maxline;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TitleText1(
            text: this.labelText,
            fontFamily: 'Nunito Sans',
            fontSize: 15.sp,
            fontWeight: FontWeight.normal,
            r: 37,
            g: 49,
            b: 65),
        Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: this.widget == null ? false : true,
                    autofocus: false,
                    decoration: InputDecoration(
                      suffixIcon:
                          widget == null ? null : Container(child: widget),
                      hintText: this.hintText,
                      hintStyle: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: 'Nunito Sans',
                        color: this.widget == null
                            ? Color.fromARGB(255, 189, 189, 189)
                            : hintTextColor,
                      ),
                      border: OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 189, 189, 189),
                            width: 1.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 189, 189, 189),
                            width: 1.0),
                      ),
                      fillColor: Color.fromARGB(255, 232, 232, 232),
                      filled: true,
                    ),
                    maxLines: this.maxline,
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
