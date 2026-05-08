# [𝗟𝗮𝗯𝗥𝗜 𝗦𝗵𝗶𝗻𝘆 𝗖𝗼𝗻𝗻𝗲𝗰𝘁](https://img.shields.io/badge/LabRI%20Shiny%20Connect-%230070C0?style=for-the-badge&logoColor=white)

![](https://img.shields.io/github/license/labrgrupo/LabRI_shiny_connect.svg)
![](https://img.shields.io/github/last-commit/labrgrupo/LabRI_shiny_connect/main.svg)

<img src="www/Logo.svg" width="350px" height="250px" align="right"/>

The **LabRI Shiny Connect** application is designed for the estimation and verification of reference intervals in clinical laboratories. This repository contains the cloud-ready version of the LabRI Shiny Application, adapted for deployment in environments such as **Posit Connect**, **Posit Cloud**, or institutional Shiny servers.

The application preserves the analytical structure of the **LabRI method**, while adapting the way outputs are handled for cloud execution. In contrast to the local/zipped version of the LabRI Shiny Application, **LabRI_shiny_connect does not automatically save figures, spreadsheets, intermediate files, `.RData`, `.Rhistory`, or HTML reports into local output folders on the server**.

This repository includes three key components:

- **app.R**: Launches the Shiny application, providing an intuitive graphical interface to execute the LabRI method interactively in a cloud-compatible environment.
- **LabRI_script_connect.Rmd**: The primary analytical script that implements the `LabRI method`, responsible for estimating and verifying reference intervals and producing comprehensive HTML reports during the Shiny session.
- **www/**: Contains the static files required by the Shiny interface, such as the LabRI logo and interface images.

Depending on the deployment strategy, this repository may also include files such as `manifest.json`, `renv.lock`, or other dependency-management files required by Posit Connect or Posit Cloud.

---

## 𝗪𝗵𝗮𝘁 𝗺𝗮𝗸𝗲𝘀 𝗟𝗮𝗯𝗥𝗜_𝘀𝗵𝗶𝗻𝘆_𝗰𝗼𝗻𝗻𝗲𝗰𝘁 𝗱𝗶𝗳𝗳𝗲𝗿𝗲𝗻𝘁?

The main difference between **LabRI_shiny_connect** and the local/zipped version of the LabRI Shiny Application is the way outputs are handled.

The local/zipped version was designed to run on the user's computer. In that environment, the application can automatically create output folders and save files such as:

```r
3_Outputs/Figures/
3_Outputs/Spreadsheets/
4_Report_HTML/
```

This local behavior is useful when the tool is used as a desktop-like application because the user can directly access generated figures, spreadsheets, intermediate files, and HTML reports from the local folder structure.

However, this behavior is not appropriate for a cloud-hosted Shiny application. In a cloud environment, multiple users may access the same deployed app, and the application should not automatically create persistent user-specific files inside the server directory.

Therefore, **LabRI_shiny_connect was adapted to operate in a cloud/session-based mode**.

In this version:

- Figures are generated and displayed in the Shiny interface or HTML report, but are not automatically saved as `.jpeg`, `.png`, or other image files.
- Tables are rendered directly as HTML, `kableExtra`, or `DT` objects, but are not automatically exported as spreadsheets.
- The HTML report is generated in a temporary session file only when needed for rendering inside the Shiny app.
- No fixed output folders such as `3_Outputs/` or `4_Report_HTML/` are created automatically.
- No `.RData`, `.Rhistory`, or saved parameter `.Rds` files are written to the application directory.
- The user can view the complete report in the browser and, if enabled, download the final HTML report manually.

In practical terms, **the analytical method remains the same**, but the output strategy is different.

| Feature | Local/Zipped LabRI Shiny Application | LabRI_shiny_connect |
|---|---:|---:|
| Runs locally on the user's computer | Yes | Optional |
| Designed for Posit Connect / Posit Cloud | No | Yes |
| Automatically creates output folders | Yes | No |
| Automatically saves figures | Yes | No |
| Automatically saves spreadsheets | Yes | No |
| Automatically saves HTML report to a fixed folder | Yes | No |
| Saves `.RData` / `.Rhistory` | Possible | No |
| Uses temporary files only when required for session rendering | No | Yes |
| Displays report in the Shiny interface | Yes | Yes |
| Allows browser-based use | Limited | Yes |

This makes **LabRI_shiny_connect** the preferred version for institutional deployment, cloud-based demonstrations, training environments, and multi-user access.

---

## 𝗟𝗮𝗯𝗥𝗜 𝗣𝗼𝘀𝗶𝘁 𝗖𝗼𝗻𝗻𝗲𝗰𝘁 𝗖𝗹𝗼𝘂𝗱

**LabRI Posit Connect Cloud** refers to the deployment-oriented version of the LabRI Shiny Application prepared for cloud execution through Posit infrastructure.

The objective of this version is to make the LabRI method available through a browser-based interface without requiring the user to download, unzip, configure, or run a local application package.

This version is particularly useful for:

- cloud-based demonstration of the LabRI method;
- training and educational use;
- institutional access through Posit Connect;
- controlled use by laboratories, research groups, or scientific societies;
- environments where local installation is not desirable or not feasible.

Because cloud environments may have memory limitations, especially in free-tier deployments, large analyses may require either a reduced maximum subsample size or a Posit Connect environment with higher RAM availability. The cloud version is optimized to avoid unnecessary server-side file persistence, but the analytical workflow can still be computationally demanding for large datasets and complex reports.

---

## 𝗨𝘀𝗲𝗿 𝗶𝗻𝘁𝗲𝗿𝗳𝗮𝗰𝗲

The image below provides an example of the initial interface of the **LabRI Shiny Connect** application, demonstrating how users configure essential parameters for data analysis.

The **Name of the Responsible Specialist** section captures the analyst's name, while the **Define the Dataset** section allows users to upload a `.csv`, `.xls`, or `.xlsx` file and select the relevant data column. A status bar indicates the system's progress during processing. This streamlined interface ensures intuitive navigation and efficient setup for reference interval estimation and verification.

<img src="www/Interface_Shiny.png" width="800px" height="400px"/>

---

## 𝗧𝗵𝗲 𝗟𝗮𝗯𝗥𝗜 𝗠𝗲𝘁𝗵𝗼𝗱

The **LabRI Method** is a core component of the **LabRI System**, serving as the analytical backbone for the estimation and verification of reference intervals in laboratory data. It comprises a set of algorithms, sub-algorithms, and mathematical procedures implemented primarily in the **LabRI_script_connect.Rmd** file.

**The LabRI Method is structured into two main modules:**

- **Estimation Module**: Focuses on adaptive, multi-criteria estimation of reference intervals through data cleaning, transformation, and clustering techniques, utilizing algorithms such as `refineR` and `reflimR`, available in the R packages `refineR` and `reflimR`, respectively, along with the Expectation-Maximization (EM) algorithm, supported by packages such as `mclust` and `mixR`.

- **Verification Module**: Ensures the validity of estimated reference intervals through a three-level analysis, which evaluates statistical uncertainty, equivalence, and concordance, making the intervals reliable for clinical application.

---

## [𝗔. 𝗘𝘀𝘁𝗶𝗺𝗮𝘁𝗶𝗼𝗻 𝗠𝗼𝗱𝘂𝗹𝗲](https://img.shields.io/badge/LabRI%20Shiny%20Connect-%230070C0?style=for-the-badge&logoColor=white)

The **LabRI method** provides an adaptive and multi-criteria approach for the **indirect estimation** of reference intervals. This module integrates data cleaning, transformation, and clustering techniques, utilizing the `refineR`, `reflimR`, and **EM algorithms**. By combining **parametric and non-parametric percentile** approaches, the method estimates population reference intervals based on the number of clusters in the truncated distribution.

### Characteristics of the LabRI Method

- **Adaptive**:

  - Adjusts dynamically based on data structure and characteristics, applying appropriate cleaning and transformation techniques.

  - For **multi-cluster distributions**, the Centroid of Windsorized Reference Limits is applied to the reference limits estimated by `refineR` and `reflimR`. This involves a two-stage process: first, the Two-stage Winsorization sub-algorithm estimates the winsorized reference limits, adding robustness against extreme values. Next, the Hartigan-Wong Centroid Reference Limits sub-algorithm calculates the centroid, with the x and y coordinates representing the lower and upper reference limits, respectively, yielding a centralized and stable estimate. When clusters are sufficiently distant from each other, the EM algorithm is also incorporated to further refine the reference interval estimate.

  - For **single-cluster distributions**, the EM algorithm applies parametric and non-parametric methods to derive the best reference interval estimate.

- **Multi-criteria**:

  - Incorporates multiple criteria and methods for robust and comprehensive estimation and verification of reference intervals.

---

## [𝗕. 𝗩𝗲𝗿𝗶𝗳𝗶𝗰𝗮𝘁𝗶𝗼𝗻 𝗠𝗼𝗱𝘂𝗹𝗲](https://img.shields.io/badge/LabRI%20Shiny%20Connect-%230070C0?style=for-the-badge&logoColor=white)

To ensure reliability in clinical practice, it is crucial for laboratories to verify their reference intervals (RIs) before routine application. This verification is especially important for RIs derived through indirect methods.

### Structure of the Verification Module

The **Verification Module** performs a **three-level analysis** to assess whether the compared reference limits are equivalent:

1. **First-Level Analysis ~ Statistical Uncertainty**  
   Assesses the magnitude of statistical uncertainty in the reference limits.

2. **Second-Level Analysis ~ Distance Criterion Based on Equivalence Testing**  
   Compares the LabRI-estimated reference limit with a comparative limit to evaluate practical significance.

3. **Third-Level Analysis ~ Concordance Evaluation**  
   Evaluates concordance using tests such as Fleiss' Kappa, Lin's Concordance Correlation Coefficient, and Flagging Rates.

### Details of the Three-Level Analysis

- **First-Level Analysis**:

  - Evaluates statistical uncertainty associated with reference limits.
  - If uncertainty is within acceptable bounds, the analysis proceeds to the second level.

- **Second-Level Analysis**:

  - Compares the LabRI reference limit with a comparative reference limit using equivalence testing to assess practical significance.
  - This level evaluates whether differences between reference limits are large enough to be considered relevant from a practical or clinical standpoint.

- **Third-Level Analysis**:

  - Conducted if the second-level analysis suggests **Possible Equivalence** or **Probable Equivalence**.
  - This level incorporates confidence intervals and uses Fleiss' Kappa, Lin's Concordance Correlation Coefficient, and Flagging Rates to ensure robust verification.

---

## 𝗖𝗹𝗼𝘂𝗱 𝗱𝗲𝗽𝗹𝗼𝘆𝗺𝗲𝗻𝘁 𝗹𝗼𝗴𝗶𝗰

The cloud version of LabRI was designed to avoid server-side accumulation of files. This is important because web applications may be accessed by multiple users, and each user may upload different datasets and generate different reports.

In **LabRI_shiny_connect**, output generation follows this principle:

```text
Render in the browser whenever possible.
Use temporary files only when required by R Markdown.
Avoid persistent automatic exports to server folders.
Allow user-controlled download only when appropriate.
```

This design makes the tool more suitable for:

- Posit Connect deployment;
- Posit Cloud testing;
- institutional Shiny servers;
- multi-user access;
- cloud-based demonstrations;
- training and educational use;
- controlled deployment by scientific societies, laboratories, or research groups.

---

## 𝗥𝗲𝗽𝗼𝗿𝘁 𝗴𝗲𝗻𝗲𝗿𝗮𝘁𝗶𝗼𝗻

The HTML report is generated through `rmarkdown::render()`. Because R Markdown requires a physical HTML file to be produced before it can be displayed, **LabRI_shiny_connect uses a temporary session file**.

This temporary file is used only to render the report inside the Shiny interface. It is not automatically copied to a fixed output folder.

Therefore, the difference is:

```text
Temporary HTML file required for Shiny rendering: retained
Persistent HTML export to a fixed folder: removed
```

This approach preserves the complete HTML report while avoiding unnecessary server-side file persistence.

---

## 𝗠𝗲𝗺𝗼𝗿𝘆 𝗮𝗻𝗱 𝗰𝗹𝗼𝘂𝗱 𝗹𝗶𝗺𝗶𝘁𝗮𝘁𝗶𝗼𝗻𝘀

The LabRI workflow can be computationally demanding because it performs reference interval estimation, mixture modeling, confidence interval estimation, graphical rendering, and report generation.

In low-memory cloud environments, especially free-tier services, the final HTML report conversion step may require more memory than the statistical calculations themselves. For this reason, very large datasets or reports containing many figures, interactive plots, or large HTML tables may exceed the available memory.

If memory limitation occurs during report generation, users are advised to:

- reduce the maximum subsample size;
- use a smaller dataset for cloud demonstration purposes;
- use the local/zipped version of LabRI for larger analyses;
- deploy the application in a Posit Connect environment with more RAM.

This does not necessarily indicate a problem with the dataset or with the LabRI method. It usually reflects the memory limit of the cloud environment used to render the HTML report.

---

## 𝗧𝘂𝘁𝗼𝗿𝗶𝗮𝗹

A simple usage tutorial, covering the installation of R and RStudio and instructions for using the Shiny tool, can be found on the **Grupo Lab R website**:

<div align="center">

### 👇 **Click here to access the LabRI Tutorial** 👇

<a href="https://grupolabr.com/LabRI_Packed.html" target="_blank">
  <img src="https://img.shields.io/badge/Site LabR Group - LabRI tool Tutorial -%233ccd96?style=for-the-badge&logo=google-chrome&logoColor=%230d02b4&labelColor=%23fee21d" alt="LabRI Tutorial" style="height: 50px;">
</a>

</div>

---

## [𝗖𝗼𝗻𝘁𝗮𝗰𝘁](https://img.shields.io/badge/LabRI%20Shiny%20Connect-%230070C0?style=for-the-badge&logoColor=white)

You are welcome to:

**Submit suggestions and bugs at:**  
https://github.com/labrgrupo/LabRI_shiny_connect/issues

**Write an email with any questions and problems to:**  
alancdias@hotmail.com or labrgrupo@gmail.com

**Link to the publication:**  

---

## 𝗟𝗶𝗰𝗲𝗻𝘀𝗲

This project is distributed under the GPL-3.0 license.

---
