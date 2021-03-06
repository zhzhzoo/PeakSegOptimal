library(testthat)
context("cosegData")
library(PeakSegOptimal)

data(mass.spec, package="cosegData")
test_that("mass spec data and penalty=0 do not crash", {
  df <- mass.spec[[1]]
  fit <- PeakSegFPOPchrom(df, 0)
})

obj.name <- data(
  H3K4me3_XJ_immune_samples_tcell_McGill0027_chr17_396626_21566608,
  package="cosegData")
test_that("small data and penalty do not crash", {
  data.list <- get(obj.name)
  fit <- with(data.list, PeakSegFPOPchrom(coverage[1:20000,], as.numeric(penalty)))
})

obj.name <- data(H3K36me3_AM_immune_McGill0079_chr3_60000_66170270, package="cosegData")
test_that("big data and penalty do not crash", {
  data.list <- get(obj.name)
  fit <- with(data.list, PeakSegFPOPchrom(coverage[1:100,], as.numeric(penalty)))
})

obj.name <- data(H3K4me3_TDH_other_McGill0014_chr5_10000_17530657, package="cosegData")
test_that("bigger data and penalty do not crash", {
  data.list <- get(obj.name)
  fit <- with(data.list, PeakSegFPOPchrom(coverage[1:10000,], as.numeric(penalty)))
})

obj.name <- data(H3K36me3_AM_immune_McGill0102_chr11_96437584_134946516, package="cosegData")
test_that("data set and penalty 3 do not crash", {
  data.list <- get(obj.name)
  fit <- with(data.list, PeakSegFPOPchrom(coverage[1:200000,], as.numeric(penalty)))
})

obj.name <- data(H3K36me3_AM_immune_McGill0001_chr16_46385801_88389383, package="cosegData")
test_that("data set and penalty 4 do not crash", {
  data.list <- get(obj.name)
  fit <- with(data.list, PeakSegFPOPchrom(coverage[1:30000,], as.numeric(penalty)))
})

