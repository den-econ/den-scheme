* =============================================================
* test_scheme.do — Visual test of the DEN Stata scheme
* Run: "C:\Program Files\Stata19\StataMP-64.exe" /e do test\test_scheme.do
* =============================================================

clear all
set more off

* Set scheme (scheme file must be in Stata's ado path)
set scheme den

* Output directory
cap mkdir "test"
cap mkdir "test/fig"


* ---- Test 1: Line chart (3 series) --------------------------
sysuse uslifeexp, clear
twoway (line le_male year) (line le_female year) (line le year), ///
    title("US Life Expectancy") ///
    subtitle("By gender, 1900-1999") ///
    note("Source: Stata example data") ///
    legend(label(1 "Male") label(2 "Female") label(3 "Total")) ///
    name(test_line, replace)
graph export "test/fig/test_line.png", replace width(3000) height(1800)


* ---- Test 2: Bar chart (grouped) ----------------------------
sysuse nlsw88, clear
graph bar (mean) wage, over(race) over(collgrad) ///
    title("Average Wage") ///
    subtitle("By race and college graduation") ///
    note("Source: NLS Women 1988") ///
    asyvars ///
    name(test_bar, replace)
graph export "test/fig/test_bar.png", replace width(3000) height(1800)


* ---- Test 3: Scatter plot (2 groups) ------------------------
sysuse auto, clear
twoway (scatter mpg weight if foreign==0) ///
       (scatter mpg weight if foreign==1), ///
    title("Fuel Efficiency vs Weight") ///
    subtitle("1978 Automobile Data") ///
    note("Source: Stata example data") ///
    legend(label(1 "Domestic") label(2 "Foreign")) ///
    name(test_scatter, replace)
graph export "test/fig/test_scatter.png", replace width(3000) height(1800)


* ---- Test 4: Regional bar chart (4 categories) --------------
sysuse census, clear
collapse (sum) pop, by(region)
graph bar (asis) pop, over(region) ///
    title("US Population by Region") ///
    subtitle("1980 Census") ///
    note("Source: Stata census data") ///
    asyvars ///
    name(test_bar_multi, replace)
graph export "test/fig/test_bar_multi.png", replace width(3000) height(1800)


* ---- Test 5: Box plot ---------------------------------------
sysuse nlsw88, clear
graph box wage, over(race) ///
    title("Wage Distribution by Race") ///
    subtitle("NLS Women 1988") ///
    name(test_box, replace)
graph export "test/fig/test_box.png", replace width(3000) height(1800)


* ---- Test 6: Pie chart --------------------------------------
sysuse census, clear
collapse (sum) pop, by(region)
graph pie pop, over(region) ///
    title("Population Share by Region") ///
    plabel(_all percent, format(%4.1f)) ///
    name(test_pie, replace)
graph export "test/fig/test_pie.png", replace width(3000) height(1800)


* ---- Test 7: 12-line palette test ----------------------------
clear
set obs 100
gen x = _n
forvalues i = 1/12 {
    gen y`i' = sin(x/10 + `i') * `i' + `i'*2
}
twoway (line y1 x) (line y2 x) (line y3 x) (line y4 x) ///
       (line y5 x) (line y6 x) (line y7 x) (line y8 x) ///
       (line y9 x) (line y10 x) (line y11 x) (line y12 x), ///
    title("12-Color Palette Test") ///
    subtitle("All DEN palette colors displayed") ///
    legend(rows(2)) ///
    name(test_12colors, replace)
graph export "test/fig/test_12colors.png", replace width(3000) height(1800)


* ---- Test 8: Histogram --------------------------------------
sysuse auto, clear
histogram mpg, ///
    title("Distribution of Fuel Efficiency") ///
    subtitle("1978 Automobile Data") ///
    note("Source: Stata example data") ///
    name(test_hist, replace)
graph export "test/fig/test_hist.png", replace width(3000) height(1800)


* Done
di as txt "All test charts exported to test/fig/"
