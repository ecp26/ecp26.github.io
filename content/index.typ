// European Coaching Program website content.
//
// Tola routes this file to `/`. Edit prose and structured entries here;
// the shared page shell lives in templates/layout.typ and the structured
// content helpers live in components/site.typ.

#import "@tola/site:0.0.0": info
#import "/templates/layout.typ": layout
#import "/components/site.typ": endorsed-by, hero-photo, introduction, people
#import "/components/site.typ": program-component, program-components
#import "/components/site.typ": timeline, upcoming-dates

#show: layout.with(
  title: info.title,
  description: info.description,
)

#hero-photo(
  desktop-src: "/assets/images/coaching-banner.webp",
  mobile-src: "/assets/images/coaching-banner-mobile.webp",
  alt: "A coach leads singers through an exercise during a workshop.",
  caption: [Coaching at European Quartet School 2025 · Photo: Eric Ideler],
)

#introduction(
  title: [European Coaching Program],
  strapline: [Developing barbershop coaches across Europe],
  summary: [
    The European Coaching Program (ECP) will train and certify barbershop
    coaches from all over Europe. Our aim is to develop experienced coaches into
    world-class coaches. This will further strengthen barbershop expertise in
    Europe and make it easier for quartets and choruses to access high-level
    coaching.
  ],
)

#upcoming-dates(
  (date: [End of September 2026], event: [Selection team announced]),
  (date: [1–15 November 2026], event: [Applications open]),
  (date: [15 December 2026], event: [Candidates selected]),
)




= Program <program>

In the ECP, experienced barbershop coaches will deepen their mastery of
coaching techniques. The Coaching Candidates will learn to assess the strengths and growth
opportunities of an ensemble, give positive feedback, set priorities, choose
impactful interventions, communicate clearly, run an effective coaching
session, and conduct themselves as coaches.

The ECP is a two-year training program that consists of the following elements:

#program-components[
  #program-component(title: [European Harmony Academy])[
    Candidates will attend the new Advanced Coaching Stream at the
    #link("https://www.barbershop.de/en/veranstaltungen/eha")[European Harmony Academy]
    in August 2027 and August 2028. They will learn coaching techniques
    from world-class faculty, practice with quartets attending EHA,
    and reflect together on their experiences.
  ]

  #program-component(title: [Coaching practice])[
    Candidates will actively coach quartets and choruses on their own time.
    Each candidate will coach at least five groups per year and receive feedback
    through an online form.
  ]

  #program-component(title: [Apprenticeship])[
    Candidates will serve as a coaching apprentice at one or more Harmony College
    or comparable events. Coaching apprentices observe an experienced coach, discuss
    the mentor's coaching style, and get opportunities to coach groups themselves
    and receive feedback from the mentor.
  ]

  #program-component(title: [Mentoring])[
    Each candidate will be assigned an international world-class coach as a personal mentor.
    Candidates will meet their mentors several times a year through video calls.
    They are encouraged to share coaching videos and discuss them with the mentor.
  ]


  #program-component(title: [Online classes])[
    Every few months, all Candidates will meet for exclusive online classes from
    world-class faculty to learn about specialized topics in coaching practice.
    This will include training in the BHS scoring categories, so ECP coaches
    can recognize opportunities for development that will actually increase an
    ensemble's scores.
  ]


  #program-component(title: [Peer review])[
    Candidates will team up in pairs to give each other regular feedback and
    discuss their experiences and possible coaching challenges with each other.
  ]
]




= Applications <applications>

== Who should apply

The ECP is intended for people who already coach quartets or choruses and
have a solid knowledge of the barbershop style.
We are looking for motivated and enthusiastic people who are eager
to learn and grow as coaches.

We deeply appreciate barbershoppers who want to take first steps towards
becoming a coach, but the ECP is not the program for them. The national
barbershop societies regularly offer Harmony College courses and Coaching
Observer opportunities that support new coaches on their journey.

Note that while attendance at the ECP itself is free, Candidates are expected
to attend two European Harmony Academies. Including travel, this may generate
costs of approximately € 3000 over the two years. We encourage Candidates to
seek financial support from their national barbershop societies.


== How to apply

