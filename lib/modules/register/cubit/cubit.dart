import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/models/login_model.dart';
import 'package:shop_ecommerce/modules/register/cubit/states.dart';
import 'package:shop_ecommerce/shared/network/end_point.dart';
import 'package:shop_ecommerce/shared/network/remote/dio_helper.dart';


class ShopRegisterCubit extends Cubit<ShopRegisterStates> {
  ShopRegisterCubit() : super(ShopRegisterInitialState());

  static ShopRegisterCubit get(context) => BlocProvider.of(context);

  UserData? loginModel;

  void userRegister({
    required String name,
    required String email,
    required String password,
    // required String phone,
  })
  {
   // emit(ShopRegisterLoadingState());

    DioHelper.postData(
      url: REGISTER,
      data:
      {
        // 'name': name,
        // 'email': email25
        // 'password': password,
        // 'phone': phone,
        'firstName':email,
        'lastName':name,
        'age':password,
      },
    ).then((value)
    {
      print(value.data);
      print('shaimaaaaaaaaaa');
      loginModel = UserData.fromJson(value.data);
      loginModel?.status= true;
      loginModel?.message= 'welcome';
     emit(ShopRegisterSuccessState(loginModel!));
    }).catchError((error)
    {
      print('shaimaaaaaaaaaa ${error.toString()}');
      loginModel = UserData.fromJson({});
      loginModel?.status= false ;
      loginModel?.message= error.toString();
      print(error.toString());
     emit(ShopRegisterErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(ShopRegisterChangePasswordVisibilityState());
  }
}
