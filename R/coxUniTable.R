#' Univariable Cox regression table
#'
#' Perform univariable Cox regressions for numerous variables and create a table
#' @param data A data for analysis
#' @param y Name of a dependent variable or an outcome variable. Should be comprised of 0 and 1.
#' @param time A time variable, that is observation duration for the outcome in a survival model.
#' @param Xs Names of independent variables or response variables.
#' @return A table of univariable Cox regression about independent variables included in this analysis.
#' @importFrom stats as.formula confint.default
#' @importFrom survival coxph Surv
#' @importFrom gt gt tab_style cell_fill cells_body cols_label md
#' @export
coxUniTable = function(data, y, time,  Xs) {
  result = lapply(Xs,
                  \(x){
                    form = paste0("Surv(",time, y,'==1)~' ,x) |> as.formula()
                    fit = coxph(form, data = data)
                    coef = exp(coef(fit))[-1]
                    confint = exp(confint.default(fit)[2,])
                    p = coef(summary(fit))[-1,4]
                    data.frame(
                      variable = x,
                      HR_ci = paste0(format(round(coef,2),nsmall=2), ' (',
                                     format(round(confint[1],2),nsmall=2),'-',
                                     format(round(confint[2],2),nsmall=2),")"),
                      p = format(round(p,4),nsmall=4)
                    )
                  }
  )
  result = result |> do.call(what="rbind")
  table = result |>
    gt() |>
    tab_style(
      style = list(
        cell_fill(color="lightyellow")
      ),
      locations = cells_body(
        rows = result$p < 0.2
      )
    ) |> cols_label(
      variable = md("**Variable**"),
      HR_ci = md("**HR (95% CI)**"),
      p = md("**P value**")
    )
  return(table)
}