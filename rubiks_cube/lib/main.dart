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
  void rotateBottomClockwise() {
    // Rotate the bottom face
    List<Color> tempBottom = [...faces[5]];
    faces[5] = [tempBottom[2], tempBottom[0], tempBottom[3], tempBottom[1]];

    // Update the bottom row of adjacent faces
    List<Color> bottomRowFront = [faces[0][2], faces[0][3]];
    List<Color> bottomRowRight = [faces[2][2], faces[2][3]];
    List<Color> bottomRowBack = [faces[3][2], faces[3][3]];
    List<Color> bottomRowLeft = [faces[1][2], faces[1][3]];

    // Perform the row swaps in clockwise order
    faces[0][2] = bottomRowLeft[0];
    faces[0][3] = bottomRowLeft[1];

    faces[1][2] = bottomRowBack[0];
    faces[1][3] = bottomRowBack[1];

    faces[2][2] = bottomRowFront[0];
    faces[2][3] = bottomRowFront[1];

    faces[3][2] = bottomRowRight[0];
    faces[3][3] = bottomRowRight[1];
  }

  void rotateBottomCounterClockwise() {
    // Rotate the bottom face
    List<Color> tempBottom = [...faces[5]];
    faces[5] = [tempBottom[2], tempBottom[0], tempBottom[3], tempBottom[1]];

    // Update the bottom row of adjacent faces
    List<Color> bottomRowFront = [faces[0][2], faces[0][3]];
    List<Color> bottomRowRight = [faces[2][2], faces[2][3]];
    List<Color> bottomRowBack = [faces[3][2], faces[3][3]];
    List<Color> bottomRowLeft = [faces[1][2], faces[1][3]];

    // Perform the row swaps in clockwise order
    faces[0][2] = bottomRowRight[0];
    faces[0][3] = bottomRowRight[1];

    faces[1][2] = bottomRowFront[0];
    faces[1][3] = bottomRowFront[1];

    faces[2][2] = bottomRowBack[0];
    faces[2][3] = bottomRowBack[1];

    faces[3][2] = bottomRowLeft[0];
    faces[3][3] = bottomRowLeft[1];
  }

  void rotateLeftColForward() {
    // Rotate the bottom face
    List<Color> tempLeft = [...faces[1]];
    faces[1] = [tempLeft[2], tempLeft[0], tempLeft[3], tempLeft[1]];

    // Update the bottom row of adjacent faces
    List<Color> leftColTop = [faces[4][0], faces[4][2]];
    List<Color> leftColFront = [faces[0][0], faces[0][2]];
    List<Color> leftColBottom = [faces[5][0], faces[5][2]];
    List<Color> leftColBack = [faces[3][3], faces[3][1]];

    // Perform the row swaps in clockwise order
    faces[0][0] = leftColTop[0];
    faces[0][2] = leftColTop[1];

    faces[5][0] = leftColFront[0];
    faces[5][2] = leftColFront[1];

    faces[3][3] = leftColBottom[0];
    faces[3][1] = leftColBottom[1];

    faces[4][0] = leftColBack[0];
    faces[4][2] = leftColBack[1];
  }

  void rotateLeftColBackward() {
    // Rotate the bottom face
    List<Color> tempLeft = [...faces[1]];
    faces[1] = [tempLeft[2], tempLeft[0], tempLeft[3], tempLeft[1]];

    // Update the bottom row of adjacent faces
    List<Color> leftColTop = [faces[4][0], faces[4][2]];
    List<Color> leftColFront = [faces[0][0], faces[0][2]];
    List<Color> leftColBottom = [faces[5][0], faces[5][2]];
    List<Color> leftColBack = [faces[3][3], faces[3][1]];

    // Perform the row swaps in clockwise order
    faces[0][0] = leftColBottom[0];
    faces[0][2] = leftColBottom[1];

    faces[5][0] = leftColBack[0];
    faces[5][2] = leftColBack[1];

    faces[3][3] = leftColTop[0];
    faces[3][1] = leftColTop[1];

    faces[4][0] = leftColFront[0];
    faces[4][2] = leftColFront[1];
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

  void rotateBottomClockwise() {
    setState(() {
      cube.rotateBottomClockwise();
    });
  }

  void rotateBottomCounterClockwise() {
    setState(() {
      cube.rotateBottomCounterClockwise();
    });
  }

  void rotateLeftColForward() {
    setState(() {
      cube.rotateLeftColForward();
    });
  }

  void rotateLeftColBackward() {
    setState(() {
      cube.rotateLeftColBackward();
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
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
            const SizedBox(height: 30),
            //Buttons for rotation
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: rotateTopCounterClockwise,
                    child: const Text(
                      "Rotate top\nrow left",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(width: 25),
                SizedBox(
                  width: 150,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: rotateTopClockwise,
                    child: const Text(
                      "Rotate top\nrow right",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            //Buttons for rotation
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: rotateBottomCounterClockwise,
                    child: const Text(
                      "Rotate bottom\nrow left",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(width: 25),
                SizedBox(
                  width: 150,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: rotateBottomClockwise,
                    child: const Text(
                      "Rotate bottom\nrow right",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: rotateLeftColForward,
                    child: const Text(
                      "Rotate left\ncol forward",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(width: 25),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: rotateLeftColBackward,
                    child: const Text(
                      "Rotate left\ncol backward",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
