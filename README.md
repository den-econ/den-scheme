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

| Pos | Name        | Hex       | Tier     |
|-----|-------------|-----------|----------|
| 1   | Gold        | `#EEC051` | Core     |
| 2   | Dark Brown  | `#845B24` | Core     |
| 3   | Red         | `#C00000` | Core     |
| 4   | Bright Gold | `#FFC000` | Standard |
| 5   | Tan         | `#A19574` | Standard |
| 6   | Dark Grey   | `#3A3A3A` | Standard |
| 7   | Deep Amber  | `#935200` | Standard |
| 8   | Slate Blue  | `#4A6D7C` | Extended |
| 9   | Muted Teal  | `#5B8A72` | Extended |
| 10  | Dusty Rose  | `#A8687A` | Extended |
| 11  | Rust        | `#9F522C` | Extended |
| 12  | Light Gold  | `#F8E69B` | Extended |

**Suggested usage:**

| Chart type           | Colors                                    |
|----------------------|-------------------------------------------|
| 2-series             | Gold + Dark Brown (pos 1–2)               |
| 3-series             | Gold + Dark Brown + Red (pos 1–3)         |
| Bar + line combo     | Bars: Gold + Bright Gold, Line: Dark Brown|
| Stacked bar (4–6)    | Pos 1, 4, 2, 7 (light-dark alternation)  |
| Many categories (8+) | Full 12-color palette                     |

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
