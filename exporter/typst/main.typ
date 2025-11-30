#import "lib/section.typ": *
#import "lib/global.typ": *


#let CV = yaml("../../CV/PngWnA.yaml")

// Syntax for applying the configuration to the whole document
#show: it => conf(it)

#title(CV) 

#service(CV.services)

#education(CV.educations)

#publication(CV.publications, CV.name)

#research(CV.researches)

#lecture(CV.lectures)

#program(CV.programs)

#award(CV.awards)

#certification(CV.certifications)
