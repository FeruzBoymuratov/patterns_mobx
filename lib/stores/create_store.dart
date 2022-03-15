import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../models/post_model.dart';
import '../services/http_service.dart';
part 'create_store.g.dart';
class CreateStore = _CreateStore with _$CreateStore;
abstract class _CreateStore with Store {
  @observable bool isLoading = false;
  @observable var titleController = TextEditingController();
  @observable var bodyController = TextEditingController();
  @observable var idController = TextEditingController();
  apiCreatePost(BuildContext context){
    isLoading = true;
    @observable var title = titleController.text.trim().toString();
    @observable var body = bodyController.text.trim().toString();
    @observable var id = int.parse(idController.text.toString());
    Post post = Post(title: title, body: body, userId: id, id: id);
    @observable var response = Network.POST(Network.API_CREATE, Network.paramsCreate(post));
    isLoading = false;
    Navigator.pop(context, response);
  }
}