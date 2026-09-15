// HTML rendering and site structure for the ECP website.
//
// Keep HTML tags, attributes, CSS classes, and bundled assets in this file so
// that main.typ can remain a human-readable content document.

#let element(tag, attrs: (:), body) = html.elem(
  tag,
  attrs: attrs,
  body,
)

#let void-element(tag, attrs: (:)) = html.elem(tag, attrs: attrs)

#let paragraph(class: none, body) = {
  let attrs = if class == none { (:) } else { (class: class) }
  element("p", attrs: attrs, body)
}

#let html-heading(level, body, id: none) = {
  let attrs = if id == none { (:) } else { (id: id) }
  element("h" + str(level), attrs: attrs, body)
}

#let site(
  title: none,
  description: none,
  language: "en",
  body,
) = {
  document("index.html", title: title)[
    #element("html", attrs: (lang: language))[
      #element("head")[
        #void-element("meta", attrs: (charset: "utf-8"))
        #void-element("meta", attrs: (
          name: "viewport",
          content: "width=device-width, initial-scale=1",
        ))
        #void-element("meta", attrs: (name: "description", content: description))
        #element("title", title)
        #void-element("link", attrs: (rel: "stylesheet", href: "css/site.css"))
      ]
      #element("body")[
        #element("a", attrs: (class: "skip-link", href: "#main"))[Skip to content]
        #element("header", attrs: (class: "site-header"))[
          #element("a", attrs: (
            class: "brand",
            href: "./",
            "aria-label": title + " home",
          ))[
            #element("span", attrs: (class: "brand-mark"))[ECP]
            #element("span", title)
          ]
          #element("nav", attrs: (
            class: "site-nav",
            "aria-label": "Primary navigation",
          ))[
            #context {
              let sections = query(heading.where(level: 1))
              for section in sections {
                if section.has("label") and section.label != <imprint> and section.label != <privacy> {
                  link(section.label, section.body)
                }
              }
            }
          ]
          #element("details", attrs: (
            class: "mobile-nav",
            style: "display: none",
          ))[
            #element("summary", attrs: (
              "aria-label": "Open navigation menu",
            ))[
              #element("span", attrs: (class: "mobile-nav-label"))[Menu]
              #element("span", attrs: (
                class: "hamburger",
                "aria-hidden": "true",
              ))[]
            ]
            #element("nav", attrs: ("aria-label": "Mobile navigation"))[
              #context {
                let sections = query(heading.where(level: 1))
                for section in sections {
                  if section.has("label") and section.label != <imprint> and section.label != <privacy> {
                    link(section.label, section.body)
                  }
                }
              }
            ]
          ]
        ]
        #element("main", attrs: (id: "main"))[
          #element("article", attrs: (class: "page-content"), body)
        ]
        #element("footer", attrs: (class: "site-footer"))[
          #element("span", title)
          #element("nav", attrs: ("aria-label": "Legal information"))[
            #link(<imprint>)[Imprint]
            #link(<privacy>)[Privacy]
          ]
        ]
      ]
    ]
  ]

  asset("css/site.css", read("static/css/site.css", encoding: none))
  for picture in (
    "placeholder.svg",
    "man-placeholder.svg",
    "woman-placeholder.svg",
    "alexander-koller.webp",
    "lucas-bitzer.webp",
    "mareike-meise.webp",
    "miriam-guenther.webp",
    "norbert-hammes.webp",
    "stefanie-schmidt.webp",
  ) {
    asset(
      "images/people/" + picture,
      read("static/images/people/" + picture, encoding: none),
    )
  }
  for logo in (
    "iabs.jpg",
    "babs.png",
    "labbs.jpg",
    "bing.svg",
    "biba.png",
    "holland-harmony.jpg",
    "snobs.png",
  ) {
    asset(
      "images/endorsers/" + logo,
      read("static/images/endorsers/" + logo, encoding: none),
    )
  }
}

