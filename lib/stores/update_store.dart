
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../models/post_model.dart';
import '../pages/home_page.dart';
import '../services/http_service.dart';

part 'update_store.g.dart';

class UpdateStore = _UpdateStore with _$UpdateStore;

abstract class _UpdateStore with Store {
  
  String titleInput = "", bodyInput = "";
  var response;
  var titleController = TextEditingController();
  var bodyController = TextEditingController();
  var titleUpdateController = TextEditingController();
  var bodyUpdateController = TextEditingController();

  bool isLoading = false;

  apiUpdatePost(BuildContext context){
    isLoading = true;
    Post post = Post(title: titleController.text, body: bodyController.text, id: Random().nextInt(10), userId: Random().nextInt(10));
    var response = Network.PUT(Network.API_UPDATE, Network.paramsUpdate(post));

    if(response != null){
      Navigator.pushNamedAndRemoveUntil(context, HomePage.id, (route) => false);
    }
    isLoading = false;
  }
}