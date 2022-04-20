import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onClickCallback;

  MainButton({
    this.title,
    this.onClickCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: onClickCallback,
        child: Text(
          title!,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                10,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
