import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

Widget profileTitle(String title){
return Padding(
    padding: 
      EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(title, 
                style: TextStyle(
                  fontSize: 16, 
                  fontWeight: FontWeight.bold
                  ),
                ),
            ],)
        ],
      ),
    );
}

Widget profileLabelText(String title, bool _status ){
 return  Padding(
      padding: EdgeInsets.only(
          left: 25.0, right: 25.0, top: 2.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Flexible(
            child: TextField(
              decoration: InputDecoration(
                hintText: title,
                
                ),
              ),
            ),

        ],
      ));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Profile", 
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor
          ),
        ),
        actions: [
          Icon(Icons.done, color: Theme.of(context).primaryColor)
        ],
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Container(
              height: 200,
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Stack(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 140,
                              width: 140,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://cdn.onlinewebfonts.com/svg/img_87237.png'
                                  )
                                )
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 105, left: 230),
                          child: CircleAvatar(
                            backgroundColor: Colors.pink,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Color(0xffFFFFFF),
              child: Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    profileTitle('Name'),
                    profileLabelText('Enter Your Name',_status),
                     profileTitle('E-mail'),
                    profileLabelText('Enter Your E-mail',_status),
                    profileTitle('Bio'),
                    profileLabelText('Write about yourself',_status),
                    profileTitle('city'),
                    profileLabelText('City',_status),
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

 @override
  void dispose() {
    
    myFocusNode.dispose();
    super.dispose();
  }


//   Widget _getEditIcon() {
//     return new GestureDetector(
//       child: new CircleAvatar(
//         backgroundColor: Colors.pink,
//         radius: 14.0,
//         child: new Icon(
//           Icons.edit,
//           color: Colors.white,
//           size: 16.0,
//         ),
//       ),
//       onTap: () {
//         setState(() {
//           _status = false;
//         });
//       },
//     );
//   }
}
