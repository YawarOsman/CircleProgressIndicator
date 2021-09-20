import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
late AnimationController controller;
late AnimationController controller1;
late Animation animation;
late Tween tween;


@override
  void initState() {
   controller=AnimationController(vsync: this,duration: Duration(seconds: 2));
   controller1=AnimationController(vsync: this,duration: Duration(seconds: 2));


   controller.addListener(() {
    if(controller.value==1){
    controller.reverse();
    }else if(controller.value==0){
      controller.forward();
    }

     print('con:${controller.value}');
     setState(() {});
   });


    super.initState();

  }
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    controller1.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            AnimatedBuilder(
                animation: controller1,
                child: Container(
                  width: 100,height: 100,  //color: Colors.teal,
                  child: CustomPaint(
                    foregroundPainter: LinePainter(controller),
                  ),
                ),
                builder: (context,child){
                  return Transform.rotate(
                      angle: controller1.value*pi*2,
                      child:child
                  );
                }),

          SizedBox(height: 60,),
          FlatButton(
              onPressed: (){
                controller.forward();
                controller1.repeat();
                setState((){});
                },
              child: Text('forward',style: TextStyle(fontSize: 22,color: Colors.white),),color: Colors.orange,
          )

    //       ClipPath(
    //       clipper: CurveClipper(),
    //   child: Container(
    //
    //     height: 200.0,
    //     decoration: BoxDecoration(
    //         color: Colors.red,
    //       //borderRadius: BorderRadius.circular(500)
    //     ),
    //   ),
    // )
          ],
        ),
      )
    );

  }
}

class LinePainter extends CustomPainter{
  AnimationController? controller;
  LinePainter(AnimationController controller){
  this.controller=controller;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint=Paint()..strokeWidth=(10*controller!.value)..color=Colors.cyan ..strokeCap=StrokeCap.round..style=PaintingStyle.stroke;

    final arc=Path();
    arc.moveTo(size.width/2.15,size.height);
    arc.arcToPoint(
      Offset(size.width/1.85,size.height),
      radius: Radius.circular(50),
      clockwise: false
    );
    canvas.drawPath(arc, paint);

    final arc2=Path();
    arc2.moveTo(size.width/1.09,size.height/3.6+(size.height/4)*2);
    arc2.arcToPoint(
        Offset(size.width/1.055,size.height/4.4+(size.height/4)*2),
        radius: Radius.circular(50),
        clockwise: false
    );
    canvas.drawPath(arc2, paint);

    final arc3=Path();
    arc3.moveTo(size.width/1.055,size.height/3.6);
    arc3.arcToPoint(
        Offset(size.width/1.09,size.height/4.4),
        radius: Radius.circular(50),
        clockwise: false
    );
    canvas.drawPath(arc3, paint);

    final arc4=Path();
    arc4.moveTo(size.width/1.85,0);
    arc4.arcToPoint(
        Offset(size.width/2.15,0),
        radius: Radius.circular(50),
        clockwise: false
    );
    canvas.drawPath(arc4, paint);

    final arc5=Path();
    arc5.moveTo(size.width/18,size.height/3.6);
    arc5.arcToPoint(
        Offset(size.width/12,size.height/4.4),
        radius: Radius.circular(50),

    );
    canvas.drawPath(arc5, paint);

    final arc6=Path();
    arc6.moveTo(size.width/12,size.height/3.6+(size.height/4)*2);
    arc6.arcToPoint(
        Offset(size.width/18,size.height/4.4+(size.height/4)*2),
        radius: Radius.circular(50),

    );
    canvas.drawPath(arc6, paint);

    //
    // final paint1=Paint()..strokeWidth=5..color=Colors.cyan..strokeCap=StrokeCap.round..style=PaintingStyle.stroke;
    // final arc1=Path();
    // arc1.moveTo(20,50);
    // arc1.arcToPoint(
    //     Offset(40,30),
    //     radius: Radius.circular(50),
    //     clockwise: false
    // );
    // canvas.drawCircle(Offset(size.width/2,size.height/2),200, paint1);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)=>false;

}






// class CurveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path..lineTo(0, size.height);
//
//     Offset controlPoint = Offset(size.width / 2, size.height-200);
//     Offset endPoint = Offset(size.width-40, size.height);
//     path..quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)..lineTo(size.width-40, size.height);
//
//     Offset controlPoint1 = Offset(size.width/2, size.height-230);
//     Offset endPoint1 = Offset(0, size.height);
//     path..quadraticBezierTo(controlPoint1.dx, controlPoint1.dy, endPoint1.dx, endPoint1.dy)..lineTo(10, size.height);
//
//
//     path..close();
//
//
//
//
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

