# den-scheme

Stata graph scheme implementing the DEN (Dewan Ekonomi Nasional) house style.
Matches the visual identity of [ggden](https://github.com/den-econ/ggden) (R) and [fig-den](https://github.com/den-econ/fig-den) (Python).

## Installation

```stata
net install den-scheme, from("https://raw.githubusercontent.com/den-econ/den-scheme/main/") replace
```

## Usage

```stata
set scheme den

* Or apply to a single graph
twoway scatter y x, scheme(den)
```

To make it your default scheme across sessions:

```stata
set scheme den, permanently
```

## Color Palette (v1.0)

12-color categorical palette in three tiers:

| Pos | Code   | Name        | Hex       | Tier     |
|-----|--------|-------------|-----------|----------|
| 1   | `den1`  | Gold        | `#EEC051` | Core     |
| 2   | `den2`  | Dark Brown  | `#845B24` | Core     |
| 3   | `den3`  | Red         | `#C00000` | Core     |
| 4   | `den4`  | Bright Gold | `#FFC000` | Standard |
| 5   | `den5`  | Tan         | `#A19574` | Standard |
| 6   | `den6`  | Dark Grey   | `#3A3A3A` | Standard |
| 7   | `den7`  | Deep Amber  | `#935200` | Standard |
| 8   | `den8`  | Slate Blue  | `#4A6D7C` | Extended |
| 9   | `den9`  | Muted Teal  | `#5B8A72` | Extended |
| 10  | `den10` | Dusty Rose  | `#A8687A` | Extended |
| 11  | `den11` | Rust        | `#9F522C` | Extended |
| 12  | `den12` | Light Gold  | `#F8E69B` | Extended |

Use the codes above (e.g. `den1`, `den3`) anywhere Stata accepts a color name — `mcolor()`, `lcolor()`, `fcolor()`, `color()`, etc. Colors are assigned automatically by position when using the scheme, but the codes let you override or pick specific colors.

### Examples

**Override marker color in a scatter plot:**

```stata
sysuse auto, clear
twoway scatter mpg weight, mcolor(den3)
```

**Two groups with specific palette colors:**

```stata
twoway (scatter mpg weight if foreign==0, mcolor(den1)) ///
       (scatter mpg weight if foreign==1, mcolor(den3)), ///
    legend(label(1 "Domestic") label(2 "Foreign"))
```

**Line chart with custom colors:**

```stata
sysuse uslifeexp, clear
twoway (line le_male year, lcolor(den2)) ///
       (line le_female year, lcolor(den3)) ///
       (line le year, lcolor(den1) lwidth(thick)), ///
    legend(label(1 "Male") label(2 "Female") label(3 "Total"))
```

**Bar chart with a specific fill:**

```stata
sysuse nlsw88, clear
graph bar (mean) wage, over(race) asyvars ///
    bar(1, fcolor(den1)) bar(2, fcolor(den2)) bar(3, fcolor(den3))
```

### Suggested palettes by chart type

| Chart type           | Colors                                    |
|----------------------|-------------------------------------------|
| 2-series             | `den1` + `den2`                           |
| 3-series             | `den1` + `den2` + `den3`                  |
| Bar + line combo     | Bars: `den1` + `den4`, Line: `den2`       |
| Stacked bar (4–6)    | `den1`, `den4`, `den2`, `den7` (light-dark alternation) |
| Many categories (8+) | Full palette `den1`–`den12`               |

### Supplementary colours (manual use)

16 additional colours from the DEN PPT template and team preferences. These are **not** part of the auto-cycled scheme — use the codes (`den13`–`den28`) anywhere Stata accepts a colour name.

| Pos | Code    | Name         | Hex       |
|-----|---------|--------------|-----------|
| 13  | `den13` | Cream        | `#FBEEC9` |
| 14  | `den14` | Amber Gold   | `#F0A22E` |
| 15  | `den15` | Ochre        | `#C87D0E` |
| 16  | `den16` | Burnt Orange | `#C17529` |
| 17  | `den17` | Raw Amber    | `#91581F` |
| 18  | `den18` | Sand         | `#C3986D` |
| 19  | `den19` | Caramel      | `#A27242` |
| 20  | `den20` | Clay         | `#A5644E` |
| 21  | `den21` | Chocolate    | `#7C4B3B` |
| 22  | `den22` | Espresso     | `#4E3B30` |
| 23  | `den23` | Dark Red     | `#820000` |
| 24  | `den24` | Rose Brown   | `#B58B80` |
| 25  | `den25` | Olive        | `#7C7154` |
| 26  | `den26` | Medium Grey  | `#7F7F7F` |
| 27  | `den27` | Steel        | `#70848F` |
| 28  | `den28` | Navy Slate   | `#3E5064` |

**Usage:**

```stata
* Use supplementary colour codes in scatter plots
twoway scatter mpg weight, mcolor(den15)     // Ochre

* Mix core and supplementary in bar charts
graph bar (mean) wage, over(race) asyvars ///
    bar(1, fcolor(den1))    ///   Gold (core)
    bar(2, fcolor(den23))   ///   Dark Red (supplementary)
    bar(3, fcolor(den28))       // Navy Slate (supplementary)

* Mix core and supplementary in line charts
twoway (line exports year, lcolor(den1))   ///
       (line imports year, lcolor(den27)), ///   Steel
    legend(label(1 "Exports") label(2 "Imports"))
```

## Theme Details

- **Background**: white (plot, legend, textbox)
- **Gridlines**: major gridlines on both axes, light grey (`#E6E6E6`), thin
- **Axes**: left and bottom only, grey (`#4D4D4D`)
- **Legend**: top center, horizontal, no frame
- **Title**: bold, dark grey (`#1A1A1A`)
- **Subtitle/labels**: medium grey (`#4D4D4D`)
- **Caption**: light grey (`#808080`)
- **Aspect ratio**: ~10:6 (7.5 × 4.5 inches)

## Limitations

- Stata schemes cannot set font family. To use a specific font:
  ```stata
  graph set window fontface "Arial"
  ```

## Related Packages

- [ggden](https://github.com/den-econ/ggden) — R/ggplot2
- [fig-den](https://github.com/den-econ/fig-den) — Python/matplotlib

## Lisensi

Seluruh aset dan kode dalam repositori ini dilindungi di bawah **Lisensi DEN**.
Lihat file [LICENSE](LICENSE) untuk detail.

*Hak Cipta (c) 2026 Dewan Ekonomi Nasional Republik Indonesia (DEN)*