#let introduction(
  title: none,
  strapline: none,
  summary: none,
  period: none,
) = {
  element("header", attrs: (class: "page-introduction"))[
    #html-heading(1, title)
    #paragraph(class: "strapline", strapline)
    #paragraph(class: "summary", summary)
    #if period != none { paragraph(period) }
  ]
}

#let upcoming-dates(..dates) = {
  element("aside", attrs: (
    class: "upcoming",
    "aria-labelledby": "upcoming-heading",
  ))[
    #html-heading(2, [Upcoming dates], id: "upcoming-heading")
    #element("ul")[
      #for date in dates.pos() {
        element("li")[
          #element("strong", date.date)
          #element("span", date.event)
        ]
      }
    ]
  ]
}

#let program-components(body) = {
  element("div", attrs: (class: "program-components"), body)
}

#let program-component(title: none, body) = {
  element("section", attrs: (class: "program-component"))[
    #html-heading(4, title)
    #paragraph(body)
  ]
}

#let cost-note(label: none, body) = paragraph(class: "cost-note")[
  #element("strong")[#label:]
  #body
]

#let timeline(..events) = {
  element("ul", attrs: (class: "timeline"))[
    #for event in events.pos() {
      element("li")[
        #element("strong", event.date)
        #element("span", event.event)
      ]
    }
  ]
}

#let people(..entries) = {
  element("div", attrs: (class: "people-grid"))[
    #for entry in entries.pos() {
      element("article", attrs: (class: "person"))[
        #void-element("img", attrs: (
          class: "person-picture",
          src: entry.picture,
          alt: "",
          loading: "eager",
          decoding: "sync",
        ))
        #element("div", attrs: (class: "person-details"))[
          #html-heading(3, entry.name)
          #paragraph(class: "person-profile", entry.profile)
        ]
      ]
    }
  ]
}

// The short names below are the arguments accepted by `endorsed-by`.
// To add a society, place its logo in static/images/endorsers/, add an entry
// here, and then use its short name in main.typ (for example: #endorsed-by("BABS")).
#let endorser-organizations = (
  "IABS": (
    name: "Irish Association of Barbershop Singers",
    homepage: "https://www.irishbarbershop.com/",
    logo: "images/endorsers/iabs.jpg",
  ),
  "BABS": (
    name: "British Association of Barbershop Singers",
    homepage: "https://www.singbarbershop.com/",
    logo: "images/endorsers/babs.png",
  ),
  "LABBS": (
    name: "Ladies Association of British Barbershop Singers",
    homepage: "https://www.labbs.org.uk/",
    logo: "images/endorsers/labbs.jpg",
  ),
  "BinG!": (
    name: "Barbershop in Germany",
    homepage: "https://www.barbershop.de/en",
    logo: "images/endorsers/bing.svg",
  ),
  "BIBA": (
    name: "Barbershop of Iberia Association",
    homepage: "https://bibabarbershop.com/",
    logo: "images/endorsers/biba.png",
  ),
  "Holland Harmony": (
    name: "Holland Harmony",
    homepage: "https://www.hollandharmony.nl/",
    logo: "images/endorsers/holland-harmony.jpg",
  ),
  "SNOBS": (
    name: "Society of Nordic Barbershop Singers",
    homepage: "https://www.snobs.org/",
    logo: "images/endorsers/snobs.png",
  ),
)

#let endorsed-by(..short-names) = {
  element("ul", attrs: (
    class: "endorsements",
    "aria-label": "Endorsing organizations",
  ))[
    #for short-name in short-names.pos() {
      let organization = endorser-organizations.at(short-name)
      element("li")[
        #element("a", attrs: (
          href: organization.homepage,
          "aria-label": organization.name,
        ))[
          #element("span", attrs: (class: "endorser-logo"))[
            #void-element("img", attrs: (
              src: organization.logo,
              alt: organization.name,
            ))
          ]
          #element("span", attrs: (class: "endorser-name"))[#organization.name]
        ]
      ]
    }
  ]
}
