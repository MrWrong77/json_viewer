import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JSON Formatter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

// class JsonFormatterPage extends StatefulWidget {
//   const JsonFormatterPage({super.key});

//   @override
//   _JsonFormatterPageState createState() => _JsonFormatterPageState();
// }

// class _JsonFormatterPageState extends State<JsonFormatterPage> {
//   final TextEditingController _controller = TextEditingController();
//   bool _isLoading = false;
//   String _errorMessage = '';
//   TreeViewController _treeViewController = TreeViewController(children: []);
//   // 将 JSON 字符串转换为树形节点
//   List<Node> _parseJsonToNodes(dynamic data, {String parentKey = ''}) {
//     List<Node> nodes = [];

//     if (data is Map) {
//       data.forEach((key, value) {
//         String nodeKey = parentKey.isEmpty ? key : '$parentKey.$key';
//         if (value is Map || value is List) {
//           nodes.add(Node(
//             key: nodeKey,
//             label: key,
//             children: _parseJsonToNodes(value, parentKey: nodeKey),
//             icon: Icons.folder,
//           ));
//         } else {
//           nodes.add(Node(
//             key: nodeKey,
//             label: '$key: $value',
//             icon: Icons.insert_drive_file,
//           ));
//         }
//       });
//     } else if (data is List) {
//       for (int i = 0; i < data.length; i++) {
//         String nodeKey = '$parentKey[$i]';
//         nodes.add(Node(
//           key: nodeKey,
//           label: '[$i]',
//           children: _parseJsonToNodes(data[i], parentKey: nodeKey),
//           icon: Icons.list,
//         ));
//       }
//     }

//     return nodes;
//   }

//   Future<String> formatJson(String input) async {
//     final response = await http.post(
//       Uri.parse('http://localhost:8080/formatjson'),
//       body: {'json': input},
//     );

//     if (response.statusCode == 200) {
//       return response.body;
//     } else {
//       throw Exception('Failed to format JSON: ${response.body}');
//     }
//   }

//   Future<void> _handleFormat() async {
//     setState(() {
//       _isLoading = true;
//       _errorMessage = '';
//     });

//     try {
//       final formatted = await formatJson(_controller.text);
//       final parsedJson = json.decode(formatted);
//       final nodes = _parseJsonToNodes(parsedJson);

//       setState(() {
//         _treeViewController = TreeViewController(
//           children: nodes,
//           selectedKey: _treeViewController.selectedKey,
//         );
//       });
//     } catch (e) {
//       // 错误处理
//     }

//     try {
//       final formatted = await formatJson(_controller.text);
//       setState(() => _controller.text = formatted);
//     } catch (e) {
//       setState(() => _errorMessage = e.toString());
//     } finally {
//       setState(() => _isLoading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('JSON Formatter')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: TextField(
//                 controller: _controller,
//                 maxLines: null,
//                 expands: true,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Enter JSON',
//                   alignLabelWithHint: true,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: TreeView(
//                   controller: _treeViewController,
//                   onNodeTap: (key) {
//                     setState(() {
//                       _treeViewController.children.contains(key)
//                           ? _treeViewController.children
//                               .where((k) => k != key)
//                               .toList()
//                           : [
//                               ..._treeViewController.children
//                                   .cast<Node<dynamic>>(),
//                               key
//                             ];
//                     });
//                   },
//                   theme: const TreeViewTheme(
//                     expanderTheme: ExpanderThemeData(
//                       type: ExpanderType.caret,
//                       modifier: ExpanderModifier.none,
//                       position: ExpanderPosition.start,
//                       color: Colors.grey,
//                     ),
//                     labelStyle: TextStyle(fontFamily: 'Monospace'),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _isLoading ? null : _handleFormat,
//               child: _isLoading
//                   ? const CircularProgressIndicator()
//                   : const Text('Format JSON'),
//             ),
//             if (_errorMessage.isNotEmpty)
//               Padding(
//                 padding: const EdgeInsets.only(top: 16.0),
//                 child: Text(
//                   _errorMessage,
//                   style: const TextStyle(color: Colors.red),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }




// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:desktop_drop/desktop_drop.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter_json_viewer/flutter_json_viewer.dart';

