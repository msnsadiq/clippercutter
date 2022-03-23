import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample Custom paint',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.teal,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,

child: Stack(
  children: [
    Container(
      height: MediaQuery.of(context).size.height *.25,
      width: MediaQuery.of(context).size.width *.99,
      child:Stack(
        children: [
          ClipRect(
            child: Image.asset('assets/SampleImages/img1.jpg',),
          ),
        ],
      ),
    ),
    Positioned(
      bottom: 0,
        right: 0,
        child: ClipPath(
         clipper: MyClipper(),
          child: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height *.70,
            width: MediaQuery.of(context).size.width,

          ),
        ),

    )
  ],
),
        ),
      ),
    );
  }
}
class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {

// path.lineTo(0.0, size.height);
// path.lineTo(size.width, 0.0);
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.moveTo(0,height * .10);
    path.lineTo(0, height );
    path.lineTo(width, height );
   // path.quadraticBezierTo(width/2, height, width, height-50);
    path.lineTo(width, 0);
    path.close();

return  path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>true;

}