import 'package:farmer_app/view/constants/constats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RoundedRectPrimaryButton extends StatefulWidget {
  const RoundedRectPrimaryButton(
      {Key? key,
      this.width,
      required this.text,
      required this.onpressed,
      this.color = kPrimaryTextColor,
      this.loading = false,
      this.textColor = Colors.white,
      this.height = 50,
      this.postfixIcon,
      this.prefixIcon,
      this.fontsize})
      : super(key: key);
  final double? width;
  final String text;
  final Color color;
  final Color textColor;
  final double? fontsize;
  final double height;
  final bool loading;
  final Widget? prefixIcon;
  final Widget? postfixIcon;
  final VoidCallback onpressed;

  @override
  State<RoundedRectPrimaryButton> createState() =>
      _RoundedRectPrimaryButtonState();
}

class _RoundedRectPrimaryButtonState extends State<RoundedRectPrimaryButton>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: InkWell(
        onTap: widget.onpressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                height: widget.height,
                width: widget.width,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: widget.color,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: kPrimaryTextColor.withOpacity(0.4))
                    ]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    widget.prefixIcon ?? const SizedBox(),
                    widget.loading
                        ? const SpinKitChasingDots(
                            color: Colors.white,
                            size: 30.0,
                          )
                        : Text(
                            widget.text,
                            style: TextStyle(
                                fontSize: widget.fontsize ?? 18,
                                fontWeight: FontWeight.bold,
                                color: widget.textColor),
                          ),
                    widget.postfixIcon ?? const SizedBox(),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
