#let style(
  header: "Header",
  title: "Title",
  doc
) = [
  #set text(lang: "ru", font: "PT Sans", hyphenate: true)

  #set math.equation(numbering: "(1)")
  #show math.equation: set text(font: "STIX Two Math")

  #set heading(numbering: "1.1.")

  #show heading.where(level: 1): it => {
    set align(center)
    pagebreak()
    it
    v(1em, weak: true)
  }

  #show heading.where(level: 2): it => {
    set align(center)
    pagebreak()
    it
    v(1em, weak: true)
  }

  #show heading.where(level: 3): it => {
    pagebreak()
    it
    v(1em, weak: true)
  }

  #show link: underline

  #set page(
    paper: "a5",
    margin: (x: 0.5cm, y: 1.2cm),
    fill: rgb("444352"),
    numbering: "1 / 1",
    header: [#align(center)[#header]]
  )

  #set text(
    fill: rgb("fdfdfd"),
    size: 2em
  )

  #set align(horizon)

  #set par(
    justify: true,
    linebreaks: "optimized",
  )

  #align(center)[
    #text(
      size: 2em,
    )[#title]
  ]

  #outline()

  #doc
]
