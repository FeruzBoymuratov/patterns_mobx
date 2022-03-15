
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:patterns_mobx/stores/update_store.dart';

class UpdatePage extends StatefulWidget {
  static const String id = "update_page";
  String title, body;
  UpdatePage({Key? key, required this.title, required this.body}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  UpdateStore updateStore = UpdateStore();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateStore.isLoading = false;
    updateStore.titleInput = widget.title;
    updateStore.bodyInput = widget.body;
    updateStore.titleUpdateController.text = updateStore.titleInput;
    updateStore.bodyUpdateController.text = updateStore.bodyInput;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Observer(
        builder: (_) => Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                children: [
                  const SizedBox(height: 30,),
                  const Center(
                    child: Text('Title', style: TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(updateStore.titleInput,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    padding: const EdgeInsets.all(15),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [

                      //Title Input
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            controller: updateStore.titleUpdateController,
                            decoration: const InputDecoration(
                              label: Text("Title"),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),

                      //Title Ptichka
                      // Container(
                      //   decoration: BoxDecoration(
                      //     color: Colors.grey.shade200,
                      //     shape: BoxShape.circle,
                      //   ),
                      //   margin: const EdgeInsets.only(left: 10),
                      //   child: IconButton(
                      //     icon: const Icon(Icons.check),
                      //     onPressed: (){
                      //       updateStore.titleInput = updateStore.titleUpdateController.text;
                      //     },
                      //   ),
                      // ),
                    ],
                  ),

                  const SizedBox(height: 20,),

                  const Center(
                    child: Text('Body', style: TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold),),
                  ),
                  const SizedBox(height: 5,),

                  // Old BODY
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(15),
                      child: Text(updateStore.bodyInput)),
                  const SizedBox(height: 20,),
                  Row(
                    children: [

                      //Body Input
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            maxLength: null,
                            controller: updateStore.bodyUpdateController,
                            decoration: const InputDecoration(
                              label: Text("Body"),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),

                      //Body Ptichka
                      // Container(
                      //   decoration: BoxDecoration(
                      //     color: Colors.grey.shade200,
                      //     shape: BoxShape.circle,
                      //   ),
                      //   margin: const EdgeInsets.only(left: 10),
                      //   child: IconButton(
                      //     icon: const Icon(Icons.check),
                      //     onPressed: (){
                      //       updateStore.bodyInput = updateStore.bodyUpdateController.text;
                      //     },
                      //   ),
                      // ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue,
                    ),
                    child: TextButton(
                      onPressed: () {
                        updateStore.apiUpdatePost(context);
                        //print("${widget.title} is updated");
                      },
                      child: const Text("SUBMIT", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            updateStore.isLoading ?
            const Center(child: CircularProgressIndicator(),) :
            const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
