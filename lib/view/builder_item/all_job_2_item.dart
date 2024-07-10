import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../control/cubit/fav_job/app_cubit.dart';
import '../../model/shared/colors_theme.dart';
import '../../model/shared/constant_attribute.dart';
import '../widget/default_text_field.dart';

Widget BuilderAllJobs2 (Map model , context) =>

    Dismissible(
        key: Key(model['id'].toString()), // delete depends on id
        child: Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [

                DefaultText(
                  text: ("${model['title']}"),
                  color: AppTheme.blackGP,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),

                DefaultText(
                  text: ("${model['companyName']}"),
                  color: AppTheme.gray,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),

                DefaultText(
                  text: ("${model['salary']}"),
                  color: AppTheme.greenGP,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          const SizedBox(width: 20,),
          IconButton(
              onPressed: (){
                AppCubit.get(context).UpdateData(favorites: ['1'], id: model['id'],);
                Fluttertoast.showToast(
                                msg: " Successfully added to Fav Jobs!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 3,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );

              },
              icon: const Icon(
                Icons.favorite,
                color: AppTheme.gray,
          ),
          ),
        ],
      ),
        ),
        onDismissed: (direction){ // for deleting
      AppCubit.get(context).DeleteData(id: model['id'],);
        },
    );