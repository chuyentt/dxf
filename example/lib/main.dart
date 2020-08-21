import 'package:dxf/dxf.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future _testDxf() async {
    //String path = join(await getDatabasesPath(), 'igeopro.geojson');
    var docDir = await getApplicationDocumentsDirectory();
    var path = join(docDir.path, 'new.dxf');

    var dxf = await DXF.create(path);
    var point = AcDbPoint(dxf.nextHandle, x: 10, y: 10.5);
    dxf.addEntities(point);

    var line = AcDbLine(
      dxf.nextHandle,
      x: 12.2,
      y: 11.5,
      x1: 22.0,
      y1: 13.6,
    );
    dxf.addEntities(line);

    var vertices = <List<double>>[];
    vertices.addAll([
      [25, 11],
      [21, 18],
      [23, 23]
    ]);
    var pl = AcDbPolyline(
      dxf.nextHandle,
      vertices: vertices,
      isClosed: false,
    );
    dxf.addEntities(pl);
    pl.vertices.addAll([
      [24, 25]
    ]);

    var closedPl = AcDbPolyline(
      dxf.nextHandle,
      vertices: [
        [27, 20],
        [36, 20],
        [35, 14],
        [27, 14]
      ],
      isClosed: true,
    );

    dxf.addEntities(closedPl);
    var handle1 = dxf.nextHandle;
    var text = AcDbText(
      handle1,
      x: 11,
      y: 20,
      textString: 'Hello!',
    );
    dxf.addEntities(text);

    var handle = dxf.nextHandle;
    var mtext = AcDbMText(
      handle,
      x: 19,
      y: 7,
      textString: 'Hello!\\PXin chào!',
    );
    dxf.addEntities(mtext);

    print('Saving...');
    await dxf.save().then((_) {
      print('Saved!');
    });

    var e = dxf.getEntityByHandle(handle);
    dxf.removeEntity(e);

    var e1 = dxf.getEntityByHandle(handle1);
    if (e1 is AcDbText) {
      e1.textString = 'Trần Trung Chuyên';
    }

    dxf.addEntities(mtext);

    // print('Saving...');
    // await dxf.save().then((_) {
    //   print('Saved!');
    // });

    dxf.entities.forEach((element) {
      print(element.dxfString);
    });

    // print('Loading...');
    // var dxfr18 = await DXF.load('assets/data/r18.dxf');
    // dxfr18.entities.forEach((element) {
    //   if (element.runtimeType == AcDbPolyline) {
    //     AcDbPolyline pl = element;
    //     print(pl.vertices.length);
    //   }
    // });
    // await dxfr18.save(newPath: 'assets/data/r18s.dxf').then((value) {
    //   print('Saved!');
    // });
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _testDxf();
          _incrementCounter();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
