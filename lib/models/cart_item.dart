class CartItem{
  final String id;
  final String title;
  final int quantify;
  final double price; 
  
  CartItem({
    required this.id,
    required this.title,
    required this.quantify,
    required this.price,

  });
  CartItem copyWith({
    String? id,
    String? title,
    int? quantify,
    double? price,
  }){
    return CartItem(
      id: id ?? this.id,
      title: title ?? this.title,
      quantify: quantify ?? this.quantify,
      price: price ?? this.price,
      );
  }

}