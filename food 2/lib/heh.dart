class ApiRes {
  String? transformedImage;
  PlateFood? plateFood;
  PackagedFood? packagedFood;
  String? mimeType;

  ApiRes(
      {this.transformedImage,
      this.plateFood,
      this.packagedFood,
      this.mimeType});

  ApiRes.fromJson(Map<String, dynamic> json) {
    transformedImage = json['transformed_image'];
    plateFood = json['plate_food'] != null
        ? PlateFood.fromJson(json['plate_food'])
        : null;
    packagedFood = json['packaged_food'] != null
        ? PackagedFood.fromJson(json['packaged_food'])
        : null;
    mimeType = json['mime_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transformed_image'] = transformedImage;
    if (plateFood != null) {
      data['plate_food'] = plateFood!.toJson();
    }
    if (packagedFood != null) {
      data['packaged_food'] = packagedFood!.toJson();
    }
    data['mime_type'] = mimeType;
    return data;
  }
}

class PlateFood {
  BoundingBoxes? boundingBoxes;
  PixelCount? pixelCount;

  PlateFood({this.boundingBoxes, this.pixelCount});

  PlateFood.fromJson(Map<String, dynamic> json) {
    boundingBoxes = json['bounding_boxes'] != null
        ? BoundingBoxes.fromJson(json['bounding_boxes'])
        : null;
    pixelCount = json['pixel_count'] != null
        ? PixelCount.fromJson(json['pixel_count'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (boundingBoxes != null) {
      data['bounding_boxes'] = boundingBoxes!.toJson();
    }
    if (pixelCount != null) {
      data['pixel_count'] = pixelCount!.toJson();
    }
    return data;
  }
}

class BoundingBoxes {
  Map<dynamic, dynamic>? remjs;
  // String? a;

  BoundingBoxes({this.remjs});

  BoundingBoxes.fromJson(Map<dynamic, dynamic> json) {
    remjs = json;
    // a = json['a'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data =
        // <String, dynamic>{};
        // data =
        remjs ?? {};
    // data['a'] = a;
    return data;
  }
}

class PixelCount {
  Map<String, dynamic>? itemsJson;

  // int? banana;
  // int? milkBread;

  PixelCount(
      {
      // this.banana, this.milkBread,
      this.itemsJson});

  PixelCount.fromJson(Map<String, dynamic> json) {
    // banana = json['Banana,'];
    // milkBread = json['Milk Bread,'];
    itemsJson = json;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = itemsJson ?? {};
    // <String, dynamic>{};
    // data['Banana,'] = banana;
    // data['Milk Bread,'] = milkBread;
    return data;
  }
}

class PackagedFood {
  BoundingBoxes? boundingBoxes;

  PackagedFood({this.boundingBoxes});

  PackagedFood.fromJson(Map<dynamic, dynamic> json) {
    boundingBoxes = json['bounding_boxes'] != null
        ? BoundingBoxes.fromJson(json['bounding_boxes'])
        : null;
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    if (boundingBoxes != null) {
      data['bounding_boxes'] = boundingBoxes!.toJson();
    }
    return data;
  }
}
