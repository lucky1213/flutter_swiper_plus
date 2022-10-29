import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:flutter_swiper_plus/src/transformer_page_view/buildin_transformers.dart';

import '../view_util.dart';

class ExampleTransformers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ExampleState();
  }
}

class _ExampleState extends State<ExampleTransformers>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> _animation10;
  late Animation<double> _animation11;
  late Animation<double> _animation12;
  late Animation<double> _animation13;

  _ExampleState();

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  void initState() {
    controller = new AnimationController(vsync: this);
    _animation10 = new Tween(begin: 0.0, end: 1.0).animate(controller);
    _animation11 = new Tween(begin: 0.0, end: 1.0).animate(controller);
    _animation12 = new Tween(begin: 0.0, end: 1.0).animate(controller);
    _animation13 = new Tween(begin: 0.0, end: 1.0).animate(controller);
    controller.animateTo(1.0, duration: new Duration(seconds: 3));

    super.initState();
  }

  Widget _buildDynamicCard() {
    return new Card(
      elevation: 2.0,
      color: Colors.white,
      child: new Stack(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
              ),
            ],
          ),
          new Column(
            children: <Widget>[
              new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(top: 40.0),
                        ),
                        new ScaleTransition(
                          scale: _animation10,
                          alignment: FractionalOffset.center,
                        ),
                      ],
                    ),
                    new Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(top: 160.0),
                        ),
                        new ScaleTransition(
                          scale: _animation11,
                          alignment: FractionalOffset.center,
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(1.0),
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(top: 160.0),
                        ),
                        new ScaleTransition(
                          scale: _animation12,
                          alignment: FractionalOffset.center,
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(top: 40.0),
                        ),
                        new ScaleTransition(
                          scale: _animation13,
                          alignment: FractionalOffset.center,
                        ),
                      ],
                    ),
                  ]),
              Container(
                padding: const EdgeInsets.all(10.0),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return new Container(
      color: Theme.of(context).primaryColorLight,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
              delegate: new SliverChildBuilderDelegate((c, i) {
                return new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[

                    /// transformer
                    // Default (not set transformer)
                    textWrap(text: "transformer: Default (not set transformer)", height: 30.0),
                    swiperWrap(),

                    // Default (not set transformer)
                    textWrap(text: "transformer: AccordionTransformer", height: 30.0),
                    swiperWrap(transformer: AccordionTransformer()),

                    // ThreeDTransformer
                    textWrap(text: "transformer: ThreeDTransformer", height: 30.0),
                    swiperWrap(transformer: ThreeDTransformer()),

                    // ZoomInPageTransformer
                    textWrap(text: "transformer: ZoomInPageTransformer", height: 30.0),
                    swiperWrap(transformer: ZoomInPageTransformer()),

                    // ZoomOutPageTransformer
                    textWrap(text: "transformer: ZoomOutPageTransformer", height: 30.0),
                    swiperWrap(transformer: ZoomOutPageTransformer()),

                    // DepthPageTransformer
                    textWrap(text: "transformer: DepthPageTransformer", height: 30.0),
                    swiperWrap(transformer: DeepthPageTransformer()),

                    // ScaleAndFadeTransformer
                    textWrap(text: "transformer: ScaleAndFadeTransformer", height: 30.0),
                    swiperWrap(transformer: ScaleAndFadeTransformer(fade: 0.3, scale: 0.1)),
                  ],
                );
              }, childCount: 1)
          )
        ],
      ),
    );
  }
}
