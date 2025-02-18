<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

TODO: Vrajme Panel is a package library to be used in easing app development.

## Features

## Changelog

### Features

* **New Circular Buttons:** Added a set of consistent and customizable circular button widgets:
    * `CircleAlarmButton`: Circular button with an alarm icon (Entypo.bell). Supports enabling/disabling.
    * `CircleCameraButton`: Circular button with a camera icon. Supports enabling/disabling.
    * `CircleCancelButton`: Circular button with a cancel icon. Supports enabling/disabling.
    * `CircleDeleteButton`: Circular button with a delete icon. Supports enabling/disabling.
    * `CircleEditButton`: Circular button with an edit icon. Supports enabling/disabling.
    * `CircleMinusButton`: Circular button with a minus icon. Supports enabling/disabling.
    * `CirclePlusButton`: Circular button with a plus icon. Supports enabling/disabling.
    * `CirclePinButton`: Circular button with a pin icon (Entypo.location_pin). Supports enabling/disabling.

* **CircleIconTitle Widget:** Created a widget that displays a circular icon with a title text below it.  Supports dynamic sizing, optional title, and enabling/disabling.

* **CircleImageTitleActions Widget:**  Created a more advanced widget that displays a circular image (or a default image/icon if no image is provided) with a title below and an optional cancel button on the top-right corner. Supports dynamic sizing, optional title and cancel button, enabling/disabling, and image masking for the disabled state.


### Improvements
* **Refactoring:** Consolidated common code for circular buttons using helper functions for better maintainability.
* **Consistent Styling:** Standardized styling and parameters across all circular button widgets for consistency.
* **Proportional Sizing:** Improved sizing logic in `CircleIconTitle` and `CircleImageTitleActions` to ensure that the icon, circle, text, and padding scale proportionally with the widget's size.
* **Conditional Title Display:** Added conditional logic to `CircleImageTitleActions` to hide the title if the provided text is empty, also adjusting the widget's height accordingly.
* **Disabling Logic Enhancement:** Refined disabling logic to properly handle null callbacks and improve the visual representation of the disabled state using grayscale overlays.
* **Null Safety:** Improved null safety checks throughout the widgets to handle optional parameters and prevent runtime errors.
* **Aspect Ratio:** implemented 3:4 Aspect ratio in CircleImageTitleActions Widget.


