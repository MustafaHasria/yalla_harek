import 'package:flutter/material.dart';
import 'package:yalla_harek/core/common/app_color.dart';
import 'package:yalla_harek/core/common/app_text.dart';

class EditTextInput extends StatelessWidget {
  EditTextInput({
    this.title,
    this.hintText,
    this.onChangeInput,
    this.initialText = "",
    this.check = false,
    this.checkName = "",
    this.fillColor = MyColors.t13_edit_text_color,
    this.isEnabled = true,
    this.maxLines = 1,
    this.textInputType = TextInputType.text,
  });

  final Function? onChangeInput;
  final String? title;
  final String? hintText;
  final String? initialText;
  final Color fillColor;
  final bool check;
  final String checkName;
  final bool isEnabled;
  final int? maxLines;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    String isChecked = "no";
    controller.text = initialText!;
    bool thisIsEnabled = isEnabled;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      verticalDirection: VerticalDirection.down,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title!,
              style: MyText.myTitle(context)!.copyWith(
                color: MyColors.grey_100_,
                fontSize: 16.0,
              ),
            ),
            check == true
                ? Row(
              children: [
                Switch(
                  value: isChecked == "yes" ? false : true,
                  onChanged: (value) {
                    thisIsEnabled = !thisIsEnabled;
                  },
                  activeColor: MyColors.primary,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  checkName,
                  style: MyText.body1(context),
                ),
              ],
            )
                : Container(),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        TextFormField(
          style: MyText.myTitle(context)!.copyWith(
            color: MyColors.grey_100_,
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
          ),
          keyboardType: textInputType,
          maxLines: maxLines,
          validator: (value) {
            if (value == null || value.isEmpty) {
              print("Show me $value");
              return 'This field is required';
            }
            print("Show me real $value");
            return null;
          },
          initialValue: initialText,
          onChanged: (value) => onChangeInput!(value),
          enabled: thisIsEnabled,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: MyText.body1(context)!.copyWith(
              color: Color(0xffB4B4B4),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xffB4B4B4),
                width: 1.0,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide:
              const BorderSide(color: Color(0xffB4B4B4), width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyColors.primary, width: 2.0),
            ),
            fillColor: Colors.white,
            isDense: true,
          ),
        ),
      ],
    );
  }
}
