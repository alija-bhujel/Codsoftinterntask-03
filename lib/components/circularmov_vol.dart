import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicplayerapp/getxcontrollers/musiccontroller.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Volume_Extender extends StatefulWidget {
  const Volume_Extender({super.key});

  @override
  State<Volume_Extender> createState() => _Volume_ExtenderState();
}

class _Volume_ExtenderState extends State<Volume_Extender> {
  MusicController musicController = Get.put(MusicController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => SfRadialGauge(
          animationDuration: 1,
          enableLoadingAnimation: true,
          axes: [
            RadialAxis(
              useRangeColorForAxis: true,
              startAngle: 0,
              endAngle: 180,
              canRotateLabels: false,
              interval: 10,
              isInversed: false,
              maximum: 100,
              minimum: 0,
              showAxisLine: true,
              showLabels: false,
              showTicks: true,
              ranges: [
                GaugeRange(
                  startValue: 0,
                  endValue: musicController.isVolume.value,
                  color: Colors.pink,
                )
              ],
              pointers: [
                MarkerPointer(
                  borderWidth: 20,
                  value: musicController.isVolume.value,
                  onValueChanged: (valuee) {
                    musicController.changeVolume(valuee);
                  },
                  enableAnimation: true,
                  enableDragging: true,
                  markerType: MarkerType.diamond,
                  markerHeight: 20,
                  markerWidth: 10,
                  color: Colors.pink,
                )
              ],
              annotations: [
                //circle with image
                GaugeAnnotation(
                    horizontalAlignment: GaugeAlignment.center,
                    widget: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        width: 280,
                        height: 280,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage(
                                  'images/background.png',
                                ),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(1000),
                            color: Colors.grey),
                      ),
                    ))
              ],
            )
          ],
        ));
  }
}