The deadline for applications is 15 November 2026. We will link to a Google
Form from this website.

The application will include coaching videos and written questions about
coaching experience, approach and motivation. Shortlisted applicants will
be interviewed online.

Applications are assessed by an international selection team. The main
criteria are current coaching ability, barbershop knowledge, and willingness
to learn.



= Certification

Candidates will be examined by the selection team before they can graduate
as Certified Coaches.

After the first year, each Candidate will meet with a member of the selection team
for a mid-term checkin. The Candidate and selection team member will review
a video of the Candidate's coaching together and discuss the feedback from the
groups and the Candidate's own experiences. This This results in an
individual development plan for the second year.

Final interviews take place in summer to autumn 2029. Each Candidate will have
video calls with two selection team members to assess their coaching skills and
their understanding of the coach's role. These interviews will involve more
review of coaching videos and feedback.

The successful Candidates will become Certified Coaches in the second half of 2029.

Coaching videos and application material will be handled as described in our
#link("/legal/#privacy")[privacy notice].


= Selection Team


#people(
  (
    name: [Jay Butterfield],
    picture: "/assets/images/people/jay-butterfield.webp",
    profile: [
      BHS Singing Judge since 2016 and member of the Singing Board of
      Review. Musical Director of Parkside Harmony and Harmony University
      Provost in 2023. Holds a master's degree in choral conducting and a
      doctorate in educational leadership.
    ],
  ),

  (
    name: [Elizabeth Davies],
    picture: "/assets/images/people/elizabeth-davies.webp",
    profile: [
      BHS Singing Judge, 2023–2026. Director of Sound Harmony Chorus and Rain City Voices in Seattle, Washington. Taught multiple classes at Harmony University from 2019-2023, including “The Language of Masterful Coaching.”
    ],
  ),

  (
    name: [Mark Kettner],
    picture: "/assets/images/people/mark-kettner.webp",
    profile: [
      BHS Performance Judge since 2010 and former Performance Category
      Specialist. Musical Director of the Appalachian Express Chorus and an
      experienced coach and educator.
    ],
  ),

  (
    name: [Allen Otto],
    picture: "/assets/images/people/allen-otto.webp",
    profile: [
      BHS PER judge since 2019 and member of the PER Board of Review. Former
      Dean and continuing faculty of the PER College at Harmony University,
      with PER packages featured on the international stage yearly for over a
      decade. Coaches acting and singing groups at all levels, from gold
      medalists to first-timers.
    ],
  ),

  (
    name: [Gary Plaag],
    picture: "/assets/images/people/gary-plaag.webp",
    profile: [
      BHS Performance/Presentation Judge, 1998–2019. International chorus and
      quartet coach and Harmony University faculty member for 17 years;
      professionally a communication and presentation skills coach.
    ],
  ),

  (
    name: [Jordan Travis],
    picture: "/assets/images/people/jordan-travis.webp",
    profile: [
      BHS Singing Judge, 2014–2020. International vocal coach and music educator; Artistic Director of Voices Unlimited, A Cappella Showcase, and the Golden Horseshoe Choruses.
    ],
  ),

  (
    name: [Paul Wigley],
    picture: "/assets/images/people/paul-wigley.webp",
    profile: [
      BHS Musicality/Interpretation Judge since 1986 and former Music
      Category Specialist. Long-time director of the Minneapolis Commodores and
      faculty member at BHS Directors Colleges across the United States.
    ],
  ),

)


= Timeline <timeline>

#timeline(
  (date: [September 2026], event: [Website and initial call for participation]),
  (date: [1–15 November 2026], event: [Application period]),
  (date: [15 December 2026], event: [Candidates selected]),
  (date: [January 2027], event: [Virtual start, mentors assigned and coaching begins]),
  (date: [August 2027], event: [First ECP week at European Harmony Academy]),
  (date: [February 2028], event: [Mid-term check-ins and individual development plans]),
  (date: [August 2028], event: [Second ECP week at European Harmony Academy]),
  (date: [October–December 2028], event: [Final interviews and certification decisions]),
  (date: [2029], event: [Graduation ceremonies at national events]),
)


= Background

