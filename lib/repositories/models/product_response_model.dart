
class ProductResponse {
  bool? status;
  String? message;
  Data? data;

  ProductResponse({this.status, this.message, this.data});
  ProductResponse.bool() {
    status = true;
  }

  ProductResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Products>? products;

  Data({this.products});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? prodImage;
  String? prodId;
  String? prodCode;
  String? prodName;
  String? prodPrice;
  String? prodMrp;

  Products(
      {this.prodImage,
      this.prodId,
      this.prodCode,
      this.prodName,
      this.prodPrice,
      this.prodMrp});

  Products.fromJson(Map<String, dynamic> json) {
    prodImage = json['prodImage'];
    prodId = json['prodId'];
    prodCode = json['prodCode'];
    prodName = json['prodName'];
    prodPrice = json['prodPrice'];
    prodMrp = json['prodMrp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['prodImage'] = prodImage;
    data['prodId'] = prodId;
    data['prodCode'] = prodCode;
    data['prodName'] = prodName;
    data['prodPrice'] = prodPrice;
    data['prodMrp'] = prodMrp;
    return data;
  }
}

