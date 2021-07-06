class User {
  final int id;
  final String name;
  final String imageUrl;
  final bool isOnline;

  User({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.isOnline,
  });
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Nick Fury',
  imageUrl: 'https://www.styledumonde.com/wp-content/uploads/2020/10/Alvaro-de-Juan-by-STYLEDUMONDE-Street-Style-Fashion-Photography20200112_48A9789.jpg',
  isOnline: true,
);

// USERS
final User ironMan = User(
  id: 1,
  name: 'In Yeoung',
  imageUrl: 'https://img-cdn.brainberries.co/wp-content/uploads/2016/04/whos_the_most_gorgeous_woman_in_your_country_09.jpg',
  isOnline: true,
);
final User captainAmerica = User(
  id: 2,
  name: 'Lisa',
  imageUrl: 'https://wallup.net/wp-content/uploads/2016/05/13/354337-women-model-bars-dress.jpg',
  isOnline: true,
);
final User hulk = User(
  id: 3,
  name: 'Tony',
  imageUrl: 'https://tse1.mm.bing.net/th?id=OIP.cIu6-WdfUR3uKMR3ustr2wHaKl&pid=Api&P=0&w=300&h=300',
  isOnline: false,
);
final User scarletWitch = User(
  id: 4,
  name: 'Sam',
  imageUrl: 'https://i.pinimg.com/originals/19/d9/f8/19d9f8b08a7b087345baac275b807d04.jpg',
  isOnline: false,
);
final User spiderMan = User(
  id: 5,
  name: 'Spider Man',
  imageUrl: 'https://i.pinimg.com/originals/ea/d2/bb/ead2bb26e6e06b9644dd1dae8b0677ef.jpg',
  isOnline: true,
);
final User blackWindow = User(
  id: 6,
  name: 'Black Widow',
  imageUrl: 'https://i.pinimg.com/736x/19/d0/9a/19d09a0ac1608d948f82b086d1b34fb9.jpg',
  isOnline: false,
);
final User thor = User(
  id: 7,
  name: 'Thor',
  imageUrl: 'https://i.pinimg.com/originals/ea/d2/bb/ead2bb26e6e06b9644dd1dae8b0677ef.jpg',
  isOnline: false,
);
final User captainMarvel = User(
  id: 8,
  name: 'Ishita',
  imageUrl: 'https://i.pinimg.com/736x/11/15/df/1115df94ff848a806e213096e60c762c.jpg',
  isOnline: false,
);