The European Coaching Program is modeled after the BinG! Coaching Certification
Program, which ran in 2019-2023. Our aim is to streamline and improve over the
elements that made the CCP a success and make it attractive to Candidates from
all across Europe. We list the BinG! Certified Coaches of 2023 as a reference for
the level of Candidate the ECP is aimed at.

#people(
  (
    name: [Lucas Bitzer],
    picture: "/assets/images/people/lucas-bitzer.webp",
    profile: [
      BHS Singing Judge since 2026 and 2013 European men's quartet champion.
      Certified Alexander Technique teacher and Lichtenberger voice teacher.
      Faculty member at BHS Harmony University and barbershop education events
      across Europe.
    ],
  ),
  (
    name: [Miriam Günther],
    picture: "/assets/images/people/miriam-guenther.webp",
    profile: [
      Music educator, singing teacher, and coach of pop, jazz, and barbershop
      choruses. National and international quartet competitor with SPLASH!,
      Twice as Nice, and Mix 'n' Match, and a founding member of the Heavy Medal
      Chorus.
    ],
  ),


  (
    name: [Norbert Hammes],
    picture: "/assets/images/people/norbert-hammes.webp",
    profile: [
      BHS Singing Judge since 2023. Founding member and current Vice-Chair of BinG!; German quartet champion with Viertakt in 1993 and TONIKUM in 2014. Director of Barbershop Blend since 2010 and director of the internationally competitive Heavy Medal Chorus.
    ],
  ),
  (
    name: [Alexander Koller],
    picture: "/assets/images/people/alexander-koller.webp",
    profile: [
      BHS Musicality Judge, 2023–2026. Founder of the European Harmony Brigade
      and co-organiser of the Coaching Certification Program. Faculty member at
      BHS Virtual Harmony University, BinG! Harmony College, the European
      Quartet School, and European Harmony Academy.
    ],
  ),

  (
    name: [Mareike Meise],
    picture: "/assets/images/people/mareike-meise.webp",
    profile: [
      Founder and Musical Director of A Cappella Company Dachau. Long-time
      Harmunichs singer and vocal teacher, with a coaching focus on authentic
      performance, English diction, vocal freedom, and ensemble sound.
    ],
  ),

  (
    name: [Stefanie Schmidt],
    picture: "/assets/images/people/stefanie-schmidt.webp",
    profile: [
      BHS Performance Judge since 2023. Co-founder and co-organiser of the
      Coaching Certification Program and European Harmony Brigade, former
      director of the A-Cappella Ladies, and European Harmony Academy faculty
      member. Her coaching focuses on authentic communication and draws on her theater and jazz dance experience.
    ],
  ),
)




= Organizers <organizers>

#people(
  (
    name: [Naud Berkhuizen],
    picture: "/assets/images/people/naud-berkhuizen.webp",
    profile: [
      BHS Performance Judge since 2026. Member of the Holland Harmony Education Team.
      Quartet silver medalist at Holland Harmony with Game On!.
      He has coached
      ensembles in Ireland and the Netherlands and served on the faculty of
      Harmony College Northeast in Boston as well as the European Harmony Academy.
    ],
  ),
  (
    name: [Alexander Koller],
    picture: "/assets/images/people/alexander-koller.webp",
    profile: [
      BHS Musicality Judge, 2023–2026. Founder of the European Harmony Brigade
      and co-organiser of the Coaching Certification Program. Faculty member at
      BHS Virtual Harmony University, BinG! Harmony College, the European
      Quartet School, and the European Harmony Academy.
    ],
  ),
  (
    name: [Stefanie Schmidt],
    picture: "/assets/images/people/stefanie-schmidt.webp",
    profile: [
      BHS Performance Judge since 2023. Co-founder and co-organizer of the
      Coaching Certification Program and European Harmony Brigade.
      Faculty member at BHS Virtual Harmony University, BinG! Harmony College,
      the European Quartet School, and the European Harmony Academy.
    ],
  ),
)


= Endorsements

The European Coaching Program is officially endorsed by national barbershop societies
from all across Europe.

#endorsed-by(
  // "BABS",
  "BIBA",
  "BinG!",
  "Holland Harmony",
  "IABS",
  // "LABBS",
  // "SNOBS"
)
