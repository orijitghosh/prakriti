## Resubmission

This is a resubmission. In response to CRAN reviewer feedback, I have:

* Replaced `\dontrun{}` with `\donttest{}` in the examples for
  `display_prakriti()` and `scale_color_prakriti()` / `scale_fill_prakriti()`.
  The examples are executable (no missing software, no API keys); they were
  wrapped only because rendering 30 palette swatches or building a ggplot may
  exceed the 5-second example-runtime guideline on some systems.

## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new submission.

## Test environments

* local: Windows 11, R 4.4.x
* GitHub Actions: ubuntu-latest (R release, R devel, R oldrel),
  windows-latest (R release), macos-latest (R release)

## Downstream dependencies

There are currently no downstream dependencies for this package.
