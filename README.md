# [𝗟𝗮𝗯𝗥𝗜 𝗦𝗵𝗶𝗻𝘆 𝗖𝗼𝗻𝗻𝗲𝗰𝘁](https://img.shields.io/badge/LabRI%20Shiny%20Connect-%230070C0?style=for-the-badge&logoColor=white)

![](https://img.shields.io/github/license/labrgrupo/LabRI_shiny_connect.svg)
![](https://img.shields.io/github/last-commit/labrgrupo/LabRI_shiny_connect/main.svg)

<img src="www/Logo.svg" width="350px" height="250px" align="right"/>

The **LabRI Shiny Connect** application is designed for the estimation and verification of reference intervals in clinical laboratories. This repository contains the cloud-ready version of the LabRI Shiny application, adapted for deployment in environments such as **Posit Connect**, **Posit Cloud**, or institutional Shiny servers.

This version preserves the analytical structure of the LabRI method while adapting the application behavior for cloud execution. In contrast to the local/zipped version of the LabRI Shiny Application, **LabRI_shiny_connect does not automatically save figures, spreadsheets, intermediate files, `.RData`, `.Rhistory`, or HTML reports into local output folders on the server**.

This repository includes three key components:

- **app.R**: Launches the Shiny application, providing an intuitive graphical interface to execute the LabRI method interactively in a cloud-compatible environment.
- **LabRI_script_connect.Rmd**: The primary analytical script that implements the `LabRI method`, responsible for estimating and verifying reference intervals and producing comprehensive HTML reports during the Shiny session.
- **www/**: Contains the static files required by the Shiny interface, such as the LabRI logo and interface images.

Depending on the deployment strategy, the repository may also include files such as `manifest.json`, `renv.lock`, or other dependency-management files required by Posit Connect or Posit Cloud.

---

## 𝗪𝗵𝗮𝘁 𝗺𝗮𝗸𝗲𝘀 𝗟𝗮𝗯𝗥𝗜_𝘀𝗵𝗶𝗻𝘆_𝗰𝗼𝗻𝗻𝗲𝗰𝘁 𝗱𝗶𝗳𝗳𝗲𝗿𝗲𝗻𝘁?

The main difference between **LabRI_shiny_connect** and the local/zipped version of the LabRI Shiny Application is the way outputs are handled.

The local/zipped version was designed to run on the user's computer. In that environment, the application can automatically create output folders and save files such as:

```r
3_Outputs/Figures/
3_Outputs/Spreadsheets/
4_Report_HTML/
LabRI Posit Connect Cloud
