# Concentration Is Not Scaling

Canonical source and reproducibility repository for:

**Matías Iglesias. “Concentration Is Not Scaling: An Exact
Decomposition of Aggregate Variance Elasticities.”**

The paper separates the population path of economic-weight
concentration from the variance–covariance restrictions required to
turn that path into an aggregate-volatility scaling law.

Its principal results are:

1. even the complete weight path does not identify aggregate-variance
   scaling over unrestricted covariance paths;
2. finite-interval variance elasticities admit an exact additive
   decomposition into diagonal and signed covariance contributions;
3. the observed scaling exponent is an accounting summary of
   diversification, rather than a primitive property of population
   size.

This repository contains:

- a shared scientific manuscript;
- journal-neutral arXiv and Elsevier CAS builds;
- deterministic analytic demonstrations;
- tests of the variance and scaling identities;
- machine-readable reference artifacts;
- release and citation metadata.

The repository does **not** reproduce the empirical French-export
variance-decay estimate. That remains a separate research output in the
broader Economics of Aggregation, Scale, and Measurement programme.

## Reproducibility commands

```bash
make test      # Python identity tests
make demo      # deterministic CSV evidence and ignored review figures
make verify    # tests plus demo
make arxiv     # neutral wrapper PDF in dist/
make elsevier  # CAS wrapper PDF in dist/
make package   # PDFs, source ZIPs, clean extracted-package builds, checksums
```

The shared scientific source is `paper/content.tex`. Wrapper-specific front matter is limited to `paper/arxiv.tex` and `paper/elsevier.tex`; CAS support files live in `paper/styles/elsevier/`. Generated PNG, PDF, ZIP, and `dist/` files are deliberately ignored.
