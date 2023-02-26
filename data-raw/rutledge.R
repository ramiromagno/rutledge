library(tidyverse)
library(here)

raw_data_sheet01 <- readxl::read_excel(here::here("data-raw/rutledge.xls"), sheet = "K1_K2")
raw_data_sheet02 <- readxl::read_excel(here::here("data-raw/rutledge.xls"), sheet = "K3_K2")

raw_data_tbl01 <-
raw_data_sheet01 %>%
  tidyr::pivot_longer(
    cols = !1,
    names_to = c("conc", "run", "rep"),
    names_sep = "-",
    values_to = "fluor"
  ) %>%
  dplyr::arrange(conc, run, rep, cycle) %>%
  tibble::add_column(target = "K1/K2")

raw_data_tbl02 <-
  raw_data_sheet02 %>%
  tidyr::pivot_longer(
    cols = !1,
    names_to = c("conc", "run", "rep"),
    names_sep = "-",
    values_to = "fluor"
  ) %>%
  dplyr::arrange(conc, run, rep, cycle) %>%
  tibble::add_column(target = "K3/K2")

rutledge <- dplyr::bind_rows(raw_data_tbl01, raw_data_tbl02) %>%
  dplyr::transmute(
    plate = factor(dplyr::recode(
      run,
      run01 = "1",
      run02 = "2",
      run03 = "3",
      run04 = "4",
      run05 = "5"
    )),
    well = factor(NA_character_),
    dye = "SYBR",
    target = as.factor(target),
    sample_type = factor("std"),
    replicate = dplyr::recode(
      rep,
      rep01 = 1L,
      rep02 = 2L,
      rep03 = 3L,
      rep04 = 4L
    ),
    copies = dplyr::recode(
      conc,
      c01 = 41700000L,
      c02 = 4170000L,
      c03 = 417000L,
      c04 = 41700L,
      c05 = 4170L,
      c06 = 417L,
    ),
    dilution = dplyr::recode(
      conc,
      c01 = 1L,
      c02 = 10L,
      c03 = 100L,
      c04 = 1000L,
      c05 = 10000L,
      c06 = 100000L
    ),
    cycle,
    fluor
  )

usethis::use_data(rutledge, overwrite = TRUE)
