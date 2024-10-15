class Product {
  final String id;
  final String name;
  final String price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  // Jika Anda menggunakan JSON untuk data
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  // Daftar produk statis
  static List<Product> products = [
    Product(
      id: '1',
      name: 'Minyak Bimoli 2 Liter',
      price: 'Rp 35.000',
      imageUrl: 'https://i.ibb.co.com/ygnDsPT/product-image-bimoli2.png',
    ),
    Product(
      id: '2',
      name: 'Indomie Goreng',
      price: 'Rp 3.500',
      imageUrl: 'https://i.ibb.co.com/8cvD1qR/product-indomie.png',
    ),
    Product(
      id: '3',
      name: 'Tepung Terigu Segitiga Biru',
      price: 'Rp 15.000',
      imageUrl: 'https://i.ibb.co.com/VV39147/product-tepung-segitigabiru.png',
    ),
    // Tambahkan produk lainnya di sini
  ];

  // Method untuk mendapatkan semua produk
  static List<Product> getAllProducts() {
    return products;
  }

  // Method untuk mendapatkan produk berdasarkan ID
  static Product? getProductById(String id) {
    return products.firstWhere((product) => product.id == id);
  }
}
