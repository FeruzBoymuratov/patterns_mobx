
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../stores/create_store.dart';

class CreatePage extends StatefulWidget {
  static const String id = 'create_page';
  const CreatePage({Key? key}) : super(key: key);
  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  CreateStore createStore = CreateStore();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //int newValue;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Observer(
        builder: (_) => Stack(
          children:[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Title ni kiriting!'),
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  margin: const EdgeInsets.all(15),
                  width: double.infinity,
                  height: 50,
                  child: TextField(
                    controller: createStore.titleController,
                    decoration: const InputDecoration(
                      hintText: 'Title',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const Text('Body ni kiriting!'),
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  margin: const EdgeInsets.all(15),
                  width: double.infinity,
                  height: 50,
                  child: TextField(
                    controller: createStore.bodyController,
                    decoration: const InputDecoration(
                      hintText: 'Body',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const Text('User ID ni kiriting!'),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/2),
                  ),
                  width: double.infinity,
                  child: TextField(
                    controller: createStore.idController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      border: InputBorder.none,

                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextButton(
                      child: const Text('OK', style: TextStyle(color: Colors.white),),
                      onPressed: () {
                        createStore.apiCreatePost(context);
                      }
                  ),
                ),
              ],
            ),
            createStore.isLoading ?
            const Center(
                child: CircularProgressIndicator()) :
            const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
