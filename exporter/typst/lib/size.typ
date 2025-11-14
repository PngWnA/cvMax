#let huge(content) = [
  #show content: set text(
    size: 25pt,
    weight: "semibold"
  )
  #content
  #v(-15pt)
]

#let large(content) = [
  #show content: set text(
    size: 15pt,
    weight: "medium"
  )
  #content
  #v(-5pt)
]

#let medium(content) = [
  #show content: set text(
    size: 12pt,
    weight: "medium"
  )
  #content
]

#let small(content) = [
  #show content: set text(
    size: 9.5pt,
    weight: "medium"
  )
  #content
  #v(-2pt)
]

#let tiny(content) = [
  #show content: set text(
    size: 9pt,
    weight: "medium"
  )
  #content
  #v(-1pt)
]

#let entry(content, weaken: false) = [
  #show content: set text(
    size: 12pt,
    weight: "bold"
  )
  #if (weaken) [
    #content
  ] else [
    #underline(content, stroke: 0.1em)
  ]
]