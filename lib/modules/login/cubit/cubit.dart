import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/models/login_model.dart';
import 'package:shop_ecommerce/modules/login/cubit/states.dart';
import 'package:shop_ecommerce/shared/network/end_point.dart';
import 'package:shop_ecommerce/shared/network/remote/dio_helper.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialState());
  UserData ?loginModel;

  static  ShopLoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String username,
    required String password,
  }) {
    emit(ShopLoginLoadingState());

    DioHelper.postData(
      url: LOGIN,
      data: {
        'username': username,
        'password': password,
      },
    ).then((value) {
      print(value.data);
      print('shaimaaaaaaaaaa done');
      loginModel = UserData.fromJson(value.data);
      loginModel?.status= true;
      loginModel?.message= 'welcome back';
      emit(ShopLoginSuccessState(loginModel!));
    }).catchError((error) {
      print(error.toString());
      print('shaimaaaaaaaaaa error ');
      loginModel = UserData.fromJson({});
      loginModel!.status= false ;
      loginModel!.message= error.toString();
      print(error.toString());
      emit(ShopLoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopChangePasswordVisibilityState());
  }
}
