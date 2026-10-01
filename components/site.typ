// Reusable content components for the European Coaching Program website.

#let _element(tag, attrs: (:), body) = html.elem(
  tag,
  attrs: attrs,
  body,
)

#let _void-element(tag, attrs: (:)) = html.elem(tag, attrs: attrs)

#let _paragraph(class: none, body) = {
  let attrs = if class == none { (:) } else { (class: class) }
  _element("p", attrs: attrs, body)
}

#let _html-heading(level, body, id: none) = {
  let attrs = if id == none { (:) } else { (id: id) }
  _element("h" + str(level), attrs: attrs, body)
}

/// Render a gold announcement box with a title and supporting content.
#let callout(title: none, body) = {
  _element("aside", attrs: (class: "callout"))[
    #if title != none { _element("strong", title) }
    #_element("span", body)
  ]
}

/// Render the page introduction.
///
/// - `title`: The page's visible heading.
/// - `strapline`: A short label displayed above the summary.
/// - `summary`: The introductory paragraph.
#let introduction(
  title: none,
  strapline: none,
  summary: none,
) = {
  _element("header", attrs: (class: "page-introduction"))[
    #_html-heading(1, title)
    #if strapline != none { _paragraph(class: "strapline", strapline) }
    #if summary != none { _paragraph(class: "summary", summary) }
  ]
}

/// Render the responsive lead photograph used on the home page.
#let hero-photo(
  desktop-src: none,
  mobile-src: none,
  alt: "",
  caption: none,
) = {
  _element("figure", attrs: (class: "hero-banner"))[
    #_element("picture")[
      #if mobile-src != none {
        _void-element("source", attrs: (
          srcset: mobile-src,
          media: "(max-width: 600px)",
        ))
      }
      #_void-element("img", attrs: (
        src: desktop-src,
        alt: alt,
        width: "1600",
        height: "640",
        loading: "eager",
        decoding: "async",
        fetchpriority: "high",
      ))
    ]
    #if caption != none {
      _element("figcaption", caption)
    }
  ]
}

/// Render a responsive, progressively enhanced hero-image carousel.
///
/// Each slide is a dictionary with `desktop-src`, `mobile-src`, `alt`, and
/// `caption` fields. Without JavaScript the first slide remains visible.
#let hero-carousel(..slides) = {
  let entries = slides.pos()

  _element("figure", attrs: (
    class: "hero-banner hero-carousel",
    "data-hero-carousel": "",
    "aria-label": "Coaching photographs",
    "aria-roledescription": "carousel",
  ))[
    #_element("div", attrs: (class: "hero-slides"))[
      #for (index, slide) in entries.enumerate() {
        let active = index == 0
        let slide-class = if active { "hero-slide is-active" } else { "hero-slide" }
        _element("div", attrs: (
          class: slide-class,
          "data-hero-slide": "",
          "aria-hidden": if active { "false" } else { "true" },
        ))[
          #_element("picture")[
            #if slide.mobile-src != none {
              _void-element("source", attrs: (
                srcset: slide.mobile-src,
                media: "(max-width: 600px)",
              ))
            }
            #_void-element("img", attrs: (
              src: slide.desktop-src,
              alt: slide.alt,
              width: "1600",
              height: "640",
              loading: if active { "eager" } else { "lazy" },
              decoding: "async",
              fetchpriority: if active { "high" } else { "auto" },
            ))
          ]
          #if slide.caption != none {
            _element("span", attrs: (class: "hero-caption"), slide.caption)
          }
        ]
      }
    ]

    #if entries.len() > 1 {
      _element("div", attrs: (
        class: "hero-controls",
        "data-hero-controls": "",
        hidden: "",
      ))[
        #_element("button", attrs: (
          class: "hero-arrow hero-previous",
          type: "button",
          "data-hero-previous": "",
          "aria-label": "Show previous photograph",
        ))[‹]
        #_element("div", attrs: (
          class: "hero-dots",
          "aria-label": "Choose a photograph",
        ))[
          #for (index, _) in entries.enumerate() {
            _element("button", attrs: (
              class: if index == 0 { "hero-dot is-active" } else { "hero-dot" },
              type: "button",
              "data-hero-dot": str(index),
              "aria-label": "Show photograph " + str(index + 1),
              "aria-current": if index == 0 { "true" } else { "false" },
            ))[]
          }
        ]
        #_element("button", attrs: (
          class: "hero-arrow hero-next",
          type: "button",
          "data-hero-next": "",
          "aria-label": "Show next photograph",
        ))[›]
      ]
    }
  ]
}

