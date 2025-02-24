import 'dart:async';
import 'dart:io';

void main() {
  List<Map<String, dynamic>> cart = [];

  addCart(cart, "Apple", 15, 15.8);
  addCart(cart, "Banana", 80, 12.3);

  editCart(cart, "Banana", 75);
  removeCart(cart, "Apple");
  displayCart(cart);

  print("Tổng giá trị giỏ hàng : \$${tinhTong(cart)}");
}

void addCart(
    List<Map<String, dynamic>> cart, String tenSP, int soluong, double giaSP) {
  cart.add({'name': tenSP, 'soluong': soluong, 'price': giaSP});
}

void removeCart(List<Map<String, dynamic>> cart, String tenSP) {
  if (cart.isEmpty) {
    print("Không có sản phẩm nào trong giỏ hàng");
  }
  cart.removeWhere((cart) => cart["name"] == tenSP);
}

void editCart(List<Map<String, dynamic>> cart, String tenSP, int soluongNew) {
  if (cart.isEmpty) {
    print("Không có sản phẩm nào trong giỏ hàng");
  }
  for (var item in cart) {
    if (item["name"] == tenSP) {
      item["soluong"] = soluongNew;
      return;
    }
  }
}

void displayCart(List<Map<String, dynamic>> cart) {
  if (cart.isEmpty) {
    print("Không có sản phẩm nào trong giở hàng");
  }
  for (var item in cart) {
    print(
        "Tên sản phẩm: ${item["name"]}, Số lượng sản phẩm: ${item["soluong"]}, Giá tiền sản phẩm: ${item["price"]}");
  }
}

double tinhTong(List<Map<String, dynamic>> cart) {
  double tong = 0;
  for (var item in cart) {
    int soluong = item["soluong"] ?? 0;
    double price = item["price"] ?? 0.0;
    tong += soluong * price;
  }
  return tong;
}
