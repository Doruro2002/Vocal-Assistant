import 'package:flutter/material.dart';

class VocalAssistantApp extends StatefulWidget {
  const VocalAssistantApp({super.key});

  @override
  State<VocalAssistantApp> createState() => _VocalAssistantAppState();
}

class _VocalAssistantAppState extends State<VocalAssistantApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Vocal Assisant",)),
      ),
      body: Center(
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                child: Text("Your Speech"),
              ),
              SizedBox(
                width: 400,
                child: TextFormField(
                  decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(177, 195, 9, 9))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(177, 175, 22, 22),
                                      width: 0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.green,
                                width: 0,
                              ))),
                ),
              )
            ],
          ),
        ),
      ),
      // body: ,
      floatingActionButton: ElevatedButton(
          onPressed: (){

          },
          child:const  Icon(Icons.mic,
          color: Colors.green,)
      ),
    );
  }
}
