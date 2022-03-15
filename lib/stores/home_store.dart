
import 'package:mobx/mobx.dart';

import '../models/post_model.dart';
import '../services/http_service.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {

  @observable bool isLoading = false;
  @observable List<Post> items = [];

  Future apiPostList() async{
    isLoading = true;
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if(response != null){
      items = Network.parsePostList(response);
    }else{
      items = [];
    }
    isLoading = false;

  }

  Future apiPostDelete(Post post) async {
    isLoading = true;
    var response = await Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    if(response != null){
      apiPostList();
    }
    isLoading = false;
  }

}