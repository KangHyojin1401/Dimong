import 'package:flutter/material.dart';
import 'package:dimong/core/domain/dino.dart';
import 'package:dimong/ui/screens/home/connect_home.dart';
import 'package:shaky_animated_listview/animators/grid_animator.dart';
import 'package:shaky_animated_listview/animators/shake_transition.dart';
import 'package:shaky_animated_listview/scroll_animator.dart';
import 'package:shaky_animated_listview/widgets/animated_gridview.dart';
import 'package:shaky_animated_listview/widgets/animated_listview.dart';
import '../dic_detail.dart';

class DinoGrid extends StatefulWidget {
  final List<SendPeriodResponse>? items;
  const DinoGrid({Key? key, required this.items}) : super(key: key);

  @override
  State<DinoGrid> createState() => _DinoGridState();
}

class _DinoGridState extends State<DinoGrid> {
  final ConnectRoute _connectRoute = ConnectRoute();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: widget.items!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          final item = widget.items![index];
          return GridAnimatorWidget(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Container(
                    // margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(7),
                    color: const Color(0xFFACC864),

                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(10),
                    //   color: const Color(0xFFACC864),
                    // ),
                    child: GestureDetector(
                      onTap: () async{
                        await _connectRoute.toDinoDetail(context, index);
                      },
                      child: Stack(
                        children: [
                          Positioned(
                            child: ClipOval(
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [Color(0x33FFFFFF),Color(0x99D2DCC4)],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                                width: 200,
                                height: 200,
                              ),
                            ),
                          ),
                          Positioned.fill(
                            //
                            child: Image.network(item.dinosaurImageUrl!,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Positioned(
                            left: 5,
                            bottom: 5,
                            child: Text(
                              item.dinosaurName!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                     ]),
                    )
                ),
              ),
            ),
          );
        }
    );
  }
}
