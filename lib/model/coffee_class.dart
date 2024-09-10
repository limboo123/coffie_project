class CoffeeClass{
  String image;
  String name;
  double price;
  String berif;
  double rating;
  int quantity;
  bool fav;

  CoffeeClass({
    required this.image,
    required this.name,
    required this.price,
    required this.berif,
    required this.rating,
    required this.quantity,
    this.fav=false,
});
}
