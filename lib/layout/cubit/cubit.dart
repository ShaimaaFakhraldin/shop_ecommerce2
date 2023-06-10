import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shop_ecommerce/layout/cubit/states.dart';
import 'package:shop_ecommerce/models/categories_model.dart';
import 'package:shop_ecommerce/models/change_favorites_model.dart';
import 'package:shop_ecommerce/models/cart_model.dart';
import 'package:shop_ecommerce/models/home_model.dart';
import 'package:shop_ecommerce/models/login_model.dart';
import 'package:shop_ecommerce/modules/cateogries/categories_screen.dart';
 import 'package:shop_ecommerce/modules/products/products_screen.dart';
import 'package:shop_ecommerce/modules/settings/settings_screen.dart';
import 'package:shop_ecommerce/shared/components/constants.dart';
import 'package:shop_ecommerce/shared/network/end_point.dart';
import 'package:shop_ecommerce/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/cart/cart_screen.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> listScreens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];

  List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Categories'),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  void changeBottomNav(int index) {
    if (index==3) getUserData();
    if (index==2) getFavorites();
      currentIndex = index;
      emit(ShopBottomNavState());
  }

  HomeModel ?homeModel;
  Map<int, bool> favorites = {};

  void getHomeData() {
    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {
      final List<String> imgList = [
        'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
        'https://images.unsplash.com/photo-1549298916-b41d501d3772?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1624&q=80',

      ];
      print(value.data);
      List<ProductModel> product =   List<ProductModel>.from(value.data["products"].map((x) => ProductModel.fromJson(x)));
      homeModel = HomeModel(status:  true ,data: HomeDataModel(products: product ,banners: imgList  ) );


      emit(ShopSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorHomeDataState());
    });
  }

  CategoriesModel ?categoriesModel;

  void getCategories() {
    DioHelper.getData(
      url: GET_CATEGORIES,
    ).then((value) {
      print('shaimaaaaa');
      categoriesModel = CategoriesModel.fromJson(value.data);
      categoriesModel?.status= true;
      categoriesModel?.message= 'categoriesModel loaded';
      emit(ShopSuccessCategoriesState());
    }).catchError((error) {
      print(error.toString());
      categoriesModel?.status= false;
      categoriesModel?.message= error.toString();
      emit(ShopErrorCategoriesState());
    });
  }

  ChangeFavoritesModel? changeFavoritesModel;

  void changeFavorites(int productId) {
    favorites[productId] = favorites[productId]!;
    emit(ShopChangeFavoritesState());

  }

  FavoritesModel? favoritesModel;


  UserData ?userModel;

  void getUserData() {
    emit(ShopLoadingUserDataState());

    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      userModel = UserData.fromJson(value.data);
      // printFullText(userModel.data.name);

      emit(ShopSuccessUserDataState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUserDataState());
    });
  }

  void updateUserData({
    required String name,
    required String email,
    required String phone,
  }) {
    emit(ShopLoadingUpdateUserState());

    DioHelper.putData(
      url: UPDATE_PROFILE,
      token: token,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
      },
    ).then((value) {
      userModel = UserData.fromJson(value.data);
      printFullText(userModel!.username);

      emit(ShopSuccessUpdateUserState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUpdateUserState());
    });
  }

  void getFavorites() {}
}
