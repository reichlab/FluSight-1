## test stacking
stacking_weights <- expand.grid(
    component_model_id = c("Delphi_Uniform", "ReichLab_kcde"),
    target = c(
        "Season onset", 
        "Season peak week", 
        "Season peak percentage",
        "1 wk ahead",
        "2 wk ahead",
        "3 wk ahead",
        "4 wk ahead")
)

stacking_weights$weight <- c(
    .3, .7,
    .1, .9, 
    .5, .5,
    .3, .7,
    .1, .9, 
    .5, .5,
    .5, .5
)

files <- data.frame(
    file = c(
        "~/Documents/research-versioned/cdc-flusight-ensemble/ReichLab_kcde/EW01-2011-ReichLab_kcde.csv",
        "~/Documents/research-versioned/cdc-flusight-ensemble/Delphi_Uniform/EW01-2011-Delphi_Uniform.csv"
    ),
    model_id = c("ReichLab_kcde", "Delphi_Uniform")
)

ensemble <- stack_forecasts(files, stacking_weights)
