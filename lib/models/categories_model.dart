

import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) => CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) => json.encode(data.toJson());

class CategoriesModel {
List<String> data;
bool status = false;
String message ='';

CategoriesModel({
required this.data,
});

factory CategoriesModel.fromJson(List<dynamic> json) => CategoriesModel(
data: json.map((e) => e.toString()).toList()
);

Map<String, dynamic> toJson() => {
"data": List<dynamic>.from(data.map((x) => x)),
};
}
