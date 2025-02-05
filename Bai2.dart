import 'dart:io';

void main() {
  print("Ten san pham: ");
  var tensp = stdin.readLineSync().toString();
  print("So luong mua: ");
  int slmua = int.parse(stdin.readLineSync().toString());
  print("Don gia: ");
  double dongia = double.parse(stdin.readLineSync().toString());

  double thanhtien = slmua * dongia;
  var discount;
  if (thanhtien >= 1000000) {
    discount = thanhtien * 0.1;
  }
  if (thanhtien >= 500000 && thanhtien < 1000000) {
    discount = thanhtien * 0.05;
  }
  if (thanhtien < 500000) {
    discount = 0;
  }

  double tongtruocthue = thanhtien - discount;

  double thueVAT = tongtruocthue * 0.08;
  double tongbill = tongtruocthue + thueVAT;

  print("Ten san pham : $tensp");
  print("So luong mua: $slmua");
  print("Don gia: $dongia");
  print("Thanh tien: $thanhtien");
  print("Giam gia: $discount");
  print("Thue VAT: $thueVAT");
  print("Tong thanh toan cuoi cung: $tongbill");
}
