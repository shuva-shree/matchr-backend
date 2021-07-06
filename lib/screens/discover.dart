import 'package:flutter/material.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MatchR',style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.filter_list,color: Colors.pink,),
          )
        ],
      ),
        body: ListView(
      children: [
        UserCard(
          name: 'Anita',
          age: '28',
          city: 'Mumbai', 
          imageUrl: 'https://tse1.mm.bing.net/th?id=OIP.SdlvjGSrQQ9gm5szgGhQIwHaKQ&pid=Api&P=0&w=300&h=300',
          compatibility: '85%',
          job: 'Product Manager, IBM',
        ),
        UserCard(
          name: 'Rose',
          age: '25',
          city: 'Bangalore', 
          imageUrl: 'https://fancyfantacy.com/wp-content/uploads/2020/03/Fancy-and-Creative-Portrait-Photo-Ideas-You-Must-Have-12.jpg',
          compatibility: '80%',
          job: 'Food Blogger',
        ),
        UserCard(
          name: 'Dhriti',
          age: '26',
          city: 'Delhi', 
          imageUrl: 'https://tse4.mm.bing.net/th?id=OIP.ytbU2-_ibDR_Zmki5lb2bwHaKT&pid=Api&P=0&w=300&h=300',
          compatibility: '65%',
          job: 'Air hostess, Air India',
        ),
        UserCard(
          name: 'Akshay',
          age: '30',
          city: 'Mumbai', 
          imageUrl: 'https://tse1.mm.bing.net/th?id=OIP.gsIHznC0GUCZ0r7kgilokwHaJQ&pid=Api&P=0&w=300&h=300',
          compatibility: '15%',
          job: 'Developer, Zomato',
        ),
        
      ],
    ));
  }
}

class UserCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String age;
  final String city;
  final String job;
  final String compatibility;



  const UserCard({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.age,
    required this.city,
    required this.job, 
    required this.compatibility, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 10, bottom: 10, right: 10),
      child: Card(
        elevation: 3,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width * 0.88,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name+', '+age,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Icon(Icons.location_city, color: Colors.white),
                            SizedBox(width: 5,),
                            Text(
                              city,
                              style: TextStyle(color: Colors.white,),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Icon(Icons.cases, color: Colors.white),
                            SizedBox(width: 5,),
                            Text(job,
                                style: TextStyle(color: Colors.white)),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child:
                        Text(compatibility, style: TextStyle(color: Colors.white)),
                  )
                ],
              )
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage(
                  imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
