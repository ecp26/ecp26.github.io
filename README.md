# European Coaching Program website

This is a static website written in [Typst](https://typst.app/), a markup and
typesetting system with syntax similar to Markdown. Typst compiles the source
into an HTML bundle containing the page, stylesheet, and images. No JavaScript
toolchain or package manager is required.

Website content lives in `main.typ`. The HTML structure is defined in
`template.typ`, and the visual design lives in `static/css/site.css`.

## Install Typst

The deployment workflow uses Typst 0.15.0. Install that version, or a compatible
0.15.x release, from the [Typst releases
page](https://github.com/typst/typst/releases). Typst is a single executable.

Package managers also provide it:

```sh
# macOS with Homebrew
brew install typst

# Windows with WinGet
winget install --id Typst.Typst
```

On Linux, use your distribution's package manager if it provides Typst, or
download the appropriate archive from the releases page and put the `typst`
executable on your `PATH`.

Check the installation with:

```sh
typst --version
```

## Compile the website

From the repository root, run:

```sh
typst compile --features html,bundle --format bundle main.typ public
```

The generated website is written to `public/`, with the entry page at
`public/index.html`. The entire directory is generated and excluded from Git;
do not edit it by hand.

## Preview locally

For live preview while editing, run:

```sh
typst watch --features html,bundle --format bundle main.typ public
```

Typst recompiles the site whenever a source file changes, starts a local web
server, and prints its URL in the terminal. Stop it with Ctrl+C.

## Editing

Edit `main.typ` directly. Major sections use normal Typst headings and labels.
Helpers are reserved for structured content such as program cards, timelines,
and people lists; HTML tags, attributes, and CSS class names belong in
`template.typ`.

Typst's HTML and bundle exporters are currently experimental, so the compiler
version is pinned in the GitHub Actions workflow. Test the generated site before
changing that version.

## Build without installing Typst

You do not need Typst locally merely to publish an edit. Commit and push the
source files to `main`; GitHub Actions installs the pinned compiler, builds the
site, and deploys it. Check the repository's **Actions** tab if the deployment
does not appear.

## GitHub Pages setup

In the repository settings, open **Pages** and choose **GitHub Actions** as the
source. The workflow in `.github/workflows/typst.yml` builds and publishes the
site after each push to `main`.

Before launch, complete the imprint contact details in `main.typ`.
