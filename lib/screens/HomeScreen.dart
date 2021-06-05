import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:soft_prodigy_assignment/api_response/Response.dart';
import 'package:soft_prodigy_assignment/bloc/home_bloc.dart';
import 'package:soft_prodigy_assignment/utilities/ClassMediaQuery.dart';
import 'package:soft_prodigy_assignment/utilities/ShimmerEffect.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

final List<String> imgList = [];

class _HomeScreenState extends State<HomeScreen> {
  CarouselController _controller = CarouselController();
  HomeBloc request = HomeBloc();
  bool isGetAllImage = false;
  late Animation<Color> first;
  late Animation<Color> second;
  @override
  Widget build(BuildContext context) {
    request.getAllImage(context);
    return Scaffold(
      body: StreamBuilder(
        stream: request.streamController.stream,
        builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {
          if (snapshot.hasData) {
            imgList.addAll(snapshot.requireData.images);
            return root(snapshot.requireData);
          } else {
            return Container(child: ShimmerEffect());
          }
        },
      ),
    );

  }

  Widget root(Response data){
    return SingleChildScrollView(
        child: Column(
          children: [
            carouselView(data),
            SizedBox(height: 40,),
            imgShowInGrid()
          ],
        ),
      );
  }


  Widget carouselView(Response data){
    return Container(
      height: 250,
      child: ListView(
        children: [
          CarouselSlider(
              carouselController: _controller,
              items: imageSliders,
              //Slider Container properties
              options: CarouselOptions(
                enlargeCenterPage: true,
                height: 250,
              )),
        ],
      ),

    );
  }

  Widget imgShowInGrid() {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: imgList.length,
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
                child: Image.network(
                  imgList[index],
                  fit: BoxFit.cover,
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

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(
                        item,
                        width: 1000,
                        height: 450,
                      ),
                      // Image.network(item, fit: BoxFit.cover, width: 1000.0),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                        ),
                      ),
                    ],
                  )),
            ),
          ))
      .toList();
}
