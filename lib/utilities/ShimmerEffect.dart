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
        width: ClassMediaQuery.screenWidth,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 15,),
                        carouselView(),
                        SizedBox(height: 15,),
                        imgShowInGrid()
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
    return Row(
      children: [
        Container(
          width: ClassMediaQuery.blockSizeHorizontal*12,
          height: 220,
          color: Colors.white,

        ),
        SizedBox(width: ClassMediaQuery.blockSizeHorizontal*10 ,),
        Container(
          width: ClassMediaQuery.blockSizeHorizontal*54,
          height: 250,
          color: Colors.white,

        ),
        SizedBox(width: ClassMediaQuery.blockSizeHorizontal*10 ,),
        Container(
          width: ClassMediaQuery.blockSizeHorizontal*12,
          height: 220,
          color: Colors.white,

        ),
      ],
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
                  width: 200,
                  height: 200,
                  color: Colors.white,

                ),
              ),

            ],
          ),
        );
      },
    );
  }


}