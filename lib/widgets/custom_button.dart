import 'package:collabrats_mobile/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool isActive;
  final void Function() function;
  final Color buttonColor;
  final Color textColor;
  final Color borderColor;
  const CustomButton({
    super.key,
    required this.text,
    required this.function,
    this.buttonColor = AppColors.blueColor,
    this.textColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.isActive = true,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ButtonStyle(
        alignment: Alignment.center,
        fixedSize: WidgetStatePropertyAll(Size(size.width * 0.95, 50)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            side: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        backgroundColor: WidgetStateProperty.all(buttonColor),
      ),
      onPressed: function,
      child:
          isActive
              ? Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        text,
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium!.copyWith(
                          color: textColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ],
              )
              : SizedBox(
                height: 35,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballPulse,
                  colors: [textColor],
                ),
              ),
    );
  }
}
