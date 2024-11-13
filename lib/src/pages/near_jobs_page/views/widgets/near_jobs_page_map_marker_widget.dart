import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import '../../../../infrastructures/themes/custom_theme.dart';
import '../../../../infrastructures/utils/constants/utils.dart';
import '../../models/jobs_marker_view_model.dart';

class NearJobsPageMapMarkerWidget extends StatelessWidget {
  final void Function(String id) onTap;

  final JobMarkersViewModel item;

  final bool isSelected;

  const NearJobsPageMapMarkerWidget({
    required this.isSelected,
    required this.item,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => ValueListenableBuilder(
        valueListenable: item.screenPosition,
        builder: (final context, final pos, final child) =>
            _content(context, pos),
      );

  Widget _content(final BuildContext context, final ScreenCoordinate pos) =>
      Positioned(
        left: pos.x,
        top: pos.y,
        child:
            isSelected ? _selectedMarker(context) : _unselectedWidget(context),
      );

  Widget _selectedMarker(final BuildContext context) => Material(
        elevation: 2.0,
        borderRadius: BorderRadius.circular(
          customTheme.borderRadiusCircular,
        ),
        color: customTheme.primaryColor.shade900,
        child: Padding(
          padding: utils.mediumPadding,
          child: Center(
            child: _selectedValue(context),
          ),
        ),
      );

  Widget _unselectedWidget(final BuildContext context) => GestureDetector(
        onTap: () => onTap(item.id),
        child: _unselectedMarker(context),
      );

  Widget _unselectedMarker(
    final BuildContext context,
  ) =>
      Material(
        elevation: 2.0,
        borderRadius: BorderRadius.circular(
          customTheme.borderRadiusCircular,
        ),
        child: Padding(
          padding: utils.smallPadding,
          child: Center(
            child: _unselectedValue(context),
          ),
        ),
      );

  Widget _unselectedValue(final BuildContext context) => Text(
        '\$${item.value.toInt()}',
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w700,
            ),
      );

  Widget _selectedValue(final BuildContext context) => Text(
        '\$${item.value.toInt()}',
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: customTheme.textColor.shade50,
              fontWeight: FontWeight.w700,
            ),
      );
}
