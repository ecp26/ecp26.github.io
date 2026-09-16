// Page metadata and shared HTML shell for the ECP website.

#import "@tola/site:0.0.0": info
#import "@tola/current:0.0.0": current-permalink

#let element(tag, attrs: (:), body) = html.elem(
  tag,
  attrs: attrs,
  body,
)

#let void-element(tag, attrs: (:)) = html.elem(tag, attrs: attrs)

#let canonical-url() = {
  if info.url == none or current-permalink == none {
    return none
  }

  let base = if info.url.ends-with("/") {
    info.url.slice(0, info.url.len() - 1)
  } else {
    info.url
  }

  base + current-permalink
}

#let navigation() = context {
  let sections = query(heading.where(level: 1))
  for section in sections {
    if section.has("label") and section.label != <imprint> and section.label != <privacy> {
      link(section.label, section.body)
    }
  }
}

#let layout(
  title: info.title,
  description: info.description,
  language: info.language,
  body,
) = {
  let canonical = canonical-url()

  // Tola reads this metadata for its page index, sitemap and generated tags.
  [#metadata((
    title: title,
    summary: description,
    draft: false,
    global-header: true,
  )) <tola-meta>]

  element("html", attrs: (lang: language))[
    #element("head")[
      #void-element("meta", attrs: (charset: "utf-8"))
      #void-element("meta", attrs: (
        name: "viewport",
        content: "width=device-width, initial-scale=1",
      ))
      #void-element("meta", attrs: (name: "description", content: description))
      #if canonical != none {
        void-element("link", attrs: (rel: "canonical", href: canonical))
      }
      #element("title", title)
    ]
    #element("body")[
      #element("a", attrs: (class: "skip-link", href: "#main"))[Skip to content]
      #element("header", attrs: (class: "site-header"))[
        #element("a", attrs: (
          class: "brand",
          href: "/",
          "aria-label": info.title + " home",
        ))[
          #element("span", attrs: (class: "brand-mark"))[ECP]
          #element("span", info.title)
        ]
        #element("nav", attrs: (
          class: "site-nav",
          "aria-label": "Primary navigation",
        ))[
          #navigation()
        ]
        #element("details", attrs: (class: "mobile-nav"))[
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
            #navigation()
          ]
        ]
      ]
      #element("main", attrs: (id: "main"))[
        #element("article", attrs: (class: "page-content"), body)
      ]
      #element("footer", attrs: (class: "site-footer"))[
        #element("span", info.title)
        #element("nav", attrs: ("aria-label": "Legal information"))[
          #link(<imprint>)[Imprint]
          #link(<privacy>)[Privacy]
        ]
      ]
    ]
  ]
}
