import 'package:example/src/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';

///border线
borderLine(BuildContext context, {bottom: true, top: false, color: Colors.grey}) {

  BorderSide borderSide = BorderSide(width: 0.5, color: color);
  return Border(
      bottom: bottom ? borderSide : BorderSide.none,
      top: top ? borderSide : BorderSide.none
  );
}

///间距
SizedBox hiSpace({double height: 1, double width: 1}) {
  return SizedBox(height: height, width: width);
}

Widget textWrap({text: "Default", height: 1.0, textAlign: TextAlign.center}) {
  return Container(
      height: height,
      child: Center(
        child: Text(
          text,
          textAlign: textAlign,
        ),
      )
  );
}

Widget swiperWrap ({
  transformer,
  layout,
  customLayoutOption,
  itemWidth: 300.0,
  itemHeight: 200.0
}){
  return Container(
    color: Colors.black87,
    child: SizedBox(
      height: 300.0,
      width: double.infinity,
      child: new Swiper(
        transformer: transformer,
        layout: layout,
        itemCount: 3,
        itemWidth: itemWidth,
        itemHeight: itemHeight,
        itemBuilder: buildItem,
      )
    )
  );
}

Widget buildItem(BuildContext context, int index) {
  return ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    child: Image.asset(
      images[index % images.length],
      fit: BoxFit.fill,
    ),
  );
}
