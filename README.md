# [𝗟𝗮𝗯𝗥𝗜 𝗦𝗵𝗶𝗻𝘆 𝗖𝗼𝗻𝗻𝗲𝗰𝘁](https://img.shields.io/badge/LabRI%20Shiny%20Connect-%230070C0?style=for-the-badge&logoColor=white)

[Development history](#development-history) · [Changelog](CHANGELOG.md)

![](https://img.shields.io/github/license/labrgrupo/LabRI_shiny_connect.svg)
![](https://img.shields.io/github/last-commit/labrgrupo/LabRI_shiny_connect/main.svg)

<img src="www/Logo.svg" width="350px" height="250px" align="right"/>

**LabRI Shiny Connect** is the cloud-ready implementation of the LabRI Shiny Application for the estimation and verification of reference intervals in clinical laboratories. It preserves the full analytical structure of the **LabRI method** while adapting the application to a **session-based, cloud-compatible mode**: no figures, spreadsheets, intermediate files, `.RData`, `.Rhistory`, or HTML reports are written to persistent folders on the server. The application is designed for **Posit Connect**, **Posit Cloud**, and institutional Shiny servers, and a public demonstration instance is currently hosted on Posit Connect Cloud.

**Repository contents:**

- **`app.R`** — Launches the Shiny interface and orchestrates execution of the LabRI method in a cloud-compatible environment.
- **`LabRI_script_connect.Rmd`** — Analytical script that implements the LabRI method and renders the HTML report during the Shiny session.
- **`www/`** — Static files used by the interface (logo, screenshots).

Deployment-specific files such as `manifest.json` or `renv.lock` may also be included depending on the target platform.

---

## 🌐 𝗟𝗶𝘃𝗲 𝗱𝗲𝗺𝗼𝗻𝘀𝘁𝗿𝗮𝘁𝗶𝗼𝗻 𝗼𝗻 𝗣𝗼𝘀𝗶𝘁 𝗖𝗼𝗻𝗻𝗲𝗰𝘁 𝗖𝗹𝗼𝘂𝗱

A public deployment is available on **Posit Connect Cloud** as a demonstration instance, allowing the LabRI method to be evaluated directly in the browser without installing R or RStudio.

<div align="center">

### 👇 **Click here to access the LabRI Shiny Connect live demo** 👇

<a href="https://labrgroup-labri.share.connect.posit.cloud/" target="_blank" rel="noopener noreferrer">
  <img src="https://img.shields.io/badge/%20-Launch%20LabRI%20Demo-%23009C3B?style=flat-square&logo=googlechrome&logoColor=%23009C3B&labelColor=%23FFDF00" alt="Launch the LabRI live demo on Posit Connect Cloud" style="height: 50px;">
</a>

</div>

The instance runs on the **Posit Connect Cloud Free plan** (4 GB memory, 1 CPU, 20 monthly active hours, max. 5 hosted apps). Under these constraints the demo may exhibit **instability or memory-related failures** with large datasets or reports containing many figures. It is intended **strictly as a showcase**, not as a production system, and should not be used to process sensitive laboratory data.

### Deploying your own instance

For institutional or production use, users are encouraged to **fork the official repository** — i.e., create a personal GitHub copy that can be freely modified, redeployed, and synchronized with the original:

🔗 **Official repository:** [https://github.com/labrgrupo/LabRI_shiny_connect](https://github.com/labrgrupo/LabRI_shiny_connect)

From a fork, users can:

- Deploy on **Posit Connect Cloud (paid tiers)** with higher memory, CPU, and uptime.
- Deploy on a **self-hosted Posit Connect server** or institutional Shiny Server.
- Adapt `LabRI_script_connect.Rmd` and `app.R` for **shinyapps.io**, **AWS**, **Azure**, **Google Cloud Run**, **Hugging Face Spaces**, or **Docker-based** environments.
- Customize the application for internal authentication, branding, or laboratory-specific workflows under the terms of the GPL-3.0 license.

---

## 🌐 𝗟𝗼𝗰𝗮𝗹 𝗲𝘅𝗲𝗰𝘂𝘁𝗶𝗼𝗻 𝘃𝘀. 𝗰𝗹𝗼𝘂𝗱-𝗿𝗲𝗮𝗱𝘆 𝘃𝗲𝗿𝘀𝗶𝗼𝗻

The LabRI Shiny tool is distributed in **two complementary implementations** that share the same analytical method but differ in their output-management strategy:

- **[LabRI Shiny Application](https://github.com/labrgrupo/LabRI_shiny)** — local implementation — runs locally after R and RStudio are installed. Automatically creates `3_Outputs/Figures/`, `3_Outputs/Spreadsheets/`, and `4_Report_HTML/` and writes figures, spreadsheets, intermediate files, and HTML reports to disk. Appropriate for **single-user desktop workflows**.
- **LabRI_shiny_connect** — cloud-ready implementation for **Posit Connect**, **Posit Cloud**, or institutional Shiny servers. Operates in **session-based mode**, with no persistent files written to the server directory. Outputs are rendered inside the Shiny interface or in temporary session files, and the HTML report can be downloaded manually by the user.

A public demonstration of the cloud-ready version is available at **[labrgroup-labri.share.connect.posit.cloud](https://labrgroup-labri.share.connect.posit.cloud/)** (Posit Connect Cloud Free plan — intended as a showcase only, not for production use).

| Feature | LabRI Shiny Application (local execution) | LabRI_shiny_connect |
|---|---:|---:|
| Runs on the user's computer | Yes | Optional |
| Requires prior installation of R and RStudio | Yes | No (for end users in a deployed cloud environment) |
| Designed for Posit Connect / Posit Cloud | No | Yes |
| Automatically creates output folders | Yes | No |
| Automatically saves figures | Yes | No |
| Automatically saves spreadsheets | Yes | No |
| Automatically saves HTML reports to fixed folders | Yes | No |
| Saves `.RData` / `.Rhistory` | Possible | No |
| Uses temporary files only for session rendering | No | Yes |
| Displays report in the Shiny interface | Yes | Yes |
| Browser-based use without local execution | No | Yes |

The **analytical method is identical** in both implementations; only the output architecture differs. The local version is preferred for individual analytical work and for processing larger datasets without cloud memory constraints, while the cloud-ready version is preferred for institutional deployment, demonstrations, training environments, and multi-user access.

---

## 𝗨𝘀𝗲𝗿 𝗶𝗻𝘁𝗲𝗿𝗳𝗮𝗰𝗲

The initial interface captures the analyst's name in the **Name of the Responsible Specialist** section and accepts `.csv`, `.xls`, or `.xlsx` uploads in the **Define the Dataset** section, where the relevant data column is selected. A status bar tracks processing progress.

<img src="www/Interface_Shiny.png" width="800px" height="400px"/>

---

## 𝗧𝗵𝗲 𝗟𝗮𝗯𝗥𝗜 𝗠𝗲𝘁𝗵𝗼𝗱

The **LabRI Method** is the analytical core of the **LabRI System**, implemented primarily in `LabRI_script_connect.Rmd`. It is organized in two modules:

- **Estimation Module** — adaptive, multi-criteria estimation of reference intervals via data cleaning, transformation, and clustering, using `refineR`, `reflimR`, and the Expectation–Maximization (EM) algorithm (`mclust`, `mixR`).
- **Verification Module** — three-level analysis assessing statistical uncertainty, equivalence, and concordance, ensuring the estimated intervals are reliable for clinical application.

---

## [𝗔. 𝗘𝘀𝘁𝗶𝗺𝗮𝘁𝗶𝗼𝗻 𝗠𝗼𝗱𝘂𝗹𝗲](https://img.shields.io/badge/LabRI%20Shiny%20Connect-%230070C0?style=for-the-badge&logoColor=white)

This module provides an **adaptive, multi-criteria approach for the indirect estimation** of reference intervals, combining parametric and non-parametric percentile approaches according to the number of clusters in the truncated distribution.

### Adaptive behavior

- **Multi-cluster distributions** — The reference limits estimated by `refineR` and `reflimR` are combined through the **Centroid of Winsorized Reference Limits**: the *Two-stage Winsorization* sub-algorithm first estimates robust winsorized limits, then the *Hartigan–Wong Centroid Reference Limits* sub-algorithm computes the centroid (x = lower limit, y = upper limit) for a centralized, stable estimate. When clusters are sufficiently separated, the EM algorithm further refines the result.
- **Single-cluster distributions** — The EM algorithm applies parametric and non-parametric methods to derive the best reference interval estimate.

### Multi-criteria design

Multiple criteria and methods are combined to ensure robust and comprehensive estimation and verification.

---

## [𝗕. 𝗩𝗲𝗿𝗶𝗳𝗶𝗰𝗮𝘁𝗶𝗼𝗻 𝗠𝗼𝗱𝘂𝗹𝗲](https://img.shields.io/badge/LabRI%20Shiny%20Connect-%230070C0?style=for-the-badge&logoColor=white)

Before routine clinical application — and especially when reference intervals are derived from indirect methods — laboratories must verify their reference intervals. The Verification Module performs a **three-level analysis** to assess whether compared reference limits are equivalent:

1. **First Level — Statistical Uncertainty.** Evaluates the magnitude of statistical uncertainty associated with the reference limits. If uncertainty is within acceptable bounds, the analysis proceeds to the second level.
2. **Second Level — Distance Criterion Based on Equivalence Testing.** Compares the LabRI-estimated reference limit with a comparative limit using equivalence testing to assess whether differences are large enough to be considered relevant from a practical or clinical standpoint.
3. **Third Level — Concordance Evaluation.** Triggered when the second level suggests *Possible Equivalence* or *Probable Equivalence*. Incorporates confidence intervals and applies Fleiss' Kappa, Lin's Concordance Correlation Coefficient, and Flagging Rates to support robust verification.

---

## Development history


LabRI originated as a standalone R Markdown implementation documented in a 2022 MBA in Data Science & Analytics final project at USP/ESALQ. Its early implementations combined statistical procedures in an adaptive EM-based pipeline. The later multi-method consensus framework is shared by the local and Connect implementations. The 2022 and 2023 milestones below describe standalone R Markdown implementations, not cloud releases.

| Milestone | Implementation and documented evolution |
| :--- | :--- |
| **2022 · Original implementation** | R Markdown with HTML reporting; Tukey filtering, adaptive Box–Cox transformation, Gaussian mixture modeling with EM, multicriteria component selection, truncation, and parametric/empirical or nonparametric estimation. The original study compared LabRI with `kosmic` and `refineR` using reference-limit deviations and classification metrics, including Cohen's kappa. These were external comparisons, not a consensus among the three methods. |
| **2023 · R Markdown revision** | Retained the original analytical structure and added exclusion of mixture components with weights at or below 10%, configurable subsampling, explicit random seeds, a corrected skewness alert, and English-language reporting. Both the 2022 and 2023 implementations operated without Shiny. |
| **v5.5.3 · Shared analytical framework and Connect implementation** | Shared adaptive estimation, multi-method consensus, and three-level verification, exposed through the Connect Shiny interface with session-specific temporary outputs. The release-specific bug fix corrects degenerate cumulative BIC-gain profiles in the equal-variance (E) and variable-variance (V) models and adds finite-value filtering and fallback handling for the BIC-plateau mode estimators. The overall multicriteria cluster-selection cascade remains unchanged. |

**Fix in v5.5.3:** when the total positive BIC gain is zero or non-finite, the Pareto and plateau criteria now return one cluster instead of an artificial two-cluster result caused by an undefined `0/0` calculation. This is a correction within those criteria; the complete multicriteria selection cascade still determines the final number of components. See [CHANGELOG.md](CHANGELOG.md#fixed-in-v553) for details.

The Connect implementation executes the analytical workflow through `LabRI_script_connect.Rmd`. Reports are displayed in the Shiny interface and can be downloaded by the user; analytical outputs are not automatically saved to persistent server folders.

This is a summary of documented milestones, rather than a complete list of intermediate revisions. The preserved 2022 and 2023 scripts do not contain explicit application version numbers. Features listed for the current application are not all claimed to have originated in v5.5.3.

See [CHANGELOG.md](CHANGELOG.md) for the documented changes and historical study context. When reproducing published results, use the archived code and settings associated with the publication and record the exact software version used.

---

## 𝗠𝗲𝗺𝗼𝗿𝘆 𝗮𝗻𝗱 𝗰𝗹𝗼𝘂𝗱 𝗹𝗶𝗺𝗶𝘁𝗮𝘁𝗶𝗼𝗻𝘀

The LabRI workflow is computationally demanding (reference interval estimation, mixture modeling, confidence intervals, plotting, and HTML rendering). In low-memory cloud environments — particularly free-tier services such as the public demo — the **final HTML conversion step** often requires more memory than the statistical calculations themselves. Large datasets or reports with many figures, interactive plots, or large HTML tables may therefore exceed the available memory.

If a memory failure occurs during report generation, options include:

- reducing the maximum subsample size;
- using a smaller dataset for demonstration purposes;
- running the **Shiny application for local execution** for larger analyses;
- forking the repository and redeploying on a Posit Connect environment with more RAM or on another cloud platform.

This typically reflects the memory ceiling of the hosting environment, not a defect in the dataset or in the LabRI method.

---

## 𝗧𝘂𝘁𝗼𝗿𝗶𝗮𝗹

A usage tutorial covering the installation of R and RStudio and the operation of the Shiny tool is available on the **Grupo Lab R website**, which centralizes the documentation and supporting materials for the LabRI System and other tools developed by the group.

<div align="center">

### 👇 **Click here to visit the Grupo Lab R website** 👇

<a href="https://grupolabr.com/" target="_blank">
  <img src="https://img.shields.io/badge/Visit%20Grupo%20Lab%20R%20Website-%23009C3B?style=for-the-badge&logo=google-chrome&logoColor=%23009C3B&labelColor=%23FFDF00" alt="Grupo Lab R Website" style="height: 50px;">
</a>

</div>

---

## [𝗖𝗼𝗻𝘁𝗮𝗰𝘁](https://img.shields.io/badge/LabRI%20Shiny%20Connect-%230070C0?style=for-the-badge&logoColor=white)

**Submit suggestions and bugs at:**  
https://github.com/labrgrupo/LabRI_shiny_connect/issues

**Email:**  
alancdias@hotmail.com · labrgrupo@gmail.com

**Link to the publication:**  

---

## 𝗟𝗶𝗰𝗲𝗻𝘀𝗲

Distributed under the **GPL-3.0** license.

---
