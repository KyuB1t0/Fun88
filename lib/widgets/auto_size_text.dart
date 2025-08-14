import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun88/core/theme/od_colors.dart';
import 'package:fun88/core/theme/od_fonts.dart';

class AutoSizeInterText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fw;
  final int? maxlines;
  final TextAlign? align;
  const AutoSizeInterText({
    Key? key,
    required this.text,
    this.fontSize,
    this.color,
    this.maxlines,
    this.fw,
    this.align,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      maxLines: maxlines ?? 1,
      textAlign: align ?? TextAlign.center,
      style: FunTextStyles.interMedium.copyWith(
        fontSize: fontSize ?? 15,
        color: color ?? FunColors.background,
        fontWeight: fw ?? FontWeight.normal,
      ),
    );
  }
}
