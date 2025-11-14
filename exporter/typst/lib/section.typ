#import "@preview/scienceicons:0.1.0": email-icon
#import "size.typ": *

#let period(contents) = [
  #show: set text(
    size: 10.5pt,
    weight: "bold"
  )
  #if ("end" in contents) [
    #if (contents.start == contents.end) [
      #contents.start
    ] else [
      #contents.start - #contents.end
    ]
  ] else [
    #contents.start - #"현재"
  ]
]

#let email(email) = [
  #v(-0.5em)
  #show link: underline
  #link("mailto:" + email)[
    #box(baseline: 3pt)[#email-icon()]#email
  ]
]

#let title(CV) = [
  #align(right, [
    #huge(CV.name.kr)

    #CV.position @ #CV.affiliation

    #email(CV.email)
  ])
]

#let GPA(GPA) = [
  #small("GPA: " + GPA)
]

#let lab(lab) = [
  #v(-0.3em)
  #link(lab.url)[
    @
    #show: underline
    #small(lab.name)
  ]
]

#let service(contents) = [
  #large("Services")
  #line(length: 100%)
  #for service in contents [
    #grid(
      columns: (1fr, 1fr),
      rows: (auto, auto),
      gutter: 1em,

      entry(service.affiliation),
      align(right, [
        #strong(period(service))
      ]),

      service.team,
      align(right, [#service.position]),

      for detail in service.details [
        - #detail
      ]
    )
    #v(1em)
  ]
]

#let education(contents) = [
  #large("Education")
  #line(length: 100%)
  #for education in contents [
    #grid(
      columns: (2fr, 1fr),
      rows: (auto, auto),
      
      gutter: 1em,

      entry(education.institution),
      align(right, [
        #strong(period(education))
      ]),

      education.major.join(", "),
      align(right, [
        #if ("degree" in education) [
          #education.degree.join(", ")
        ]
      ]),

      if ("lab" in education) [
        #lab(education.lab)
      ],
      align(right, [
        #if ("GPA" in education) [
          #GPA(education.GPA)
        ]
      ]),

      if ("details" in education) [
        #for detail in education.details [
          - #detail
        ]
      ],
    )
    #v(1em)
  ]
]

#let publication(contents, name) = [
  #show name.kr : word => strong(underline(word))
  #show name.en : word => strong(underline(word))

  #large("Publications")
  #line(length: 100%)
  #for publication in contents [
    + #medium(publication.title) #linebreak()
      #tiny(publication.authors.join(", "))
      - #tiny(publication.venue)
      #v(1em)
  ]
]

#let research(contents) = [
  #large("Researches")
  #line(length: 100%)
  #for research in contents [
    #grid(
      columns: (2fr, 1fr),
      rows: (auto, auto),
      gutter: 1em,

      entry(research.title, weaken: true),
      align(right, [
        #strong(period(research))
      ]),

      if ("details" in research) [
        #for detail in research.details [
          - #detail
        ]
      ],
      align(right, [#research.organization]),
    )
    #v(1em)
  ]
]

#let lecture(contents) = [
  #large("Lectures")
  #line(length: 100%)
  #for lecture in contents [
    #grid(
      columns: (2fr, 1fr),
      rows: (auto, auto),
      gutter: 1em,

      entry(lecture.title, weaken: true),
      align(right, [
        #strong(lecture.date)
      ]),

      if ("details" in lecture) [
        #for detail in lecture.details [
          - #detail
        ]
      ],
      align(right, [#lecture.organization]),
      
      v(1em)
    )
  ]
]

#let program(contents) = [
  #large("Programs")
  #line(length: 100%)
  #for program in contents [
    #grid(
      columns: (3fr, 1fr),
      rows: (auto, auto),
      gutter: 1em,

      entry(program.program, weaken: true),
      align(right, [
        #strong(period(program))
      ]),

      program.position,
      align(right, [#program.organization]),

      if ("details" in program) [
        #for detail in program.details [
          - #detail
        ]
      ],
      
    )
    #v(1em)
  ]
]

#let award(contents) = [
  #large("Awards")
  #line(length: 100%)
  #for award in contents [
    #grid(
      columns: (2fr, 1fr),
      rows: (auto, auto),
      gutter: 1em,

      entry(award.competition, weaken: true),
      align(right, [
        #strong(period(award))
      ]),

      award.award,
      align(right, [#award.team]),

      if ("field" in award) [
        #for field in award.field [
          - #field
        ]
      ],
    )
    #v(1em)
  ]
]

#let certification(contents) = [
  #large("Certifications")
  #line(length: 100%)
  #for certification in contents [
    #grid(
      columns: (2fr, 1fr),
      rows: (auto, auto),
      gutter: 1em,

      entry(certification.name, weaken: true),
      align(right, [
        #strong(certification.date)
      ]),

      if ("details" in certification) [
        #for detail in certification.details [
          - #detail
        ]
      ],
      align(right, [#certification.organization]),
    )
  ]
]