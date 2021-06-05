import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'ClassMediaQuery.dart';



class ShimmerEffect extends StatefulWidget {
  @override
  _ShimmerEffectState createState() => _ShimmerEffectState();
}

class _ShimmerEffectState extends State<ShimmerEffect> {
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                enabled: _enabled,
                child: ListView.builder(
                  itemBuilder: (_, __) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 48.0,
                          height: 48.0,
                          color: Colors.white,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                height: 8.0,
                                color: Colors.white,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Container(
                                width: double.infinity,
                                height: 8.0,
                                color: Colors.white,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Container(
                                width: 40.0,
                                height: 8.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  itemCount: 6,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
  Widget carouselView(){

    return Container(
      height: 250,
      child: ListView(
        children: [
          Container(

          )
        ],
      ),

    );
  }

  Widget imgShowInGrid() {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: 9,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(
            left: ClassMediaQuery.blockSizeHorizontal * 5,
            right: ClassMediaQuery.blockSizeHorizontal * 5,
            bottom: ClassMediaQuery.blockSizeHorizontal * 5,
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),

            ],
          ),
        );
      },
    );
  }


}