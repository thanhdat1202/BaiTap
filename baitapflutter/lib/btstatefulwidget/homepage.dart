import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Shoe> LstGioHang = [];

  // Danh sách giày
  List<Shoe> LstGiay = [
    Shoe(
      name: "Nike Vapor 16 pro",
      image:
          "https://bizweb.dktcdn.net/100/352/697/products/z6218432605354-3d831c9ef609a398e5390834a5e78a8d.jpg?v=1737609448010",
      price: 2500000,
      quantity: 1,
    ),
    Shoe(
      name: "Adidas Predetor Elite",
      image:
          "https://supersports.com.vn/cdn/shop/files/IF8867-1_1200x1200.jpg?v=1717755773",
      price: 1950000,
      quantity: 1,
    ),
    Shoe(
      name: "Puma Future Ultimate", 
      image:
          "https://product.hstatic.net/200000601263/product/107355-01_2_5c41b2719b4a4b9fb4299a54c1ac5941.jpg",
      price: 2900000,
      quantity: 1,
    ),
    Shoe(
      name: "Mizuno Alpha Pro AS",
      image:
          "https://product.hstatic.net/1000061481/product/anh_sp_add_web_mizuno2-01_debfebde27d9481bae0f86de941ce09d_1024x1024.jpg",
      price: 2650000,
      quantity: 1,
    ),
  ];

  // Thêm giày vào giỏ hàng
  void onAddToCart(Shoe shoe){
    setState(() {
      final item = LstGioHang.indexWhere((item) => item.name == shoe.name);
      //Nếu chưa có thì thêm vào giỏ hàng
      if(item == -1){
        LstGioHang.add(Shoe.fromJson(shoe.toJson()));
      }
      //Nếu có rồi thì tăng số lượng lên 1
      else{
        LstGioHang[item].quantity += 1;
      }
    });
  }

  void onXoa(Shoe shoe){
    setState(() {
      final item = LstGioHang.indexWhere((item) => item.name == shoe.name);
      if(item != -1){
        LstGioHang.removeAt(item);
      }
    });
  }

  //Tính tổng tiền
  int tongTien(){
    int total = 0;
    for (var item in LstGioHang) {
      total += item.price * item.quantity;
    }
    return total;
  }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Shoe Store",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Giỏ hàng",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
            flex: 2,
            child: ListView(
              children: LstGioHang
                  .map(
                    (giay) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ItemGioHang(
                        shoe: giay,
                        onXoa: () => onXoa(giay),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tổng tiền: ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${tongTien()}đ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            Text(
              "Danh sách giày",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
            flex: 1,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: LstGiay
                  .map(
                    (giay) => Container(
                      width: 160,
                      margin: EdgeInsets.all(8),
                      child: ItemGiay(
                        shoe: giay,
                        onAddToCart: () => onAddToCart(giay),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          ],
        ),
      ),
    );
  }
}

class ItemGiay extends StatelessWidget {
  final Shoe shoe;
  final VoidCallback onAddToCart;

  ItemGiay({required this.shoe, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(
            shoe.image,
            height: 100,
          ),
          Text(shoe.name),
          Text("${shoe.price}đ"),
          ElevatedButton(
            onPressed: onAddToCart, // Khi nhấn thêm vào giỏ
            child: Text("Thêm vào giỏ"),
          )
        ],
      ),
    );
  }
}

class ItemGioHang extends StatelessWidget {
  // const ItemGioHang({super.key});

  final Shoe shoe;
  final VoidCallback onXoa;

  ItemGioHang({required this.shoe, required this.onXoa});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Image.network(shoe.image, width: 50),
        title: Text(shoe.name),
        subtitle: Row(
          children: [
            Text("Giá: ${shoe.price}đ"),
            SizedBox(width: 50),
            Text("Số lượng: ${shoe.quantity}"),
          ],
        ),
        trailing: IconButton(
          onPressed: onXoa,
          icon: Icon(FontAwesomeIcons.trashCan, color: Colors.red),
        ),
      ),
    );
  }
}

class Shoe {
  String name;
  String image;
  int price;
  int quantity;

  // Constructor
  Shoe({
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
  });

  //tạo object từ JSON
  factory Shoe.fromJson(Map<String, dynamic> json) {
    return Shoe(
      name: json['name'],
      image: json['image'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }

  //Chuyển object về JSON
  Map<String, dynamic> toJson() {
    return {'name': name, 'image': image, 'price': price, 'quantity': quantity};
  }
}
