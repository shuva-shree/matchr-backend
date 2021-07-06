import 'package:flutter/material.dart';
import 'package:loginapp/models/messages.dart';
import 'package:loginapp/models/user_model.dart';

class InboxScreen extends StatefulWidget {
  final User user;
  InboxScreen({required this.user});

  @override
  _InboxScreenState createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
_chatBubble(Message message, bool isMe, bool isSameUser){
if(isMe){
return Column(
    children: [
      Container(
        alignment: Alignment.topRight,
        child: Container(
          constraints: BoxConstraints(
              maxWidth:
                  MediaQuery.of(context).size.width * .80),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                    blurRadius: 5,
                    spreadRadius: 2),
              ]),
          child: Text(
              message.text, style: TextStyle(color: Colors.white),),
        ),
      ),
      !isSameUser?
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(message.time, style: TextStyle(fontSize: 12, color: Colors.black45),),
          SizedBox(width: 10,),
          Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  blurRadius: 5,
                  spreadRadius: 2),
              ],
            ),
            child: CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage('https://www.styledumonde.com/wp-content/uploads/2020/10/Alvaro-de-Juan-by-STYLEDUMONDE-Street-Style-Fashion-Photography20200112_48A9789.jpg'),
            ),
          ),                          
        ],
      ): Container(child: null,)
    ],
  );  
}
else{
  return Column(
    children: [
      Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Container(
              constraints: BoxConstraints(
                  maxWidth:
                      MediaQuery.of(context).size.width * .80),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        blurRadius: 5,
                        spreadRadius: 2),
                  ]),
              child: Text(
                  message.text, style: TextStyle(color: Colors.black54),),
            ),
          ),
          !isSameUser?
          Row(
            children: [
              Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      blurRadius: 5,
                      spreadRadius: 2),
                  ],
                ),
                child: CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(widget.user.imageUrl),
                ),
              ),
              SizedBox(width: 10,),
              Text(message.time, style: TextStyle(fontSize: 12, color: Colors.black45),)
            ],
          ):Container(child: null,),
        ],
      ),
    ],
      );

  }
}

_sendMessageArea(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8),
    height: 70,
    color: Colors.white,
    child: Row(
      children: [
        IconButton(
          onPressed: (){},
          icon: Icon(Icons.photo),
          iconSize: 25,
          color: Theme.of(context).primaryColor,
        ),
        Expanded(
          child: TextField(
            decoration: InputDecoration.collapsed(
              hintText: 'Send a message..'),
            textCapitalization: TextCapitalization.sentences,
          ),
        ),
        IconButton(
          onPressed: (){},
          icon: Icon(Icons.send),
          iconSize: 25,
          color: Theme.of(context).primaryColor,)
        ,
      ],
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    int prevUserId=0;
    return Scaffold(
        backgroundColor: Color(0xFFF6F6F6),
        appBar: AppBar(
          centerTitle: true,
          title: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                text: widget.user.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              TextSpan(text: '\n'),
              widget.user.isOnline?
              TextSpan(
                  text: 'Online',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
                  ):
              TextSpan(
                  text: 'Offline',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
                  ),
              ],
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                padding: EdgeInsets.all(20),
                itemCount: messages.length,
                itemBuilder: (BuildContext context , int index){
                  final Message message = messages[index];
                  final bool isMe = message.sender.id == currentUser.id;
                  final bool isSameUser = prevUserId == message.sender.id;
                  prevUserId = message.sender.id;
                  return _chatBubble(message, isMe, isSameUser);
                })
                
            ),
            _sendMessageArea(),
            
          ],
        ));
  }
}
