import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/data_base/book_package_data_base.dart';
import '../data/model/brand_color_model.dart';
import '../data/model/brand_model.dart';
import '../data/model/brands.dart';
import '../data/model/check_car_model.dart';
part 'book_package_state.dart';

class BookPackageCubit extends Cubit<BookPackageState> {
  BookPackageCubit() : super(BookPackageInitial());
  static BookPackageCubit get(BuildContext context)=>BlocProvider.of(context);
  BookPackageDataSource bookPackageDataSource =BookPackageDataSource();
  List<BrandsData?> brands=<BrandsData?>[];
  List<BrandModelData?> brandModelList=<BrandModelData?>[];
  List<BrandColorsData?> brandColorsList=<BrandColorsData?>[];


  var brandSelectedValue ='';
  var brandSelectedId ='';
  var yearSelectedValue ='';
  var brandModelSelectedValue ='';
  var brandModelSelectedId ='';
  var colorSelectedValue ='';
  var colorSelectedId ='';
  TextEditingController descriptionController=TextEditingController();
  TextEditingController chassisController=TextEditingController();
  void getBrands({String? type, required BuildContext context}){
    brands.clear();
    bookPackageDataSource.getBrands(type,context).then((value) {
      brands =value!.data!;
      emit(GetBrandsState());
    });
  }
  int brandId =1;
  void getBrandModel(BuildContext context){
    brandModelList.clear();
    bookPackageDataSource.getBrandModel(brandId,context).then((BrandModel? value) {
      brandModelList =value!.data!;
      emit(GetBrandsState());
    });
  }
  void sendCheckCar(CheckCarModel checkCarModel ,BuildContext context){
     bookPackageDataSource.checkCar(checkCarModel ,context);
    emit(GetBrandsState());
  }
  void getBrandColors(BuildContext context){
    bookPackageDataSource.getBrandColors(context).then((value) {
      brandColorsList =value!.data!;
      emit(GetBrandsState());

    });
  }
  bool isLoading=false;
  void changeLoading(bool x){
    isLoading=x;
    emit(LoadingState());
  }
}
