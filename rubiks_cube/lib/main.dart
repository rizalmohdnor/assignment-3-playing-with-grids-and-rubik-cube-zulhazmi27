import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '2x2 Rubik\'s Cube',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CubeScreen(),
    );
  }
}

class CubeState {
  List<List<Color>> faces = [
    [Colors.red, Colors.red, Colors.red, Colors.red], // Front
    [Colors.blue, Colors.blue, Colors.blue, Colors.blue], // Left
    [Colors.green, Colors.green, Colors.green, Colors.green], // Right
    [Colors.yellow, Colors.yellow, Colors.yellow, Colors.yellow], // Back
    [Colors.orange, Colors.orange, Colors.orange, Colors.orange], // Top
    [Colors.white, Colors.white, Colors.white, Colors.white], // Bottom
  ];

  // Rotate top face to the left, modify if necessary
  void rotateTopClockwise() {
    // Rotate the top face
    List<Color> tempTop = [...faces[4]];
    faces[4] = [tempTop[2], tempTop[0], tempTop[3], tempTop[1]];

    // Update the top row of adjacent faces
    List<Color> topRowBack = [faces[3][0], faces[3][1]];
    List<Color> topRowRight = [faces[2][0], faces[2][1]];
    List<Color> topRowFront = [faces[0][0], faces[0][1]];
    List<Color> topRowLeft = [faces[1][0], faces[1][1]];

    // Perform the row swaps in clockwise order
    faces[0][0] = topRowLeft[0];
    faces[0][1] = topRowLeft[1];

    faces[1][0] = topRowBack[0];
    faces[1][1] = topRowBack[1];

    faces[2][0] = topRowFront[0];
    faces[2][1] = topRowFront[1];

    faces[3][0] = topRowRight[0];
    faces[3][1] = topRowRight[1];
  }

  void rotateTopCounterClockwise() {
    // Rotate the top face counterclockwise
    List<Color> tempTop = [...faces[4]];
    faces[4] = [tempTop[1], tempTop[3], tempTop[0], tempTop[2]];

    // Update the top row of adjacent faces
    List<Color> topRowBack = [faces[3][0], faces[3][1]];
    List<Color> topRowRight = [faces[2][0], faces[2][1]];
    List<Color> topRowFront = [faces[0][0], faces[0][1]];
    List<Color> topRowLeft = [faces[1][0], faces[1][1]];

    // Perform the row swaps in counterclockwise order
    faces[0][0] = topRowRight[0];
    faces[0][1] = topRowRight[1];

    faces[1][0] = topRowFront[0];
    faces[1][1] = topRowFront[1];

    faces[2][0] = topRowBack[0];
    faces[2][1] = topRowBack[1];

    faces[3][0] = topRowLeft[0];
    faces[3][1] = topRowLeft[1];
  }

  // Rotate top face to the left, modify if necessary
  void rotateBottom() {
    //Need to implement your code here
  }
}

class CubeScreen extends StatefulWidget {
  const CubeScreen({super.key});

  @override
  _CubeScreenState createState() => _CubeScreenState();
}

class _CubeScreenState extends State<CubeScreen> {
  CubeState cube = CubeState();

  void rotateTopClockwise() {
    setState(() {
      cube.rotateTopClockwise();
    });
  }

  void rotateTopCounterClockwise() {
    setState(() {
      cube.rotateTopCounterClockwise();
    });
  }

  Widget buildFace(List<Color> faceColors) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 2.0,
        crossAxisSpacing: 2.0,
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) => Container(color: faceColors[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          '2x2 Rubik\'s Cube',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Top face
            Column(
              children: [
                const Text('Top'),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: buildFace(cube.faces[4]),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Left face
                Column(
                  children: [
                    const Text('Left'),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: buildFace(cube.faces[1]),
                    ),
                  ],
                ),
                // Front face
                Column(
                  children: [
                    const Text("Front"),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: buildFace(cube.faces[0]),
                    ),
                  ],
                ),
                // Right face
                Column(
                  children: [
                    const Text('Right'),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: buildFace(cube.faces[2]),
                    ),
                  ],
                ),
                // Rear face, implement your rear face
                Column(
                  children: [
                    const Text("Rear"),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: buildFace(cube.faces[3]),
                    ),
                  ],
                )
              ],
            ),
            // Bottom face , implement your bottom face
            Column(
              children: [
                const Text('Bottom'),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: buildFace(cube.faces[5]),
                ),
              ],
            ),
            const SizedBox(height: 20),
            //Buttons for rotation
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: rotateTopCounterClockwise,
                  child: const Text("Rotate left"),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: rotateTopClockwise,
                  child: const Text("Rotate right"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