/// Render the highlighted upcoming-dates panel.
///
/// Each positional argument must be a dictionary with `date` and `event`
/// fields containing display content.
#let upcoming-dates(..dates) = {
  _element("aside", attrs: (
    class: "upcoming",
    "aria-labelledby": "upcoming-heading",
  ))[
    #_html-heading(2, [Upcoming dates], id: "upcoming-heading")
    #_element("ul")[
      #for date in dates.pos() {
        _element("li")[
          #_element("strong", date.date)
          #_element("span", date.event)
        ]
      }
    ]
  ]
}

/// Arrange `program-component` children in the responsive program grid.
#let program-components(body) = {
  _element("div", attrs: (class: "program-components"), body)
}

/// Render one titled program card.
///
/// - `title`: The card heading.
/// - `body`: The card's paragraph content.
#let program-component(title: none, body) = {
  _element("section", attrs: (class: "program-component"))[
    #_html-heading(4, title)
    #_paragraph(body)
  ]
}

/// Render the dated program timeline.
///
/// Each positional argument must be a dictionary with `date` and `event`
/// fields containing display content.
#let timeline(..events) = {
  _element("ul", attrs: (class: "timeline"))[
    #for event in events.pos() {
      _element("li")[
        #_element("strong", event.date)
        #_element("span", event.event)
      ]
    }
  ]
}

/// Render a responsive grid of person profiles.
///
/// Each positional argument must contain `name`, `picture`, and `profile`
/// fields. `picture` is a public asset URL; the other fields are content.
#let people(..entries) = {
  _element("div", attrs: (class: "people-grid"))[
    #for entry in entries.pos() {
      let credit = entry.at("credit", default: none)
      _element("article", attrs: (class: "person"))[
        #_void-element("img", attrs: (
          class: "person-picture",
          src: entry.picture,
          alt: "",
          loading: "eager",
          decoding: "sync",
        ))
        #_element("div", attrs: (class: "person-details"))[
          #_html-heading(3, entry.name)
          #_paragraph(class: "person-profile", entry.profile)
          #if credit != none {
            _element("small", attrs: (class: "person-credit"), credit)
          }
        ]
      ]
    }
  ]
}

// The short names below are the arguments accepted by `endorsed-by`.
// To add a society, place its logo in assets/images/endorsers/, add an entry
// here, and then use its short name in content/index.typ (for example:
// #endorsed-by("BABS")).
#let _endorser-organizations = (
  "IABS": (
    name: "Irish Association of Barbershop Singers",
    homepage: "https://www.irishbarbershop.com/",
    logo: "/assets/images/endorsers/iabs.jpg",
  ),
  "BABS": (
    name: "British Association of Barbershop Singers",
    homepage: "https://www.singbarbershop.com/",
    logo: "/assets/images/endorsers/babs.png",
  ),
  "LABBS": (
    name: "Ladies Association of British Barbershop Singers",
    homepage: "https://www.labbs.org.uk/",
    logo: "/assets/images/endorsers/labbs.jpg",
  ),
  "BinG!": (
    name: "Barbershop in Germany",
    homepage: "https://www.barbershop.de/en",
    logo: "/assets/images/endorsers/bing.svg",
  ),
  "BIBA": (
    name: "Barbershop of Iberia Association",
    homepage: "https://bibabarbershop.com/",
    logo: "/assets/images/endorsers/biba.png",
  ),
  "Holland Harmony": (
    name: "Holland Harmony",
    homepage: "https://www.hollandharmony.nl/",
    logo: "/assets/images/endorsers/holland-harmony.jpg",
  ),
  "SNOBS": (
    name: "Society of Nordic Barbershop Singers",
    homepage: "https://www.snobs.org/",
    logo: "/assets/images/endorsers/snobs.png",
  ),
  "SAI Region 31": (
    name: "Region 31 - Quartet of Nations",
    homepage: "https://sweetadelines.org.uk/",
    logo: "/assets/images/endorsers/sai-region-31.png",
  ),
)

/// Render linked logo cards for endorsing organizations.
///
/// Each positional argument is one of the short names defined in
/// `_endorser-organizations`, such as `"BABS"` or `"BinG!"`.
#let endorsed-by(..short-names) = {
  _element("ul", attrs: (
    class: "endorsements",
    "aria-label": "Endorsing organizations",
  ))[
    #for short-name in short-names.pos() {
      let organization = _endorser-organizations.at(short-name)
      let logo = _element("span", attrs: (class: "endorser-logo"))[
        #_void-element("img", attrs: (
          src: organization.logo,
          alt: organization.name,
        ))
      ]
      let name = _element("span", attrs: (class: "endorser-name"))[
        #organization.name
      ]

      _element("li")[
        #_element("a", attrs: (
          href: organization.homepage,
          "aria-label": organization.name,
        ), logo + name)
      ]
    }
  ]
}
