# Replication: Why Does the Indian State Both Fail and Succeed?

Devesh Kapur — *Journal of Economic Perspectives (2020)*.

This [stats.camp](https://stats.camp) repository preserves official AEA deposit
**231498, version V1**, for replication and engine compatibility testing.
**Status: executed on 2026-10-16 and again on 2026-10-17 in the native stats.camp engine from scratch copies; the package runs end to end in the engine.**
The deposited datasets and analysis script retain their original bytes and
archive-relative paths. Documentation and figure metadata are adapted for stats.camp.

## The study

Examines differences in the Indian state’s performance across public services and administrative tasks, using international comparisons of democracy, income, and state capacity.

## Contents and entry points

The package includes the spreadsheet and .dta inputs and deposited reference figures. Its code imports spreadsheets, merges country data, runs OLS, predicts residuals, and draws scatterplots and fitted lines.

The source archive contains **15 original files** totaling
**4,739,351 bytes**. The source ZIP is
882,649 bytes. Deposited data, reference outputs, and ancillary files are retained;
documentation is adapted for stats.camp.

Analysis entry point:

- [replication-files/devesh_jep.do](replication-files/devesh_jep.do)

Authors’ documentation, adapted for stats.camp:

- [replication-files/readme.rtf](replication-files/readme.rtf)

## Setup and current scope

The script sets `global master "replication files"`, whereas the deposited folder is named `replication-files`. The mismatch is preserved. A later execution audit must resolve this path through the runtime or a scratch workspace; changing the global before running is insufficient because the script sets it again.

The 2026-10-16 runs used scratch copies, so the figures, logs and intermediate
datasets in this repository are still the authors' deposited reference material.

## Inspect in stats.camp

These links open the deposited files for inspection. They do not establish
that the preserved paths, dependencies, or commands are executable in the browser.

- [replication-files/devesh_jep.do](https://stats.camp/app?open=https%3A%2F%2Fgithub.com%2Fstats-camp%2Freplication-indian-state-capacity.git&file=replication-files%2Fdevesh_jep.do)

## Source integrity and attribution

- [Official deposit](https://www.openicpsr.org/openicpsr/project/231498/version/V1/view)
- [Deposit DOI](https://doi.org/10.3886/E231498V1)

Archive: `231498-V1.zip`. SHA-256:
`4b0a22ce65dd1eaa2026568337b5a91ae2bd4a964b7305ea97b165dda709d604`.

All original file hashes were checked after extraction. `.gitattributes` disables
Git line-ending normalization. Empty folders are represented by `.gitkeep`
files. The root README and Git configuration are stats-camp additions.

The deposited `LICENSE.txt` is retained without modification. It supplies the original code/data terms; this mirror does not relicense the research.

The study, code, and data remain credited to Devesh Kapur; stats-camp maintains
this mirror and its preparation documentation.
