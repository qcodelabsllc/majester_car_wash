import 'package:flutter/material.dart';
import 'package:majester_car_wash/core/extensions.dart';
import 'package:majester_car_wash/features/common/domain/entities/user.location.dart';
import 'package:majester_car_wash/features/common/presentation/widgets/button.dart';
import 'package:majester_car_wash/features/common/presentation/widgets/form.field.dart';
import 'package:majester_car_wash/features/common/presentation/widgets/progress.bar.dart';

/// allows users to add a location for their car to be picked up
class AddLocationPage extends StatefulWidget {
  const AddLocationPage({super.key});

  @override
  State<AddLocationPage> createState() => _AddLocationPageState();
}

class _AddLocationPageState extends State<AddLocationPage> {
  final _formKey = GlobalKey<FormState>(),
      _locationController = TextEditingController(),
      _tagController = TextEditingController(),
      _savedAddresses = List<UserLocation>.empty(growable: true);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Divider(
                color: context.theme.disabledColor,
                thickness: 1.5,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24, left: 24, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppButton(
                      onTap: _saveAddress,
                      label: 'Save address',
                      isOutlined: true,
                    ),
                    AppButton(
                      onTap: _validateAndSubmit,
                      label: 'Next',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // progress bar
                const AppProgressBar(progress: 0.2),
                const SizedBox(height: 20),
                Text(
                  'Location',
                  style: context.textTheme.subtitle1
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),

                // location picker
                AppFormField(
                  controller: _locationController,
                  placeholder: 'Tap to change your location',
                  validator: (input) => input == null || input.isEmpty
                      ? 'Location is required'
                      : null,
                  onTap: () {
                    // TODO: navigate to a location picker page and return location details
                    _locationController.text =
                        '13 Marwako Street, East Legon, Accra';
                  },
                ),
                const SizedBox(height: 16),

                // location tag
                AppFormField(
                  controller: _tagController,
                  placeholder: 'Tag your location (e.g. Home)',
                  autofocus: true,
                  inputType: TextInputType.text,
                  capitalization: TextCapitalization.words,
                  validator: (input) =>
                      input == null || input.isEmpty ? 'Tag is required' : null,
                ),

                if (_savedAddresses.isNotEmpty) ...{
                  const SizedBox(height: 20),
                  Text(
                    'Saved Addresses',
                    style: context.textTheme.subtitle1
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  ..._savedAddresses
                      .map(
                        (e) => ListTile(
                          title: Text(e.tag),
                          subtitle: Text(e.address),
                          leading: Checkbox(value: true, onChanged: (_) {}),
                          minLeadingWidth: 16,
                          trailing: Container(
                            width: 48,
                            height: 48,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              color: context.theme.disabledColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          contentPadding: const EdgeInsets.only(top: 12),
                        ),
                      )
                      .toList(),
                },
              ],
            ),
          ),
        ),
      );

  /// validates the form field
  void _validateAndSubmit() {
    if (_savedAddresses.isEmpty) {
      context.showSnackbar('Add a location to continue');
    } else {
      // TODO: navigate to add car page
    }
  }

  void _saveAddress() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      // save the state of the form
      _formKey.currentState?.save();

      // get data from fields
      var tag = _tagController.text.trim(),
          locationAddress = _locationController.text.trim();

      // add location to addresses
      // TODO: add location to local database
      setState(() => _savedAddresses.add(
            UserLocation(
                address: locationAddress, tag: tag, latitude: 0, longitude: 0),
          ));

      // clear fields
      _tagController.clear();
      _locationController.clear();
    }
  }
}
