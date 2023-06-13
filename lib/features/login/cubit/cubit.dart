import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/features/login/cubit/states.dart';
import 'package:shop_ecommerce/models/login_model.dart';
import 'package:shop_ecommerce/shared/network/remote/dio_helper.dart';

import '../../../shared/network/end_point.dart';

class ShopLoginCubit  extends Cubit<ShoppingAppLoginState> {
  ShopLoginCubit():super(ShoppingLoginInitState());
  LoginModel? loginModel;

  void userLogin ({required String userName , required password}){
    emit(ShoppingLoginLoadingState());
    DioHelper.postData(url: LOGIN, data:{"username":userName ,"password" : password})
        .then((respone) {
          print(respone.data);
            loginModel = LoginModel.fromJson(respone.data);
          loginModel!.status = true;
           loginModel!.message =" welcome again";
           emit(ShoppingLoginSuccessState(loginModel: loginModel!));


    }).catchError((onError){
      loginModel = LoginModel.fromJson({});
      loginModel!.status = false;
      loginModel!.message =onError.toString();
      emit(ShoppingLoginErrorState(error: onError.toString()));
    });


  }



}