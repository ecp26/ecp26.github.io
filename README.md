# European Coaching Program website

The site is written in Typst and exported as a static HTML bundle. Website
content lives in `main.typ`; `template.typ` contains the HTML structure and
connects it to the existing stylesheet in `static/css/site.css`.

## Preview locally

```sh
typst watch --features html,bundle --format bundle main.typ public
```

Typst prints the local preview URL when the server starts.

## Editing

Edit `main.typ` directly. Major sections use normal Typst headings and labels.
Helpers are reserved for structured content such as program cards, timelines,
and people lists; HTML tags, attributes, and CSS class names belong in
`template.typ`.

Typst's HTML and bundle exporters are currently experimental, so the compiler
version is pinned in the GitHub Actions workflow. Test the generated site before
changing that version.

## GitHub Pages setup

In the repository settings, open **Pages** and choose **GitHub Actions** as the
source. The workflow in `.github/workflows/typst.yml` builds and publishes the
site after each push to `main`.

Before launch, complete the imprint contact details in `main.typ`.
