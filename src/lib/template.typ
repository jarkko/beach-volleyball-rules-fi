#import "utils.typ": *

#let fivb-blue = rgb("#003399")

#let project(title: "", authors: (), date: none, body) = {
  set document(author: authors, title: title, date: date)
  set text(font: "Arial", lang: "fi", size: 10pt)
  set page(
    numbering: "1",
    number-align: center,
    margin: (left: 2.5cm, right: 5cm, top: 2.5cm, bottom: 2.5cm), // Increased right margin for refs
  )

  // Heading Styling (Level 1 - Chapters/Parts)
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    block(
      fill: fivb-blue,
      width: 100%,
      inset: 1em,
      radius: 2pt,
      below: 1.5em,
      text(fill: white, weight: "bold", size: 1.2em, it.body),
    )
  }

  // Heading Styling (Level 2 - Titles)
  show heading.where(level: 2): it => {
    block(
      below: 1em,
      text(fill: fivb-blue, weight: "bold", size: 1.1em, it.body),
    )
  }

  // Title page
  align(center)[
    #block(text(weight: "bold", 2em, fill: fivb-blue, title))
    #v(1em, weak: true)
    #if date != none [
      #if type(date) == datetime {
        date.display("[day].[month].[year]")
      } else {
        date
      }
    ]
  ]

  set par(justify: true, leading: 0.65em)

  body
}