// const testStringObj = '''{
//       "ParaString": "www.apigj.com",
//       "ParaObject": {
//         "ObjectType": "Api",
//         "ObjectName": "Manager",
//         "ObjectId": "Code",
//         "FatherId": "Generator"
//       },
//       "ParaLong": 6222123188092928,
//       "ParaInt": 5303,
//       "ParaFloat": -268311581425.664,
//       "ParaBool": false,
//       "ParaArrString": [
//         "easy",
//         "fast"
//       ],
//       "ParaArrObj": [
//         {
//           "SParaString": "Work efficiently long words long words long words long words long words long words long words long words long words long words long words long words long words ",
//           "SParaLong": 7996655703949312,
//           "SParaInt": 8429,
//           "SParaFloat": -67669103057.3056,
//           "SParaBool": false,
//           "SParaArrString": [
//             "har",
//             "zezbehseh"
//           ],
//           "SParaArrLong": [
//             6141464276893696,
//             2096646955466752
//           ],
//           "SParaArrInt": [
//             1601,
//             757
//           ],
//           "SParaArrFloat": [
//             -643739466439.0656,
//             -582978647149.7728
//           ],
//           "SParaArrBool": [
//             false,
//             false
//           ]
//         },
//         {
//           "SParaString": "Let's go",
//           "SParaLong": 641970970034176,
//           "SParaInt": 37,
//           "SParaFloat": 556457726574.592,
//           "SParaBool": false,
//           "SParaArrString": [
//             "miw",
//             "aweler"
//           ],
//           "SParaArrLong": [
//             3828767638159360,
//             7205915801419776
//           ],
//           "SParaArrInt": [
//             1187,
//             6397
//           ],
//           "SParaArrFloat": [
//             -744659811617.9968,
//             494621489417.4208
//           ],
//           "SParaArrBool": [
//             true,
//             false
//           ]
//         }
//       ],
//       "ParaArrLong": [
//         7607846344589312,
//         7840335854043136
//       ],
//       "ParaArrInt": [
//         2467,
//         1733
//       ],
//       "ParaArrFloat": [
//         759502472845.7216,
//         -157877664743.424
//       ],
//       "ParaArrBool": [
//         true,
//         true
//       ]
//     }''';
// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   bool _isDragging = false;
//   String? _filePath;

//   void _incrementCounter() async {
//     // This call to setState tells the Flutter framework that something has
//     // changed in this State, which causes it to rerun the build method below
//     // so that the display can reflect the updated values. If we changed
//     // _counter without calling setState(), then the build method would not be
//     // called again, and so nothing would appear to happen.
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       // 文件浏览器的标题，可不设置
//       dialogTitle: "请选择文件",
//       // 初始化路径，默认是上一次打开的路径。设置了则打开指定的文件夹路径。Windows系统该参数无效
//       // initialDirectory:
//       //     (await getApplicationDocumentsDirectory()).path,
//       initialDirectory: "f:/",
//       // 文件类型，默认为FileType.any，允许任何文件。设置成custom后，可以配合allowedExtensions实现只选取指定后缀的文件
//       type: FileType.custom,
//       // 允许的扩展名，仅在type为custom时使用，只允许选取指定扩展名的文件
//       allowedExtensions: ["log", "apk"],
//       // 允许多选，默认为false，每次只选择一个文件。设置为true则允许一次选择多个文件
//       allowMultiple: false,
//     );
//     if (result != null) {
//       String? path = result.files.last.path;
//       debugPrint("已选取文件 path=$path");
//       setState(() {
//         // _selectFilePath = path;
//         _counter++;
//       });
//     } else {
//       debugPrint("取消选取");
//     }
//   }

//   final testObj = json.decode(testStringObj);
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.

//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//             DropTarget(
//               // onDragDone 拖放完成后会回调
//               onDragDone: (DropDoneDetails details) {
//                 debugPrint("onDragDone details=${details.files}");
//                 // 获取到文件路径
//                 String? path = details.files.last.path;
//                 debugPrint("path=$path");
//                 setState(() {
//                   _filePath = details.files.last.path;
//                 });
//               },
//               // 拖动到指定区域时回调
//               onDragEntered: (DropEventDetails details) {
//                 setState(() {
//                   _isDragging = true;
//                 });
//               },
//               // 离开指定区域时回调
//               onDragExited: (DropEventDetails details) {
//                 setState(() {
//                   _isDragging = false;
//                 });
//               },
//               child: GestureDetector(
//                 // GestureDetector onTap 点击选线区域调用pickFiles方法来选取文件
//                 onTap: () async {
//                   FilePickerResult? result =
//                       await FilePicker.platform.pickFiles(
//                     initialDirectory: "f:/",
//                   );
//                   if (result != null) {
//                     String? path = result.files.last.path;
//                     debugPrint("已选取文件 path=$path");
//                     setState(() {
//                       _filePath = path;
//                     });
//                   } else {
//                     debugPrint("取消选取");
//                   }
//                 },
//                 child: JsonViewer(testObj),
//                 // child: SizedBox(
//                 //   width: 600,
//                 //   height: 100,
//                 //   // 虚线框
//                 //   child: DottedBorder(
//                 //     borderType: BorderType.RRect,
//                 //     radius: const Radius.circular(10),
//                 //     color: _isDragging ? Colors.orange : Colors.blue,
//                 //     child: Center(
//                 //       child: Column(
//                 //         mainAxisAlignment: MainAxisAlignment.center,
//                 //         children: [
//                 //           _filePath != null
//                 //               ? Text(_filePath!)
//                 //               : const Text("拖动文件到此处或点击选取文件"),
//                 //         ],
//                 //       ),
//                 //     ),
//                 //   ),
//                 // ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//         mini: true,
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//       floatingActionButtonLocation:
//           FloatingActionButtonLocation.centerDocked, // 按钮位置
//     );
//   }
// }
