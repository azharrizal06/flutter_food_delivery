import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/core.dart';
import '../models/track_record_model.dart';

class TrackignVertical extends StatelessWidget {
  final List<TrackRecordModel> trackRecords;
  const TrackignVertical({super.key, required this.trackRecords});

  @override
  Widget build(BuildContext context) {
    final sortedTrackRecords = trackRecords.toList()
      ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: sortedTrackRecords.length,
      itemBuilder: (BuildContext context, int index) => TrackingItem(
        trackRecord: sortedTrackRecords[index],
        isCurrent: index == 0,
        isLast: index == trackRecords.length - 1,
      ),
    );
  }
}

class TrackingItem extends StatelessWidget {
  final TrackRecordModel trackRecord;
  final bool isCurrent;
  final bool isLast;

  const TrackingItem({
    super.key,
    required this.trackRecord,
    required this.isCurrent,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 20.0,
          child: Column(
            children: [
              SvgPicture.asset(
                trackRecord.imagePath,
                height: 24.0,
                width: 24.0,
              ),
              if (!isLast)
                Container(
                  width: 2,
                  height: trackRecord.isDelivery ? 70.0 : 50.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.primary.withOpacity(0.0),
                        AppColors.primary,
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SpaceWidth(10.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              trackRecord.label,
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
                color: AppColors.gray3,
              ),
            ),
            const SpaceHeight(8.0),
            Text(
              trackRecord.title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            if (trackRecord.isDelivery) ...[
              const SpaceHeight(4.0),
              Text(
                trackRecord.address!,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.gray3,
                  fontSize: 12.0,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
