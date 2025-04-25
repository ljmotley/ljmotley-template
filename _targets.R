library(targets)
tar_option_set(packages = c("tidyverse", "motleytools"))

list(
  tar_target(raw_demo,
             read_csv(file.path(Sys.getenv("DATADIR"), "raw/demo.csv"))),
  tar_target(clean_demo,
             raw_demo %>% filter(!is.na(value))),
  tar_target(fig_demo, {
    ggplot(clean_demo, aes(x, y, colour = group)) +
      geom_point()
  }, format = "file")
)
