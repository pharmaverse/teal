testthat::skip_if_not_installed("shinytest2")
testthat::skip_if_not_installed("rvest")

testthat::test_that("e2e: teal app initializes with no errors", {
  skip_if_too_deep(5)
  snaps <- list.dirs(testthat::test_path("_snaps"), recursive = FALSE, full.names = FALSE)
  platform <- shinytest2::platform_variant()
  if (!platform %in% snaps) {
    testthat::skip(paste0("Skipping missing snapshot on ", platform))
  }
  app <- TealAppDriver$new(
    init(
      data = simple_teal_data(),
      modules = example_module(label = "Example Module")
    )
  )
  app$expect_no_shiny_error()
  app$expect_screenshot(selector = "#teal-tabpanel_wrapper")
  app$stop()
})

testthat::test_that("e2e: teal app initializes with sessionInfo modal", {
  skip_if_too_deep(5)
  app <- TealAppDriver$new(
    init(
      data = simple_teal_data(),
      modules = example_module(label = "Example Module")
    )
  )

  # Check if button exists.
  button_selector <- "#teal-footer-session_info-sessionInfo-button"
  testthat::expect_equal(
    trimws(app$get_text(button_selector)),
    "Session Info"
  )

  app$click(selector = button_selector)

  # Check header and title content.
  testthat::expect_equal(
    app$get_text("#shiny-modal > div > div > div.modal-header > h4"),
    "SessionInfo"
  )

  # There are two Copy buttons with similar id and the same label.
  testthat::expect_setequal(
    testthat::expect_length(
      trimws(app$get_text(
        "#shiny-modal [id^='teal-footer-session_info-sessionInfo-copy_button']"
      )),
      2
    ),
    "Copy to Clipboard"
  )
  # There are two Dismiss buttons with similar id and the same label.
  testthat::expect_setequal(
    testthat::expect_length(
      trimws(app$get_text("#shiny-modal button[data-dismiss]")),
      2
    ),
    "Dismiss"
  )

  # Check session info output.
  session_info <- app$get_text("#teal-footer-session_info-sessionInfo-verbatim_content")

  testthat::expect_match(session_info, "R version", fixed = TRUE)
  testthat::expect_match(session_info, "attached base packages:", fixed = TRUE)
  testthat::expect_match(session_info, "loaded via a namespace (and not attached):", fixed = TRUE)

  testthat::expect_match(session_info, "shiny", fixed = TRUE)
  testthat::expect_match(session_info, "teal.slice", fixed = TRUE)
  testthat::expect_match(session_info, "teal.reporter", fixed = TRUE)

  app$stop()
})

testthat::test_that("e2e: init creates UI containing specified title, favicon, header and footer", {
  skip_if_too_deep(5)
  app <- TealAppDriver$new(
    init(
      data = simple_teal_data(),
      modules = example_module(label = "Example Module")
    ) |>
      modify_title(
        title = "Custom Teal App Title",
        favicon = "https://raw.githubusercontent.com/insightsengineering/hex-stickers/main/PNG/teal.png"
      ) |>
      modify_header(element = "Custom Teal App Header") |>
      modify_footer(element = "Custom Teal App Footer")
  )

  testthat::expect_equal(
    app$get_text("head > title")[1],
    "Custom Teal App Title"
  )
  testthat::expect_equal(
    rvest::html_attr(
      rvest::html_elements(app$get_html_rvest("head > link[rel='icon']"), "link"),
      "href"
    ),
    "https://raw.githubusercontent.com/insightsengineering/hex-stickers/main/PNG/teal.png"
  )
  testthat::expect_match(
    app$get_text("header"),
    "Custom Teal App Header"
  )
  testthat::expect_match(
    app$get_text("footer"),
    "Custom Teal App Footer"
  )
  app$stop()
})


testthat::describe("e2e: init reporter buttons", {
  it("is displayed when report is non null", {
    skip_if_too_deep(5)
    app_driver <- TealAppDriver$new(
      init(
        data = simple_teal_data(),
        modules = modules(example_module(label = "Example Module"), example_module(label = "Example Module 2")),
        reporter = teal.reporter::Reporter$new()
      )
    )
    withr::defer(app_driver$stop())

    testthat::expect_match(
      trimws(app_driver$get_text("#teal-reporter_menu_container .teal.dropdown-button")), "^Report$"
    )
    testthat::expect_match(app_driver$get_text(".report_add_wrapper .teal-reporter.action-button"), "Add to Report")
  })

  it("is not displayed when report is null", {
    skip_if_too_deep(5)
    app_driver <- TealAppDriver$new(
      init(
        data = simple_teal_data(),
        modules = modules(example_module(label = "Example Module"), example_module(label = "Example Module 2")),
        reporter = NULL
      )
    )
    withr::defer(app_driver$stop())

    testthat::expect_length(app_driver$get_text("#teal-reporter_menu_container .teal.dropdown-button"), 0)
    testthat::expect_length(app_driver$get_text(".report_add_wrapper .teal-reporter.action-button"), 0)
  })
})

testthat::describe("e2e: TealAppDriver with a function as `app`", {
  it("starts the app when the function returns a teal_app", {
    skip_if_too_deep(5)
    app_driver <- TealAppDriver$new(
      function() {
        library(teal)
        init(data = teal_data(iris = iris), modules = example_module(label = "mod1"))
      }
    )
    withr::defer(app_driver$stop())

    app_driver$expect_no_shiny_error()
    testthat::expect_equal(app_driver$get_value(input = "teal-teal_modules-active_module_id"), "mod1")
    testthat::expect_identical(app_driver$get_active_filter_vars(), "iris")
  })

  it("starts the app when the function returns a shiny.appobj", {
    skip_if_too_deep(5)
    app_driver <- TealAppDriver$new(
      function() {
        library(teal)
        app <- init(data = teal_data(iris = iris), modules = example_module(label = "mod1"))
        shiny::shinyApp(ui = app$ui, server = app$server)
      }
    )
    withr::defer(app_driver$stop())

    app_driver$expect_no_shiny_error()
    testthat::expect_equal(app_driver$get_value(input = "teal-teal_modules-active_module_id"), "mod1")
  })

  it("sets teal_options in the app process", {
    skip_if_too_deep(5)
    app_driver <- TealAppDriver$new(
      function() {
        library(teal)
        init(data = teal_data(iris = iris), modules = example_module(label = "mod1"))
      },
      teal_options = list(teal.enable_deep_linking = TRUE)
    )
    withr::defer(app_driver$stop())

    testthat::expect_match(app_driver$get_js("window.location.href"), "active_module=mod1")
  })
})

testthat::test_that("TealAppDriver throws an error when app is neither a teal_app nor a function", {
  testthat::expect_error(
    TealAppDriver$new("path/to/app"),
    "Must be a function.*Must inherit from class 'teal_app'"
  )
})
