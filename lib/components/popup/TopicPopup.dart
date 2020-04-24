
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';




// class TopicDialog extends StatelessWidget {
// //   final String title,  buttonText;
// //   final tileTitles = [ 'Computer Science', 'Sports', 'Food'];
// //   final Image image;

// //   TopicDialog({
// //     @required this.title,
// //     @required this.buttonText,
// //     this.image
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Dialog(
// //       shape: RoundedRectangleBorder(
// //           borderRadius: BorderRadius.circular(Consts.padding),
// //       ),      
// //       elevation: 0.0,
// //       backgroundColor: Colors.transparent,
// //       child: dialogContent(context),
// //     );
// //   }
// //   dialogContent(BuildContext context) {
// //   return Stack(
// //     children: <Widget>[
// //     Container(
// //   padding: EdgeInsets.only(
// //     top: Consts.avatarRadius + Consts.padding,
// //     bottom: Consts.padding,
// //     left: Consts.padding,
// //     right: Consts.padding,
// //   ),
// //   margin: EdgeInsets.only(top: Consts.avatarRadius),
// //   decoration: new BoxDecoration(
// //     color: Colors.white,
// //     shape: BoxShape.rectangle,
// //     borderRadius: BorderRadius.circular(Consts.padding),
// //     boxShadow: [
// //       BoxShadow(
// //         color: Colors.black26,
// //         blurRadius: 10.0,
// //         offset: const Offset(0.0, 10.0),
// //       ),
// //     ],
// //   ),
// //   child: Column(
// //     mainAxisSize: MainAxisSize.min, 
// //     children: <Widget>[
// //       Text(
// //         title,
// //         style: TextStyle(
// //           fontSize: 24.0,
// //           fontWeight: FontWeight.w700,
// //         ),
// //       ),
// //       SizedBox(height: 3.0),
// //       Container(height:30),
// //       Container(height: 150,width: 300,
// //       child:
// //       ListView.builder(
// //         itemCount: tileTitles.length,
// //         itemBuilder: (context, index) {
// //           return new CheckboxListTile(
// //             title: new Text(tileTitles[index],
// //                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
// //             value: timeDilation != 2.0,
// //             onChanged: (bool value) {
// //               timeDilation = value ? 10.0 : 1.0; 
// //             });
// //         })),
// //       SizedBox(height: 24.0),
// //       Align(
// //         alignment: Alignment.bottomRight,
// //         child: FlatButton(
// //           onPressed: () {
// //             Navigator.of(context).pop(); 
// //           },
// //           child: Text(buttonText),
// //         ),
// //       ),
// //     ],
// //   ),
// // ),
// //     ],
// //   );
// // }
  
  


// }



class MyTopicDialog extends StatefulWidget {
  //constructor

  @override
  _MyTopicDialogState createState() => _MyTopicDialogState();
}

class _MyTopicDialogState extends State<MyTopicDialog> {
  final String title = "Select A Topic",  buttonText= "Select";
  final tileTitles = [ 'Computer Science', 'Sports', 'Food'];
  List<bool> listCheck = [];
  // final Image image;

  // TopicDialog({
  //   @required this.title,
  //   @required this.buttonText,
  //   this.image
  // });
void initState() {
    // TODO: implement initState
    setState(() {
      for(int i=0;i<20;i++){
        listCheck.add(false);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Consts.padding),
      ),      
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
  dialogContent(BuildContext context) {
  return Stack(
    children: <Widget>[
    Container(
  padding: EdgeInsets.only(
    top: Consts.avatarRadius + Consts.padding,
    bottom: Consts.padding,
    left: Consts.padding,
    right: Consts.padding,
  ),
  margin: EdgeInsets.only(top: Consts.avatarRadius),
  decoration: new BoxDecoration(
    color: Colors.white,
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.circular(Consts.padding),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10.0,
        offset: const Offset(0.0, 10.0),
      ),
    ],
  ),
  child: Column(
    mainAxisSize: MainAxisSize.min, 
    children: <Widget>[
      Text(
        title,
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
        ),
      ),
      SizedBox(height: 3.0),
      Container(height:30),
      Container(height: 150,width: 300,
      child:
      ListView.builder(
        itemCount: tileTitles.length,
        itemBuilder: (context, index) {
          return new CheckboxListTile(
            activeColor: Colors.deepPurpleAccent,
            title: new Text(tileTitles[index],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            value: listCheck[index],
            onChanged: (value) {
              setState(() { timeDilation = value ? 1.5 : 1.0;
              _uncheck(listCheck, index);
              listCheck[index] = !listCheck[index];
              }); 
            }
            );
        })),
      SizedBox(height: 24.0),
      Align(
        alignment: Alignment.bottomRight,
        child: RaisedButton(
          color: Colors.deepPurpleAccent,
          onPressed: () {
            Navigator.of(context).pop(); 
          },
          child: Text(buttonText),
        ),
      ),
    ],
  ),
),
    ],
  );
}
  
  
}

_uncheck(List<bool>listCheck,int index){
  for(int i = 0; i<listCheck.length; i++){
    if(listCheck[index]!=listCheck[i]){listCheck[i]=false;}
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}

