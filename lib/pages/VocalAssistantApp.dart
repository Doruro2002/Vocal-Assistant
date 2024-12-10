import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
class VocalAssistantApp extends StatefulWidget {
  const VocalAssistantApp({super.key});

  @override
  State<VocalAssistantApp> createState() => _VocalAssistantAppState();
  
}

class _VocalAssistantAppState extends State<VocalAssistantApp> {
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';
  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }
  @override
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }
void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }
  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

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
              Text(_lastWords),
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
          onPressed: ()async{
          _speechToText.isListening? _stopListening():_startListening();
          },
          child:  Icon(
            _speechToText.isNotListening ? Icons.mic : Icons.mic_off,color: _speechToText.isNotListening  ?Colors.red:Colors.blue,
          )
      ),
    );
  }
}
