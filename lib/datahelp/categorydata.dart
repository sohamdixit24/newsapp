import 'package:newsapp/models/category_model.dart';



List<CategoryModel> getCategories(){
  List<CategoryModel> categories = <CategoryModel>[];

  CategoryModel category = CategoryModel(categoryName: 'All');
  categories.add(category);

  CategoryModel category2 = CategoryModel(categoryName: 'National');
  categories.add(category2);
  CategoryModel category3 = CategoryModel(categoryName: 'Business');
  categories.add(category3);
  CategoryModel category4 = CategoryModel(categoryName: 'Sports');
  categories.add(category4);
  CategoryModel category5 = CategoryModel(categoryName: 'World');
  categories.add(category5);
  CategoryModel category6 = CategoryModel(categoryName: 'Politics');
  categories.add(category6);
  CategoryModel category7 = CategoryModel(categoryName: 'Technology');
  categories.add(category7);
  CategoryModel category8 = CategoryModel(categoryName: 'Startup');
  categories.add(category8);
  CategoryModel category9= CategoryModel(categoryName: 'Entertainment');
  categories.add(category9);
  CategoryModel category10 = CategoryModel(categoryName: 'Miscellaneous');
  categories.add(category10);
  CategoryModel category11 = CategoryModel(categoryName: 'Hatke');
  categories.add(category11);
  CategoryModel category12 = CategoryModel(categoryName: 'Science');
  categories.add(category12);
  CategoryModel category13 = CategoryModel(categoryName: 'Automobile');
  categories.add(category13);

  return categories;
}


