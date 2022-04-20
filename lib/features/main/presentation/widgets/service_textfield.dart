import 'package:flutter/material.dart';
import 'package:yalla_harek/core/common/app_color.dart';
import 'package:yalla_harek/core/common/app_text.dart';

class ServiceTextField extends StatelessWidget {
  final Function? onChangeInput;
  final String? title;
  final String? hintText;
  final String? initialText;
  final Color? fillColor;
  final bool? isEnabled;
  final int? maxLines;
  final double textFieldWidth;
  final InputBorder? inputBorder;
  final TextStyle? textHintStyle;
  final double? heightWidget;
  final TextInputType? textInputType;

  const ServiceTextField({
    Key? key,
    this.title = "MyTitle",
    this.hintText = "nothing",
    this.onChangeInput,
    this.initialText = "",
    this.fillColor = MyColors.t13_edit_text_color,
    this.isEnabled = true,
    this.maxLines = 1,
    this.textFieldWidth = 100,
    this.inputBorder,
    this.heightWidget = 0,
    this.textHintStyle,
    this.textInputType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: MyText.myTitle(context)!.copyWith(
            color: MyColors.grey_100_,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: heightWidget!,
        ),
        Container(
          width: textFieldWidth,
          child: TextFormField(
            style: TextStyle(color: MyColors.grey_90),
            keyboardType: textInputType,
            maxLines: maxLines,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }
              return null;
            },
            onFieldSubmitted: (value) => onChangeInput!(value, title),
            onChanged: (value) => onChangeInput!(value, title),
            enabled: isEnabled,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: textHintStyle,
              enabledBorder: inputBorder,
              disabledBorder: inputBorder,
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xffB4B4B4),
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: MyColors.primary,
                  width: 2.0,
                ),
              ),
              border: inputBorder,
              fillColor: Colors.white,
              isDense: true,
            ),
          ),
        ),
      ],
    );
  }
}
