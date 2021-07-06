import 'package:flutter/material.dart';
import 'package:loginapp/models/requests.dart';
import 'package:loginapp/provider/listOfMatches.dart';
import 'package:provider/provider.dart';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({Key? key}) : super(key: key);

  @override
  _RequestsScreenState createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  List<Request> requestList=[];
  List<Request> matches = [];

  bool isAdding = false;
  Request? currentRequest;

  @override
  void initState() {
    setState((){
       requestList=[
  Request(id:'11', name: 'Shalini' ,imageUrl: 'http://img.izismile.com/img/img9/20160920/640/the_most_beautiful_russian_girls_on_instagram_640_02.jpg', isAccepted: false),
  Request(id:'12', name: 'Maria' ,imageUrl: 'https://tse4.mm.bing.net/th?id=OIP.XyOlkw5iQPWkkBQxORimUAHaDb&pid=Api&P=0&w=345&h=161', isAccepted: false),
  Request(id:'13', name: 'Tommy' ,imageUrl: 'https://i.pinimg.com/originals/02/65/e5/0265e50b2dbf0fd85018336416fee520.jpg', isAccepted: false),
  Request(id:'14', name: 'John' ,imageUrl: 'https://i.pinimg.com/originals/91/3f/8a/913f8af92b078ad1d3374beeef4648ce.jpg', isAccepted: false),
  Request(id:'15', name: 'Kim Won',imageUrl: 'https://tse3.mm.bing.net/th?id=OIP.dqZgFE7Zw_lhr7PsakZwHgHaHa&pid=Api&P=0&w=300&h=300' , isAccepted: false),
  Request(id:'16', name: 'Derek' ,imageUrl: 'https://i.pinimg.com/originals/26/1c/be/261cbed0c55cc67dd1948742001d0e6e.jpg', isAccepted: false),
  Request(id:'17', name: 'Hayat' ,imageUrl: 'https://www.stylevore.com/wp-content/uploads/2020/02/66370418_2100108233616999_2808083609903165308_n.jpg', isAccepted: false),  

];
    });
    super.initState();
  }

  @override
    void didChangeDependencies() {
      var listOfMatches = Provider.of<ListOfMatchesProvider>(context, listen: true);
      if(isAdding){
        listOfMatches.addToMatches(currentRequest!);
        print('adding');
      }
      setState((){
        isAdding= false;
      });
      super.didChangeDependencies();
    }



  @override
  Widget build(BuildContext context) {
    var listOfMatches = Provider.of<ListOfMatchesProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text('Requests'),
        ),
        body: ListView.builder(
          itemCount: requestList.length,
          itemBuilder:( BuildContext context, int index){
            final Request request = requestList[index];
           return Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 5),
                  decoration: 
                    BoxDecoration(shape: BoxShape.circle, boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          blurRadius: 5,
                          spreadRadius: 4),
                    ]),
                  child: CircleAvatar(radius: 27,backgroundImage: NetworkImage(request.imageUrl),),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 40,
                  alignment: Alignment.topLeft,
                  child: Text(
                    ' ${request.name} wants to match with you',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  )
                ),
                
                Padding(
                  padding: const EdgeInsets.only(left:10),
                  child: Row(
                    children: [
                      IconButton(onPressed: (){
                        setState((){
                          isAdding = true;
                          currentRequest = request;
                        });
                       }, icon: Icon(Icons.favorite_border),),
                      IconButton(onPressed: () {
                        print("removing");
                        setState((){
                          requestList.removeAt(index);
                        });
                        }, icon: Icon(Icons.cancel_outlined),),
                    ],
                  ),
                )
              ],
            ),
          );
        
        },)
         
    );
  }
}
