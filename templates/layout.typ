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

#let primary-sections = (
  (id: "program", label: [Program]),
  (id: "applications", label: [Applications]),
  (id: "timeline", label: [Timeline]),
  (id: "organizers", label: [Organizers]),
)

#let section-href(id) = {
  if current-permalink == "/" { "#" + id } else { "/#" + id }
}

#let navigation() = {
  for section in primary-sections {
    link(section-href(section.id), section.label)
  }
}

#let layout(
  title: info.title,
  description: info.description,
  language: info.language,
  redirect: none,
  body,
) = {
  let canonical = canonical-url()
  let document-title = if title == info.title {
    title
  } else {
    title + " · " + info.title
  }

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
      #if redirect != none {
        void-element("meta", attrs: (
          "http-equiv": "refresh",
          content: "0; url=" + redirect,
        ))
        void-element("meta", attrs: (name: "robots", content: "noindex"))
      }
      #if canonical != none {
        void-element("link", attrs: (rel: "canonical", href: canonical))
      }
      #element("title", document-title)
    ]
    #element("body", attrs: (id: "top"))[
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
          #link("/legal/#top")[Imprint & Privacy]
        ]
      ]
    ]
  ]
}
