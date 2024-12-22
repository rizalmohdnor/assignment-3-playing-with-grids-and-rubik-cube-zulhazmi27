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

    // Perform the row swaps in counter clockwise order
    faces[0][0] = topRowRight[0];
    faces[0][1] = topRowRight[1];

    faces[1][0] = topRowFront[0];
    faces[1][1] = topRowFront[1];

    faces[2][0] = topRowBack[0];
    faces[2][1] = topRowBack[1];

    faces[3][0] = topRowLeft[0];
    faces[3][1] = topRowLeft[1];
  }

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
    faces[5] = [tempBottom[1], tempBottom[3], tempBottom[0], tempBottom[2]];

    // Update the bottom row of adjacent faces
    List<Color> bottomRowFront = [faces[0][2], faces[0][3]];
    List<Color> bottomRowRight = [faces[2][2], faces[2][3]];
    List<Color> bottomRowBack = [faces[3][2], faces[3][3]];
    List<Color> bottomRowLeft = [faces[1][2], faces[1][3]];

    // Perform the row swaps in counter clockwise order
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
    // Rotate the left face
    List<Color> tempLeft = [...faces[1]];
    faces[1] = [tempLeft[2], tempLeft[0], tempLeft[3], tempLeft[1]];

    // Update the left col of adjacent faces
    List<Color> leftColTop = [faces[4][0], faces[4][2]];
    List<Color> leftColFront = [faces[0][0], faces[0][2]];
    List<Color> leftColBottom = [faces[5][0], faces[5][2]];
    List<Color> leftColBack = [faces[3][3], faces[3][1]];

    // Perform the col swaps in clockwise order
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
    // Rotate the left face
    List<Color> tempLeft = [...faces[1]];
    faces[1] = [tempLeft[1], tempLeft[3], tempLeft[0], tempLeft[2]];

    // Update the left col of adjacent faces
    List<Color> leftColTop = [faces[4][0], faces[4][2]];
    List<Color> leftColFront = [faces[0][0], faces[0][2]];
    List<Color> leftColBottom = [faces[5][0], faces[5][2]];
    List<Color> leftColBack = [faces[3][3], faces[3][1]];

    // Perform the col swaps in counter clockwise order
    faces[0][0] = leftColBottom[0];
    faces[0][2] = leftColBottom[1];

    faces[5][0] = leftColBack[0];
    faces[5][2] = leftColBack[1];

    faces[3][3] = leftColTop[0];
    faces[3][1] = leftColTop[1];

    faces[4][0] = leftColFront[0];
    faces[4][2] = leftColFront[1];
  }

  void rotateRightColForward() {
    // Rotate the right face
    List<Color> tempRight = [...faces[2]];
    faces[2] = [tempRight[2], tempRight[0], tempRight[3], tempRight[1]];

    // Update the right col of adjacent faces
    List<Color> rightColTop = [faces[4][1], faces[4][3]];
    List<Color> rightColFront = [faces[0][1], faces[0][3]];
    List<Color> rightColBottom = [faces[5][1], faces[5][3]];
    List<Color> rightColBack = [faces[3][2], faces[3][0]];

    // Perform the col swaps in clockwise order
    faces[0][1] = rightColTop[0];
    faces[0][3] = rightColTop[1];

    faces[5][1] = rightColFront[0];
    faces[5][3] = rightColFront[1];

    faces[3][2] = rightColBottom[0];
    faces[3][0] = rightColBottom[1];

    faces[4][1] = rightColBack[0];
    faces[4][3] = rightColBack[1];
  }

  void rotateRightColBackward() {
    // Rotate the right face
    List<Color> tempRight = [...faces[2]];
    faces[2] = [tempRight[1], tempRight[3], tempRight[0], tempRight[2]];

    // Update the right col of adjacent faces
    List<Color> rightColTop = [faces[4][1], faces[4][3]];
    List<Color> rightColFront = [faces[0][1], faces[0][3]];
    List<Color> rightColBottom = [faces[5][1], faces[5][3]];
    List<Color> rightColBack = [faces[3][2], faces[3][0]];

    // Perform the col swaps in counter clockwise order
    faces[0][1] = rightColBottom[0];
    faces[0][3] = rightColBottom[1];

    faces[5][1] = rightColBack[0];
    faces[5][3] = rightColBack[1];

    faces[3][2] = rightColTop[0];
    faces[3][0] = rightColTop[1];

    faces[4][1] = rightColFront[0];
    faces[4][3] = rightColFront[1];
  }

  void rotateFrontClockwise() {
    // Rotate the front face
    List<Color> tempFront = [...faces[0]];
    faces[0] = [tempFront[2], tempFront[0], tempFront[3], tempFront[1]];

    // Update the row and col of adjacent faces
    List<Color> frontTop = [faces[4][2], faces[4][3]];
    List<Color> frontLeft = [faces[1][3], faces[1][1]];
    List<Color> frontRight = [faces[2][0], faces[2][2]];
    List<Color> frontBottom = [faces[5][0], faces[5][1]];

    // Perform the row and col swaps in clockwise order
    faces[4][2] = frontLeft[0];
    faces[4][3] = frontLeft[1];

    faces[1][3] = frontBottom[0];
    faces[1][1] = frontBottom[1];

    faces[5][0] = frontRight[0];
    faces[5][1] = frontRight[1];

    faces[2][0] = frontTop[0];
    faces[2][2] = frontTop[1];
  }

  void rotateFrontCounterClockwise() {
    // Rotate the front face
    List<Color> tempFront = [...faces[0]];
    faces[0] = [tempFront[1], tempFront[3], tempFront[0], tempFront[2]];

    // Update the row and col of adjacent faces
    List<Color> frontTop = [faces[4][2], faces[4][3]];
    List<Color> frontLeft = [faces[1][3], faces[1][1]];
    List<Color> frontRight = [faces[2][0], faces[2][2]];
    List<Color> frontBottom = [faces[5][0], faces[5][1]];

    // Perform the row and col swaps in counter clockwise order
    faces[4][2] = frontRight[0];
    faces[4][3] = frontRight[1];

    faces[1][3] = frontTop[0];
    faces[1][1] = frontTop[1];

    faces[5][0] = frontLeft[0];
    faces[5][1] = frontLeft[1];

    faces[2][0] = frontBottom[0];
    faces[2][2] = frontBottom[1];
  }

  void rotateBackClockwise() {
    // Rotate the back face
    List<Color> tempBack = [...faces[3]];
    faces[3] = [tempBack[2], tempBack[0], tempBack[3], tempBack[1]];

    // Update the row and col of adjacent faces
    List<Color> backTop = [faces[4][0], faces[4][1]];
    List<Color> backLeft = [faces[1][2], faces[1][0]];
    List<Color> backRight = [faces[2][1], faces[2][3]];
    List<Color> backBottom = [faces[5][2], faces[5][3]];

    // Perform the row and col swaps in clockwise order
    faces[4][0] = backLeft[0];
    faces[4][1] = backLeft[1];

    faces[2][1] = backTop[0];
    faces[2][3] = backTop[1];

    faces[5][2] = backRight[0];
    faces[5][3] = backRight[1];

    faces[1][2] = backBottom[0];
    faces[1][0] = backBottom[1];
  }

  void rotateBackCounterClockwise() {
    // Rotate the back face
    List<Color> tempBack = [...faces[3]];
    faces[3] = [tempBack[1], tempBack[3], tempBack[0], tempBack[2]];

    // Update the row and col of adjacent faces
    List<Color> backTop = [faces[4][0], faces[4][1]];
    List<Color> backLeft = [faces[1][2], faces[1][0]];
    List<Color> backRight = [faces[2][1], faces[2][3]];
    List<Color> backBottom = [faces[5][2], faces[5][3]];

    // Perform the row and col swaps in clockwise order
    faces[4][0] = backRight[0];
    faces[4][1] = backRight[1];

    faces[2][1] = backBottom[0];
    faces[2][3] = backBottom[1];

    faces[5][2] = backLeft[0];
    faces[5][3] = backLeft[1];

    faces[1][2] = backTop[0];
    faces[1][0] = backTop[1];
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

  void rotateRightColForward() {
    setState(() {
      cube.rotateRightColForward();
    });
  }

  void rotateRightColBackward() {
    setState(() {
      cube.rotateRightColBackward();
    });
  }

  void rotateFrontClockwise() {
    setState(() {
      cube.rotateFrontClockwise();
    });
  }

  void rotateFrontCounterClockwise() {
    setState(() {
      cube.rotateFrontCounterClockwise();
    });
  }

  void rotateBackClockwise() {
    setState(() {
      cube.rotateBackClockwise();
    });
  }

  void rotateBackCounterClockwise() {
    setState(() {
      cube.rotateBackCounterClockwise();
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
                const SizedBox(width: 3),
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
                const SizedBox(width: 3),
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
                const SizedBox(width: 3),
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
            const SizedBox(height: 10),
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
            const SizedBox(height: 10),
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
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: rotateRightColForward,
                    child: const Text(
                      "Rotate right\ncol forward",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(width: 25),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: rotateRightColBackward,
                    child: const Text(
                      "Rotate right\ncol backward",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: rotateFrontCounterClockwise,
                    child: const Text(
                      "Rotate front\nface left",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(width: 25),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: rotateFrontClockwise,
                    child: const Text(
                      "Rotate front\nface right",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: rotateBackCounterClockwise,
                    child: const Text(
                      "Rotate back\nface left",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(width: 25),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: rotateBackClockwise,
                    child: const Text(
                      "Rotate back\nface right",
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
