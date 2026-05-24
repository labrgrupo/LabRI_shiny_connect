# [𝗟𝗮𝗯𝗥𝗜 𝗦𝗵𝗶𝗻𝘆 𝗖𝗼𝗻𝗻𝗲𝗰𝘁](https://img.shields.io/badge/LabRI%20Shiny%20Connect-%230070C0?style=for-the-badge&logoColor=white)

![](https://img.shields.io/github/license/labrgrupo/LabRI_shiny_connect.svg)
![](https://img.shields.io/github/last-commit/labrgrupo/LabRI_shiny_connect/main.svg)

<img src="www/Logo.svg" width="350px" height="250px" align="right"/>

The **LabRI Shiny Connect** application is designed for the estimation and verification of reference intervals in clinical laboratories. This repository contains the cloud-ready implementation of the LabRI Shiny Application, adapted for deployment in environments such as **Posit Connect**, **Posit Cloud**, or institutional Shiny servers. A **public demonstration** of the application is currently hosted on **Posit Connect Cloud** and can be accessed directly from the browser, without any local installation of R or RStudio.

This implementation preserves the analytical structure of the **LabRI method**, while adapting the application behavior for cloud execution. In contrast to the **compressed local distribution** of the LabRI Shiny Application, **LabRI_shiny_connect does not automatically save figures, spreadsheets, intermediate files, `.RData`, `.Rhistory`, or HTML reports into persistent local output folders on the server**.

This repository includes three key components:

- **app.R**: Launches the Shiny application, providing an interactive graphical interface for executing the LabRI method in a cloud-compatible environment.
- **LabRI_script_connect.Rmd**: The primary analytical script that implements the `LabRI method`, responsible for estimating and verifying reference intervals and producing comprehensive HTML reports during the Shiny session.
- **www/**: Contains the static files required by the Shiny interface, such as the LabRI logo and interface images.

Depending on the deployment strategy, this repository may also include files such as `manifest.json`, `renv.lock`, or other dependency-management files required by Posit Connect or Posit Cloud.

---

## 🌐 𝗟𝗶𝘃𝗲 𝗱𝗲𝗺𝗼𝗻𝘀𝘁𝗿𝗮𝘁𝗶𝗼𝗻 𝗼𝗻 𝗣𝗼𝘀𝗶𝘁 𝗖𝗼𝗻𝗻𝗲𝗰𝘁 𝗖𝗹𝗼𝘂𝗱

To illustrate how the LabRI Shiny Connect application can be made available as a cloud service, a public deployment is hosted on **Posit Connect Cloud**. This deployment is offered as a **demonstration instance**, allowing prospective users to interact with the LabRI method directly from a web browser before considering institutional deployment or local installation.

<div align="center">

### 👇 **Click here to access the LabRI Shiny Connect live demo** 👇

<a href="https://labrgroup-labri.share.connect.posit.cloud/" target="_blank">
  <img src="https://img.shields.io/badge/Launch%20LabRI%20Demo-%230070C0?style=for-the-badge&logo=posit&logoColor=white" alt="LabRI Live Demo" style="height: 50px;">
</a>

</div>

The demonstration instance runs on the **Posit Connect Cloud Free plan**, which provides only limited computational resources: **4 GB of memory**, **1 CPU**, **20 monthly active hours**, and a maximum of 5 hosted applications. Because of these constraints, the public demo may exhibit **instability**, slower response times, or memory-related failures, particularly when processing **large datasets** or generating **HTML reports with many figures**. The instance is therefore intended **exclusively as a showcase** of the LabRI method in a cloud environment — **not as a production system** for routine analytical use or for processing sensitive laboratory data.

For more demanding workflows or institutional use, users and organizations are encouraged to deploy their **own instance** of LabRI Shiny Connect. The recommended GitHub workflow is to **fork** the official repository — that is, to create a personal copy of the repository under the user's own GitHub account, which can then be freely modified, redeployed, and kept synchronized with the original project.

🔗 **Official repository to fork:** [https://github.com/labrgrupo/LabRI_shiny_connect](https://github.com/labrgrupo/LabRI_shiny_connect)

Starting from a forked copy, users can:

- **Deploy on Posit Connect Cloud** using paid tiers, with higher memory and CPU allocations and greater monthly availability.
- **Deploy on a self-hosted Posit Connect server** or on an institutional Shiny Server.
- **Adapt `LabRI_script_connect.Rmd` and `app.R`** for deployment on other cloud platforms such as **shinyapps.io**, **AWS**, **Azure**, **Google Cloud Run**, **Hugging Face Spaces**, or **Docker-based** environments.
- **Customize the application** to integrate with internal authentication, institutional branding, or laboratory-specific workflows, subject to the terms of the GPL-3.0 license.

This fork-and-deploy workflow ensures that each institution retains **full control over its data, computational resources, and customization**, while still benefiting from updates released in the official LabRI Shiny Connect repository.

---

## 𝗪𝗵𝗮𝘁 𝗺𝗮𝗸𝗲𝘀 𝗟𝗮𝗯𝗥𝗜_𝘀𝗵𝗶𝗻𝘆_𝗰𝗼𝗻𝗻𝗲𝗰𝘁 𝗱𝗶𝗳𝗳𝗲𝗿𝗲𝗻𝘁?

Whether running on the public demonstration instance or on a forked, institutionally deployed version, the main difference between **LabRI_shiny_connect** and the **Shiny application for local execution** is the output-management strategy.

The local implementation was designed to run on the user's computer after prior installation of R and RStudio. In this configuration, the application source code is made available through GitHub or as a compressed local distribution, allowing users to run the LabRI Shiny Application locally and providing greater flexibility for those familiar with the R environment.

In the local execution modality, the application can automatically create output folders and save files such as:

```r
3_Outputs/Figures/
3_Outputs/Spreadsheets/
4_Report_HTML/
```

This behavior is appropriate for a local desktop-like workflow because the user can directly access generated figures, spreadsheets, intermediate files, and HTML reports from the local folder structure.

However, this approach is not appropriate for a cloud-hosted Shiny application. In a cloud environment, multiple users may access the same deployed application, and the application should not automatically create persistent user-specific files inside the server directory.

Therefore, **LabRI_shiny_connect was adapted to operate in a cloud-compatible, session-based mode**.

In this implementation:

- Figures are generated and displayed in the Shiny interface or HTML report, but are not automatically saved as `.jpeg`, `.png`, or other image files.
- Tables are rendered directly as HTML, `kableExtra`, or `DT` objects, but are not automatically exported as spreadsheets.
- The HTML report is generated in a temporary session file only when required for rendering inside the Shiny application.
- No fixed output folders such as `3_Outputs/` or `4_Report_HTML/` are created automatically.
- No `.RData`, `.Rhistory`, or saved parameter `.Rds` files are written to the application directory.
- The user can view the complete report in the browser and, if enabled, download the final HTML report manually.

In practical terms, **the analytical method remains the same**, but the output architecture is different.

| Feature | Shiny application for local execution / compressed local distribution | LabRI_shiny_connect |
|---|---:|---:|
| Runs on the user's computer | Yes | Optional |
| Requires prior installation of R and RStudio | Yes | No for end users in a deployed cloud environment |
| Designed for Posit Connect / Posit Cloud | No | Yes |
| Automatically creates output folders | Yes | No |
| Automatically saves figures | Yes | No |
| Automatically saves spreadsheets | Yes | No |
| Automatically saves HTML reports to fixed folders | Yes | No |
| Saves `.RData` / `.Rhistory` | Possible | No |
| Uses temporary files only when required for session rendering | No | Yes |
| Displays report in the Shiny interface | Yes | Yes |
| Allows browser-based use without local execution | No | Yes |

This makes **LabRI_shiny_connect** the preferred implementation for institutional deployment, cloud-based demonstrations, training environments, and multi-user access.

---

## 𝗨𝘀𝗲𝗿 𝗶𝗻𝘁𝗲𝗿𝗳𝗮𝗰𝗲

The image below provides an example of the initial interface of the **LabRI Shiny Connect** application, demonstrating how users configure essential parameters for data analysis.

The **Name of the Responsible Specialist** section captures the analyst's name, while the **Define the Dataset** section allows users to upload a `.csv`, `.xls`, or `.xlsx` file and select the relevant data column. A status bar indicates the system's progress during processing. This streamlined interface supports intuitive navigation and efficient setup for reference interval estimation and verification.

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

  - For **multi-cluster distributions**, the Centroid of Winsorized Reference Limits is applied to the reference limits estimated by `refineR` and `reflimR`. This involves a two-stage process: first, the Two-stage Winsorization sub-algorithm estimates the winsorized reference limits, adding robustness against extreme values. Next, the Hartigan-Wong Centroid Reference Limits sub-algorithm calculates the centroid, with the x and y coordinates representing the lower and upper reference limits, respectively, yielding a centralized and stable estimate. When clusters are sufficiently distant from each other, the EM algorithm is also incorporated to further refine the reference interval estimate.

  - For **single-cluster distributions**, the EM algorithm applies parametric and non-parametric methods to derive the best reference interval estimate.

- **Multi-criteria**:

  - Incorporates multiple criteria and methods for robust and comprehensive estimation and verification of reference intervals.

---

## [𝗕. 𝗩𝗲𝗿𝗶𝗳𝗶𝗰𝗮𝘁𝗶𝗼𝗻 𝗠𝗼𝗱𝘂𝗹𝗲](https://img.shields.io/badge/LabRI%20Shiny%20Connect-%230070C0?style=for-the-badge&logoColor=white)

To ensure reliability in clinical practice, laboratories must verify their reference intervals before routine application. This verification is especially important for reference intervals derived through indirect methods.

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
  - This level incorporates confidence intervals and uses Fleiss' Kappa, Lin's Concordance Correlation Coefficient, and Flagging Rates to support robust verification.

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

The LabRI workflow can be computationally demanding because it performs reference interval estimation, mixture modeling, confidence interval estimation, graphical rendering, and report generation. These limitations are particularly relevant for the **public demonstration instance** described above, which runs on the Posit Connect Cloud Free plan with only 4 GB of memory and 1 CPU.

In low-memory cloud environments, especially free-tier services, the final HTML report conversion step may require more memory than the statistical calculations themselves. For this reason, very large datasets or reports containing many figures, interactive plots, or large HTML tables may exceed the available memory.

If a memory limitation occurs during report generation, users are advised to:

- reduce the maximum subsample size;
- use a smaller dataset for cloud demonstration purposes;
- use the Shiny application for local execution for larger analyses;
- fork the repository and deploy the application in a Posit Connect environment with more RAM, or on an alternative cloud platform of their choice.

This does not necessarily indicate a problem with the dataset or with the LabRI method. It usually reflects the memory limit of the cloud environment used to render the HTML report.

---

## 𝗧𝘂𝘁𝗼𝗿𝗶𝗮𝗹

A simple usage tutorial, covering the installation of R and RStudio and instructions for using the Shiny tool, can be found on the **Grupo Lab R website**:

<div align="center">

### 👇 **Click here to access the LabRI Tutorial** 👇

<a href="https://grupolabr.com/LabRI_Packed.html" target="_blank">
  <img src="https://img.shields.io/badge/Site LabR Group -%233ccd96?style=for-the-badge&logo=google-chrome&logoColor=%230d02b4&labelColor=%23fee21d" alt="LabRI Tutorial" style="height: 50px;">
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
