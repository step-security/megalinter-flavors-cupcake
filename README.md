[![StepSecurity Maintained Action](https://raw.githubusercontent.com/step-security/maintained-actions-assets/main/assets/maintained-action-banner.png)](https://docs.stepsecurity.io/actions/stepsecurity-maintained-actions)

# MegaLinter — Cupcake Flavor

## Usage

Add the following workflow to `.github/workflows/mega-linter.yml` in your repository:

```yaml
name: MegaLinter

on:
  push:
  pull_request:
    branches: [master, main]

concurrency:
  group: ${{ github.ref }}-${{ github.workflow }}
  cancel-in-progress: true

permissions: {}

jobs:
  megalinter:
    name: MegaLinter
    runs-on: ubuntu-latest
    permissions:
      contents: write
      issues: write
      pull-requests: write
    steps:
      - name: Checkout Code
        uses: actions/checkout@v7
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
          fetch-depth: 0

      - name: MegaLinter
        id: ml
        uses: step-security/megalinter-flavors-cupcake@v10
        env:
          VALIDATE_ALL_CODEBASE: ${{ github.event_name == 'push' && github.ref == 'refs/heads/main' }}
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

      - name: Archive MegaLinter reports
        if: success() || failure()
        uses: actions/upload-artifact@v7
        with:
          name: MegaLinter reports
          path: |
            megalinter-reports
            mega-linter.log
```

## Outputs

| Output | Description |
|--------|-------------|
| `has_updated_sources` | `1` if source files were updated by auto-fix, `0` otherwise |

## Configuration

MegaLinter is configured via a `.mega-linter.yml` file at the root of your repository, or through environment variables passed in the `env:` block of the workflow step.

Full configuration reference: [megalinter.io/configuration](https://megalinter.io/configuration/)

## License

[GNU Affero General Public License](LICENSE)