# Package index

## Core `teal` functions

Main functions needed to build a `teal` app

- [`init()`](https://pharmaverse.github.io/teal/reference/init.md) :

  Create the server and UI function for the `shiny` app

- [`teal_data_module()`](https://pharmaverse.github.io/teal/reference/teal_data_module.md)
  [`eval_code(`*`<teal_data_module>`*`)`](https://pharmaverse.github.io/teal/reference/teal_data_module.md)
  [`within(`*`<teal_data_module>`*`)`](https://pharmaverse.github.io/teal/reference/teal_data_module.md)
  **\[experimental\]** :

  Data module for `teal` applications

- [`teal_transform_module()`](https://pharmaverse.github.io/teal/reference/teal_transform_module.md)
  **\[experimental\]** :

  Data module for `teal` transformations and output customization

- [`srv_transform_teal_data()`](https://pharmaverse.github.io/teal/reference/module_transform_data.md)
  [`ui_transform_teal_data()`](https://pharmaverse.github.io/teal/reference/module_transform_data.md)
  :

  Apply `teal_transform_module` decorators to reactive `teal_data`

- [`make_teal_transform_server()`](https://pharmaverse.github.io/teal/reference/make_teal_transform_server.md)
  : Make teal_transform_module's server

- [`ui_teal()`](https://pharmaverse.github.io/teal/reference/module_teal.md)
  [`srv_teal()`](https://pharmaverse.github.io/teal/reference/module_teal.md)
  :

  `teal` main module

- [`ui_session_info()`](https://pharmaverse.github.io/teal/reference/module_session_info.md)
  [`srv_session_info()`](https://pharmaverse.github.io/teal/reference/module_session_info.md)
  :

  `teal` user session info module

- [`module()`](https://pharmaverse.github.io/teal/reference/teal_modules.md)
  [`modules()`](https://pharmaverse.github.io/teal/reference/teal_modules.md)
  [`format(`*`<teal_module>`*`)`](https://pharmaverse.github.io/teal/reference/teal_modules.md)
  [`format(`*`<teal_modules>`*`)`](https://pharmaverse.github.io/teal/reference/teal_modules.md)
  [`print(`*`<teal_module>`*`)`](https://pharmaverse.github.io/teal/reference/teal_modules.md)
  [`print(`*`<teal_modules>`*`)`](https://pharmaverse.github.io/teal/reference/teal_modules.md)
  :

  Create `teal_module` and `teal_modules` objects

- [`teal_slices()`](https://pharmaverse.github.io/teal/reference/teal_slices.md)
  [`as.teal_slices()`](https://pharmaverse.github.io/teal/reference/teal_slices.md)
  [`c(`*`<teal_slices>`*`)`](https://pharmaverse.github.io/teal/reference/teal_slices.md)
  :

  Filter settings for `teal` applications

## Application modifiers for `teal`

Functions to modify the `teal` app object

- [`modify_title()`](https://pharmaverse.github.io/teal/reference/teal_modifiers.md)
  [`modify_header()`](https://pharmaverse.github.io/teal/reference/teal_modifiers.md)
  [`modify_footer()`](https://pharmaverse.github.io/teal/reference/teal_modifiers.md)
  :

  Replace UI Elements in `teal` UI objects

- [`add_landing_modal()`](https://pharmaverse.github.io/teal/reference/add_landing_modal.md)
  :

  Add a Landing Popup to `teal` Application

## Helper Functions

Helper functions for `teal`

- [`check_decorators()`](https://pharmaverse.github.io/teal/reference/check_decorators.md)
  [`assert_decorators()`](https://pharmaverse.github.io/teal/reference/check_decorators.md)
  : Check decorators list
- [`build_app_title()`](https://pharmaverse.github.io/teal/reference/build_app_title.md)
  : Build app title with favicon
- [`select_decorators()`](https://pharmaverse.github.io/teal/reference/select_decorators.md)
  : Subset decorators based on the scope

## Example module

A simple `teal` module

- [`example_module()`](https://pharmaverse.github.io/teal/reference/example_module.md)
  :

  An example `teal` module

## Creating reports

- [`reporter_previewer_module()`](https://pharmaverse.github.io/teal/reference/reporter_previewer_module.md)
  **\[deprecated\]** :

  Create a `teal` module for previewing a report

- [`TealReportCard`](https://pharmaverse.github.io/teal/reference/TealReportCard.md)
  **\[experimental\]** :

  `TealReportCard`

- [`report_card_template()`](https://pharmaverse.github.io/teal/reference/report_card_template.md)
  :

  Template function for `TealReportCard` creation and customization

- [`disable_report()`](https://pharmaverse.github.io/teal/reference/disable_report.md)
  :

  Disable the report for a `teal_module`

## Modifying output of modules

- [`disable_src()`](https://pharmaverse.github.io/teal/reference/disable_src.md)
  : Disable the "Show R Code" global button in the UI

- [`disable_report()`](https://pharmaverse.github.io/teal/reference/disable_report.md)
  :

  Disable the report for a `teal_module`

## Functions for module developers

- [`teal_data_module()`](https://pharmaverse.github.io/teal/reference/teal_data_module.md)
  [`eval_code(`*`<teal_data_module>`*`)`](https://pharmaverse.github.io/teal/reference/teal_data_module.md)
  [`within(`*`<teal_data_module>`*`)`](https://pharmaverse.github.io/teal/reference/teal_data_module.md)
  **\[experimental\]** :

  Data module for `teal` applications

## Validation functions

- [`validate_has_data()`](https://pharmaverse.github.io/teal/reference/validate_has_data.md)
  : Validate that dataset has a minimum number of observations
- [`validate_has_elements()`](https://pharmaverse.github.io/teal/reference/validate_has_elements.md)
  : Validates that vector has length greater than 0
- [`validate_has_variable()`](https://pharmaverse.github.io/teal/reference/validate_has_variable.md)
  : Validates that dataset contains specific variable
- [`validate_in()`](https://pharmaverse.github.io/teal/reference/validate_in.md)
  : Validates that vector includes all expected values
- [`validate_input()`](https://pharmaverse.github.io/teal/reference/validate_input.md)
  [`need_input()`](https://pharmaverse.github.io/teal/reference/validate_input.md)
  [`use_validate_input_js()`](https://pharmaverse.github.io/teal/reference/validate_input.md)
  : Validate input
- [`validate_inputs()`](https://pharmaverse.github.io/teal/reference/validate_inputs.md)
  : Send input validation messages to output
- [`validate_n_levels()`](https://pharmaverse.github.io/teal/reference/validate_n_levels.md)
  : Validate that variables has expected number of levels
- [`validate_no_intersection()`](https://pharmaverse.github.io/teal/reference/validate_no_intersection.md)
  : Validates no intersection between two vectors
- [`validate_one_row_per_id()`](https://pharmaverse.github.io/teal/reference/validate_one_row_per_id.md)
  : Validate that dataset has unique rows for key variables
