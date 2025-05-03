#let style(doc) = [
  #set text(lang: "ru", font: "PT Serif", hyphenate: true)

  #set math.equation(numbering: "(1)")
  #show math.equation: set text(font: "STIX Two Math")

  #set heading(numbering: "1.1.")

  #show heading.where(level: 1): it => {
    pagebreak(weak: true)
    it
    v(1em, weak: true)
  }
  #show heading.where(level: 2): it => {
    it
    v(1em, weak: true)
  }
  #show heading.where(level: 3): it => {
    it
    v(1em, weak: true)
  }

  #show link: underline

  #set page(paper: "a6", numbering: "1 / 1", fill: rgb("444352"))

  #set text(fill: rgb("fdfdfd"))


  #set par(
    justify: true,
    linebreaks: "optimized",
    // first-line-indent: 2em,
    // spacing: 0.65em,
  )

  // #set bibliography(style: "gost-r-705-2008-numeric")
  #set bibliography(title: "Список использованных источников")

  #doc
]
