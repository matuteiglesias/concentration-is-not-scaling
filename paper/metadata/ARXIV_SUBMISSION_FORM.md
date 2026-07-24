# arXiv submission form packet

**Status:** Draft for PI review. Do not submit from this file. Official arXiv-page confirmation remains blocked by the release environment; see `ARXIV_REQUIREMENTS.md`.

## Title

```text
Concentration Is Not Scaling: An Exact Decomposition of Aggregate Variance Elasticities
```

## Authors

```tex
Mat\'ias Iglesias
```

## Affiliation

```text
Departamento de Computación, Facultad de Ciencias Exactas y Naturales, Universidad de Buenos Aires, Buenos Aires, Argentina
```

## Abstract (1,067 characters, including spaces)

```text
Granular models relate aggregate variance to the concentration of economic weights. This proportionality is exact only under restrictive assumptions on marginal shock variances, dependence, and population composition. Concentration is a level property, whereas variance scaling is an elasticity defined along a population path. We show that identical Herfindahl paths can generate different aggregate-variance elasticities and derive an exact finite-interval decomposition of that elasticity into changes in diagonal variance and signed covariance components. The decomposition uses the logarithmic mean of total variance and requires no logarithm of individual components. A contribution-weighted average of component elasticities emerges only under positivity and comparability conditions. Deterministic analytic constructions verify the direct and reconstructed elasticities at floating-point precision. The result clarifies the boundary of concentration-based granular reasoning and supplies an accounting framework for micro-to-macro analyses of diversification.
```

This is ASCII-safe and is below the requested 1,920-character limit. Its substance matches the shared manuscript abstract; it has no `Abstract` heading or opaque macro.

## Comments

**Pending generated values.** Do not enter a page count until `make arxiv` has produced and validated `dist/manuscript_arxiv_v1.pdf`. After validation, use:

```text
<actual page count> pages, 2 figures. Code and deterministic verification artifacts available in the associated public repository.
```

## Report number, journal reference, and publication DOI

Leave all three fields blank.

## Categories

- **Primary recommendation:** `econ.GN` — general methodological contribution to economics.
- **Cross-list recommendation:** `econ.TH` — theoretical economics, including the paper's macroeconomic aggregation setting.
- **Do not select:** `econ.EM`; this paper does not develop an econometric estimator or statistical-inference method.

Taxonomy wording must be rechecked on the official category-taxonomy page before submission because the release environment could not access it.

## Keywords

```text
aggregate variance; identification; concentration; diversification; covariance; scaling elasticity
```

## JEL-code audit

The migrated wrapper lists `C02, C10, D20`. Provisional recommendation for PI confirmation: **C02** (mathematical methods) and **D20** (general production/organizations-related economic analysis) are aligned with the formal aggregation/accounting focus. **C10** is not recommended as final without PI confirmation because the paper does not offer an econometric estimator or statistical-inference method. This is a classification recommendation, not a scientific change; the manuscript JEL line remains unchanged.

## License

Do not choose a license in the platform form until the PI makes the decision recorded in `LICENSE_DECISION.md`.
