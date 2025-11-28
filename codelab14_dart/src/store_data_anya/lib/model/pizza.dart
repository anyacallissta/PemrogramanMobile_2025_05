const keyId = 'id';
const keyName = 'pizzaName';
const keyDesc = 'description';
const keyPrice = 'price';
const keyImage = 'imageUrl';

class Pizza {
  final int id;
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;

  Pizza.fromJson(Map<String, dynamic> json) : 
    // id = json['id'],
    // pizzaName = json['pizzaName'],
    // description = json['description'],
    // price = json['price'],
    // imageUrl = json['imageUrl'];

    // id = int.tryParse(json['id'].toString()) ?? 0,
    // pizzaName = json['pizzaName'] != null ? json['pizzaName'].toString() : 'No name',
    // description = (json['description'] != null) ? json['description'].toString() : '',
    // price = double.tryParse(json['price'].toString()) ?? 0,
    // imageUrl = json['imageUrl'] ?? '';

    id = int.tryParse(json[keyId]?.toString() ?? '') ?? 0,
    pizzaName = json[keyName] != null ? json[keyName].toString() : 'No name',
    description = (json[keyDesc] != null) ? json[keyDesc].toString() : '',
    price = double.tryParse(json[keyPrice]?.toString() ?? '') ?? 0,
    imageUrl = json[keyImage] ?? '';

  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      // 'pizzaName': pizzaName,
      // 'description': description,
      // 'price': price,
      // 'imageUrl': imageUrl,

      keyId: id,
      keyName: pizzaName,
      keyDesc: description,
      keyPrice: price,
      keyImage: imageUrl,
    };
  }
}