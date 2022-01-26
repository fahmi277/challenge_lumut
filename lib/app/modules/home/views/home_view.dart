// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:challenge_lumut/app/data/models/list_todos_model.dart';
import 'package:challenge_lumut/app/modules/home/views/detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    // if (Device.get().isTablet) {
    //   print("Tablet");
    //   //do something large
    // }
    return Obx(() {
      return SafeArea(
        child: Scaffold(
            body: controller.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : Device.get().isTablet
                    ? Row(
                        children: [
                          Expanded(
                              child: ListView.builder(
                                  itemCount: controller.listTodos.length,
                                  itemBuilder: (context, count) {
                                    ListTodos listTodos =
                                        controller.listTodos[count];

                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: SizedBox(
                                        height: 100.h,
                                        width: double.infinity,
                                        child: InkWell(
                                          onTap: () {
                                            controller.data.value = count;
                                            controller.dataTodos.value =
                                                controller.listTodos[count];
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(listTodos.id.toString()),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text("Title"),
                                                        AutoSizeText(
                                                          listTodos.title,
                                                          maxLines: 2,
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text("Completed"),
                                                        Text(listTodos.completed
                                                            .toString())
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                              // Text(listTodos.userId.toString()),
                                              // Text(listTodos.title),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  })),
                          SizedBox(width: 10.w),
                          Expanded(
                              child: Column(
                            children: [
                              SizedBox(
                                height: 200.h,
                              ),
                              Text(controller.dataTodos.value.id.toString()),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(controller.dataTodos.value.title),
                            ],
                          ))
                        ],
                      )
                    : ListView.builder(
                        itemCount: controller.listTodos.length,
                        itemBuilder: (context, count) {
                          ListTodos listTodos = controller.listTodos[count];

                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: SizedBox(
                              height: 100.h,
                              width: double.infinity,
                              child: InkWell(
                                onTap: () {
                                  Get.to(DetailView(listTodos: listTodos));
                                  // controller.data.value = count;
                                  // controller.dataTodos.value =
                                  //     controller.listTodos[count];
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Title"),
                                          AutoSizeText(
                                            listTodos.title,
                                            maxLines: 2,
                                          ),
                                        ],
                                      ),
                                    )
                                    // Text(listTodos.userId.toString()),
                                    // Text(listTodos.title),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })),
      );
    });
  }
}
