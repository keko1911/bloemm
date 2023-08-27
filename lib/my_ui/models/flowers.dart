class Flower {
  final int flowerId;
  final int price;
  final String duration;
  final double rating;
  final String watering;
  final String temperature;
  final String shop;
  final String flowerName;
  final String imageURL;
  bool isFavorated;
  final String decription;
  bool isSelected;

  Flower(
      {required this.flowerId,
      required this.price,
      required this.shop,
      required this.flowerName,
      required this.duration,
      required this.rating,
      required this.watering,
      required this.temperature,
      required this.imageURL,
      required this.isFavorated,
      required this.decription,
      required this.isSelected});

  static List<Flower> flowerList = [
    Flower(
        flowerId: 0,
        price: 100,
        shop: 'Atlantas',
        flowerName: 'Oriental Lily',
        duration: '4 W',
        rating: 4.8,
        watering: 'Daily',
        temperature: '15 - 23',
        imageURL: 'assets/images/F5.png',
        isFavorated: true,
        decription:
            'Oriental lily is one of the most dramatic, and fragrant, perennial flowers around for sunny gardens.',
        isSelected: false),
    Flower(
        flowerId: 1,
        price: 150,
        shop: 'Orchidee shop',
        flowerName: 'Orchid',
        duration: '2 W',
        rating: 4.7,
        watering: 'Daily',
        temperature: '15 - 23',
        imageURL: 'assets/images/F4.png',
        isFavorated: false,
        decription:
            'Orchids are plants that have a diverse and widespread group of flowering plants with blooms that are often colourful and fragrant.',
        isSelected: false),
    Flower(
        flowerId: 2,
        price: 10,
        shop: 'Atlantas',
        flowerName: 'Xeranthemum',
        duration: '2 W',
        rating: 4.2,
        watering: 'Daily',
        temperature: '18 - 22',
        imageURL: 'assets/images/F3.png',
        isFavorated: false,
        decription:
            'Xeranthemum is a genus of flowering plants in the family Asteraceae, native to Southern Europe. It has silvery flower heads with purplish tubular flowers.',
        isSelected: false),
    Flower(
        flowerId: 3,
        price: 1500,
        shop: 'Orchidee Shop',
        flowerName: 'Calla Lily',
        duration: 'Small',
        rating: 4.9,
        watering: 'Daily',
        temperature: '15 - 26',
        imageURL: 'assets/images/F6.png',
        isFavorated: false,
        decription:
            'Calla lilies have long, arrow-shaped leaves that can be solid green or green flecked with white spots',
        isSelected: false),
    Flower(
        flowerId: 4,
        price: 70,
        shop: 'King Flower',
        flowerName: 'Anthuriums',
        duration: '8 W',
        rating: 4.4,
        watering: 'Daily',
        temperature: '18 - 29',
        imageURL: 'assets/images/F2.png',
        isFavorated: true,
        decription:
            'Anthurium andraeanum or Flamingo Lily is one of the best houseplants that purify indoor air',
        isSelected: false),
    Flower(
        flowerId: 5,
        price: 40,
        shop: 'Orchidee Shop',
        flowerName: 'Tulip',
        duration: '2 W',
        rating: 4.6,
        watering: 'Daily',
        temperature: '7 - 12',
        imageURL: 'assets/images/F1.png',
        isFavorated: false,
        decription:
            'Tulips are erect flowers with long, broad, parallel-veined leaves and a cup-shaped, single or double flower at the tip of the stem. Colors of the flowers can range anywhere from red to yellow to white.',
        isSelected: false),
    Flower(
        flowerId: 7,
        price: 50,
        shop: 'Plant Shop',
        flowerName: 'Basic Lily',
        duration: '4 W',
        rating: 4.3,
        watering: 'Daily',
        temperature: '15 - 23',
        imageURL: 'assets/images/F7.png',
        isFavorated: false,
        decription:
            'Basic Lily are often fragrant and come in a broad range of colors except blue.',
        isSelected: false),
  ];

  static List<Flower> getFavoritedFlower() {
    List<Flower> _travelList = Flower.flowerList;
    return _travelList.where((element) => element.isFavorated == true).toList();
  }

  static List<Flower> addedToCartFlower() {
    List<Flower> _selectedFlower = Flower.flowerList;
    return _selectedFlower
        .where((element) => element.isSelected == true)
        .toList();
  }

  int calculateSum() {
    List<Flower> _selectedFlower = Flower.flowerList;
    _selectedFlower =
        _selectedFlower.where((element) => element.isSelected == true).toList();
    int sum = 0;
    for (var x in _selectedFlower) {
      sum += x.price;
    }
    return sum;
  }
}
