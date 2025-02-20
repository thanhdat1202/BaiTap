import 'dart:io';

void main(List<String> args) {
  //Bai 1
  // List<Student> student = [];

  // while (true) {
  //   print("1. Thêm sinh viên");
  //   print("2. Hiển thị danh sách sinh viên");
  //   print("3. Tìm sinh viên có điểm trung bình cao nhất trong danh sách");
  //   print("4. Thoát chương trình");

  //   var choice = stdin.readLineSync();
  //   switch (choice) {
  //     case '1':
  //       addStudent(student);
  //       break;
  //     case '2':
  //       hienThiDS(student);
  //       break;
  //     case '3':
  //       findTopSV(student);
  //       break;
  //     case '4':
  //       exit(0);
  //     default:
  //   }
  // }

  //Bai 2
  List<Product> product = [];
  while (true) {
    print("1. Thêm sản phẩm.");
    print("2. Hiển thị danh sách sản phẩm.");
    print("3. Tìm kiếm sản phẩm theo tên.");
    print("4. Bán sản phẩm");
    print("5. Thoát");

    var choice = stdin.readLineSync();
    switch (choice) {
      case '1':
        addProduct(product);
        break;
      case '2':
        hienThiSP(product);
        break;
      case '3':
        findNameSP(product);
        break;
      case '4':
        break;
      case '5':
        exit(0);
      default:
    }
  }
}

class Product {
  var tenSP;
  double? giatien;
  int? soluongSP;

  Product(this.tenSP, this.giatien, this.soluongSP);
}

void addProduct(List<Product> product) {
  stdout.write("Tên sản phẩm: ");
  String tenSP = stdin.readLineSync().toString();
  stdout.write("Gía tiền sản phẩm: ");
  double giatien = double.parse(stdin.readLineSync()!);
  stdout.write("Số lượng sản phẩm trong kho: ");
  int slSP = int.parse(stdin.readLineSync()!);

  product.add(Product(tenSP, giatien, slSP));
}

void hienThiSP(List<Product> product) {
  if (product.isEmpty) {
    print("Danh sách sản phẩm hiện đang trống !!");
  }
  for (var DSSP in product) {
    print(
        "Tên sản phẩm: ${DSSP.tenSP}, Gía tiền: ${DSSP.giatien}, Số lượng sản phẩm: ${DSSP.soluongSP}");
  }
}

void findNameSP(List<Product> product) {
  if (product.isEmpty) {
    print("Danh sách sản phẩm hiện đang trống !!");
  } else {
    stdout.write("Nhập tên SP cần tìm: ");
    var name = stdin.readLineSync();
    var nameSP = product.where((sp) => sp.tenSP == name);
    if (nameSP.isEmpty) {
      print("Không tìm thấy sản phẩm");
    } else {
      for (var sanpham in nameSP) {
        print(
            "Tên sản phẩm: ${sanpham.tenSP}, Giá tiền: ${sanpham.giatien}, Số lượng: ${sanpham.soluongSP}");
      }
    }
  }
}

//bai 11
class Student {
  var hoten;
  double? diemToan;
  double? diemLy;
  double? diemHoa;

  Student(this.hoten, this.diemToan, this.diemHoa, this.diemLy);

  double get diemTB => (diemToan! + diemLy! + diemHoa!) / 3;

  String get phanLoai {
    if (diemTB < 5) return "Kém";
    if (diemTB < 7) return "Trung bình";
    if (diemTB < 9) return "Khá";
    return "Xuất sắc";
  }
}

void addStudent(List<Student> student) {
  stdout.write("Nhập họ tên sinh viên: ");
  String hoten = stdin.readLineSync().toString();
  stdout.write("Nhập điểm Toán: ");
  double diemToan = double.parse(stdin.readLineSync()!);
  stdout.write("Nhập điểm Lý: ");
  double diemLy = double.parse(stdin.readLineSync()!);
  stdout.write("Nhập điểm Hóa: ");
  double diemHoa = double.parse(stdin.readLineSync()!);

  student.add(Student(hoten, diemToan, diemHoa, diemLy));
}

void hienThiDS(List<Student> student) {
  if (student.isEmpty) {
    print("Danh sách sinh viên hiện đang trống !!");
  } else {
    for (var student in student) {
      print(
          "Ten: ${student.hoten}, Diem trung binh: ${student.diemTB.toString()}, Phan loai sinh vien: ${student.phanLoai}");
    }
  }
}

void findTopSV(List<Student> student) {
  if (student.isEmpty) {
    print("Danh sách sinh viên hiện đang trống !!");
  }
  Student topSV = student.reduce((a, b) => a.diemTB > b.diemTB ? a : b);
  print(
      "Ten: ${topSV.hoten}, Diem trung binh: ${topSV.diemTB.toString()}, Phan loai sinh vien: ${topSV.phanLoai}");
}
