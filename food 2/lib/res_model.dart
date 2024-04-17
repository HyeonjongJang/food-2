class ResModel {
  ResModel({
    required this.result,
    required this.data,
  });
  late final bool result;
  late final Data data;

  ResModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final dataa = <String, dynamic>{};
    dataa['result'] = result;
    dataa['data'] = data.toJson();
    return dataa;
  }
}

class Data {
  Data({
    required this.image,
    required this.text,
  });
  late final List<String> image;
  late final Text text;

  Data.fromJson(Map<String, dynamic> json) {
    image = List.castFrom<dynamic, String>(json['image']);
    text = Text.fromJson(json['text']);
  }

  Map<String, dynamic> toJson() {
    final dataaa = <String, dynamic>{};
    dataaa['image'] = image;
    dataaa['text'] = text.toJson();
    return dataaa;
  }
}

class Text {
  Text({
    required this.meta,
    required this.food,
    required this.nutrient,
  });
  late final Meta meta;
  late final Food food;
  late final Nutrient nutrient;

  Text.fromJson(Map<String, dynamic> json) {
    meta = Meta.fromJson(json['meta']);
    food = Food.fromJson(json['food']);
    nutrient = Nutrient.fromJson(json['nutrient']);
  }

  Map<String, dynamic> toJson() {
    final dataa = <String, dynamic>{};
    dataa['meta'] = meta.toJson();
    dataa['food'] = food.toJson();
    dataa['nutrient'] = nutrient.toJson();
    return dataa;
  }
}

class Meta {
  Meta({
    required this.imageSize,
  });
  late final String imageSize;

  Meta.fromJson(Map<String, dynamic> json) {
    imageSize = json['image size'];
  }

  Map<String, dynamic> toJson() {
    final dataa = <String, dynamic>{};
    dataa['image size'] = imageSize;
    return dataa;
  }
}

class Food {
  Food({
    required this.name,
    required this.pixel,
  });
  late final String name;
  late final String pixel;

  Food.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    pixel = json['pixel'];
  }

  Map<String, dynamic> toJson() {
    final dataaaa = <String, dynamic>{};
    dataaaa['name'] = name;
    dataaaa['pixel'] = pixel;
    return dataaaa;
  }
}

class Nutrient {
  Nutrient({
    required this.gram,
    required this.calorie,
    required this.carbohydrate,
    required this.protein,
    required this.fat,
  });
  late final String gram;
  late final String calorie;
  late final String carbohydrate;
  late final String protein;
  late final String fat;

  Nutrient.fromJson(Map<String, dynamic> json) {
    gram = json['gram'];
    calorie = json['calorie'];
    carbohydrate = json['carbohydrate'];
    protein = json['protein'];
    fat = json['fat'];
  }

  Map<String, dynamic> toJson() {
    final dataaaaa = <String, dynamic>{};
    dataaaaa['gram'] = gram;
    dataaaaa['calorie'] = calorie;
    dataaaaa['carbohydrate'] = carbohydrate;
    dataaaaa['protein'] = protein;
    dataaaaa['fat'] = fat;
    return dataaaaa;
  }
}
