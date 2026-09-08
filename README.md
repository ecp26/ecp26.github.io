# European Coaching Program website

Initial Hugo prototype for the European Coaching Program. The complete page is ordinary Markdown in `content/_index.md`; it has no front matter. Edit it from top to bottom like a document, or use Pages CMS.

## Preview locally

```sh
hugo server
```

Open <http://localhost:1313>.

## Editing through Pages CMS

After the repository has been pushed to GitHub:

1. Sign in at <https://app.pagescms.org/>.
2. Install the Pages CMS GitHub App for this repository.
3. Open the repository. Pages CMS reads `.pages.yml` and presents the homepage as one rich-text document named **Website content**.
4. Invite non-GitHub editors by email from the collaborator settings.

Edits are committed to `main`, which triggers the Hugo deployment workflow.

## GitHub Pages setup

In the repository settings, open **Pages** and choose **GitHub Actions** as the source. The workflow in `.github/workflows/hugo.yml` builds and publishes the site after each push to `main`.

Before launch, replace the placeholder `baseURL` in `hugo.toml` with the final domain and complete the imprint contact details in `content/_index.md`.
