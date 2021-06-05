import 'dart:async';

import 'package:flutter/material.dart';
import 'package:soft_prodigy_assignment/api_response/Response.dart';
import 'package:soft_prodigy_assignment/bloc/base_bloc.dart';
import 'package:soft_prodigy_assignment/repo/HomeScreenRepo.dart';
import 'package:soft_prodigy_assignment/utilities/utility.dart';

class HomeBloc extends BaseBloc{
  HomeScreenRepo _repo = HomeScreenRepo();
  StreamController<Response> streamController = StreamController();
//If the method intentionally returns null at the end,
// then change the return type so that it’s valid to return null:
  Future<Response> getAllImage(BuildContext context) async {
    if (await isConnectedToInternet()) {
      Response response = await _repo.getImage();
      streamController.add(response);
    } else {
      hideLoader(context);
    }
    throw '';
  }

  @override
  dispose() {
    streamController.close();
  }

}