import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../themes/themes.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(context.accentColor).make(),
        "Tranding Products"
            .text
            .xl2
            .bold
            .color(context.theme.accentColor)
            .make(),
      ],
    );
  }
}
