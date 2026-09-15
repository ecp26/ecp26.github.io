# European Coaching Program website

Initial Hugo prototype for the European Coaching Program. The page is stored as structured YAML front matter in `content/_index.md`. Hugo templates turn each section type into semantic HTML with its own layout.

## Preview locally

```sh
hugo server
```

Open <http://localhost:1313>.

## Editing through Sveltia CMS

Sveltia is included in the repository, so local editing does not require an
account, a CMS proxy or an internet connection.

1. Run `hugo server` in the project directory.
2. In Chrome, Edge or another Chromium-based browser, open
   <http://localhost:1313/admin/index.html>.
3. Choose **Work with Local Repository** and select this project directory.
4. Open **Website → Homepage**, make an edit and save it.
5. Preview the result at <http://localhost:1313>. Hugo reloads when the content
   file changes.

Sveltia writes directly to `content/_index.md`; it does not commit or push.
Review and commit the changes with Git as usual. Firefox and Safari cannot use
this local workflow because they do not support the required File System Access
API.

The editor presents the homepage as an ordered list of named sections. Dates,
program components, coaches and organisers are editable lists with separate
fields. Longer prose fields use a rich-text editor; their stored Markdown is an
implementation detail.

The CMS bundle and its fonts are vendored under `static/admin`, so the editor
also starts while offline. `static/admin/config.yml` contains a placeholder
repository name. Replace it with the eventual GitHub `owner/repository` before
setting up browser-based remote editing for organisers.

## GitHub Pages setup

In the repository settings, open **Pages** and choose **GitHub Actions** as the source. The workflow in `.github/workflows/hugo.yml` builds and publishes the site after each push to `main`.

Before launch, replace the placeholder `baseURL` in `hugo.toml` with the final domain and complete the imprint contact details in `content/_index.md`.
