import 'dart:async';

import 'package:flutter/material.dart';
import 'package:soft_prodigy_assignment/api_response/Response.dart';
import 'package:soft_prodigy_assignment/bloc/base_bloc.dart';
import 'package:soft_prodigy_assignment/repo/HomeScreenRepo.dart';
import 'package:soft_prodigy_assignment/utilities/utility.dart';

class HomeBloc extends BaseBloc{
  HomeScreenRepo _repo = HomeScreenRepo();
  StreamController<Response> streamController = StreamController();


   getAllImage(BuildContext context,int count) async {
    if (await isConnectedToInternet()) {
      Response response = await _repo.getImage(count);
      //timer is used to show shimmer animation to little longer
      Timer(Duration(seconds: 2),
              ()=>
                  streamController.add(response)
      );
    }
  }

  @override
  dispose() {
    streamController.close();
  }

}