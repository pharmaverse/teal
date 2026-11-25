# Template function for `TealReportCard` creation and customization

**\[deprecated\]**

This function generates a report card with a title, an optional
description, and the option to append the filter state list.

## Usage

``` r
report_card_template(
  title,
  label,
  description = NULL,
  with_filter,
  filter_panel_api
)
```

## Arguments

- title:

  (`character(1)`) title of the card (unless overwritten by label)

- label:

  (`character(1)`) label provided by the user when adding the card

- description:

  (`character(1)`) optional, additional description

- with_filter:

  (`logical(1)`) flag indicating to add filter state

- filter_panel_api:

  (`FilterPanelAPI`) object with API that allows the generation of the
  filter state in the report

## Value

(`TealReportCard`) populated with a title, description and filter state.

## See also

See
[`teal_card()`](https://rdrr.io/pkg/teal.reporter/man/teal_card.html)
and the vignette about the teal report
[`vignette('teal-report-class', 'teal.reporter')`](https://cran.rstudio.com/web/packages/teal.reporter/vignettes/teal-report-class.html)

## Examples

``` r
filtered_data <- teal.slice::init_filtered_data(list(iris = list(dataset = iris)))
if (FALSE) { # \dontrun{
card <- report_card_template(
  title = "Iris",
  label = "",
  description = "Summary of the iris dataset.",
  with_filter = TRUE,
  filter_panel_api = teal.slice::FilterPanelAPI$new(filtered_data)
)
} # }
```
