# generate_manifest.R
# Cria manifest_packages.R, ajusta app.R e LabRI_script_connect.Rmd, e gera manifest.json

required_pkgs <- c(
  "AID", "callr", "calibrate", "cartography", "cluster", "data.table",
  "datawizard", "devtools", "digest", "dplyr", "DT", "epiR", "factoextra",
  "FactoMineR", "ffp", "forecast", "future.apply", "ggplot2", "ggpubr",
  "ggtext", "grid", "gt", "imputeTS", "installr", "irr", "janitor",
  "kableExtra", "KernSmooth", "knitr", "lattice", "lubridate", "MASS",
  "matrixStats", "mclust", "MethComp", "mixR", "modeest", "moments",
  "multimode", "multiway", "nortest", "openxlsx", "pandoc", "patchwork",
  "plotly", "prettydoc", "qqplotr", "readr", "readxl", "refineR",
  "reflimR", "rmarkdown", "RVAideMemoire", "scales", "shiny", "shinyjs",
  "shinythemes", "stats", "stringi", "systemfonts", "tidyr", "tools",
  "univOutl", "utf8", "writexl", "xfun", "zlog"
)

app_file <- "app.R"
rmd_file <- "LabRI_script_connect.Rmd"
manifest_pkgs_file <- "manifest_packages.R"
manifest_file <- "manifest.json"

source_line <- 'source("manifest_packages.R", local = TRUE)'

stop_with <- function(...) stop(..., call. = FALSE)

backup_file <- function(path) {
  if (file.exists(path)) {
    backup <- paste0(path, ".bak_manifest")
    ok <- file.copy(path, backup, overwrite = TRUE)
    if (!ok) stop_with("Falha ao criar backup de: ", path)
    message("Backup criado: ", backup)
  }
}

write_manifest_packages_file <- function(pkgs, out_file) {
  lines <- c(
    "suppressPackageStartupMessages({",
    paste0("  library(", pkgs, ")"),
    "})",
    ""
  )
  writeLines(lines, out_file, useBytes = TRUE)
  message("Arquivo criado/atualizado: ", out_file)
}

prepend_source_to_app <- function(path, source_stmt) {
  if (!file.exists(path)) stop_with("Não encontrei ", path)
  
  txt <- readLines(path, warn = FALSE, encoding = "UTF-8")
  if (any(grepl('source\\("manifest_packages\\.R",\\s*local\\s*=\\s*TRUE\\)', txt))) {
    message(path, " já contém a linha de source.")
    return(invisible(FALSE))
  }
  
  backup_file(path)
  
  new_txt <- c(
    source_stmt,
    "",
    txt
  )
  
  writeLines(new_txt, path, useBytes = TRUE)
  message("Linha de source adicionada no topo de ", path)
  invisible(TRUE)
}

inject_source_into_rmd <- function(path, source_stmt) {
  if (!file.exists(path)) stop_with("Não encontrei ", path)
  
  txt <- readLines(path, warn = FALSE, encoding = "UTF-8")
  
  if (any(grepl('source\\("manifest_packages\\.R",\\s*local\\s*=\\s*TRUE\\)', txt))) {
    message(path, " já contém a linha de source.")
    return(invisible(FALSE))
  }
  
  backup_file(path)
  
  setup_start <- grep("^```\\{r[^}]*setup[^}]*\\}", txt)
  if (length(setup_start) > 0) {
    start <- setup_start[1]
    end_rel <- grep("^```\\s*$", txt[(start + 1):length(txt)])
    if (length(end_rel) > 0) {
      end <- start + end_rel[1]
      insert_at <- start + 1
      new_txt <- append(txt, values = source_stmt, after = insert_at - 1)
      writeLines(new_txt, path, useBytes = TRUE)
      message("Linha de source inserida no chunk setup de ", path)
      return(invisible(TRUE))
    }
  }
  
  setup_chunk <- c(
    "```{r setup, include=FALSE}",
    source_stmt,
    "knitr::opts_chunk$set(echo = FALSE, warning = FALSE, message = FALSE)",
    "```",
    ""
  )
  
  new_txt <- c(setup_chunk, txt)
  writeLines(new_txt, path, useBytes = TRUE)
  message("Chunk setup criado no topo de ", path)
  invisible(TRUE)
}

check_required_files <- function() {
  if (!file.exists(app_file)) stop_with("Não encontrei '", app_file, "' no diretório atual.")
  if (!file.exists(rmd_file)) stop_with("Não encontrei '", rmd_file, "' no diretório atual.")
}

check_installed_packages <- function(pkgs) {
  missing_pkgs <- pkgs[!vapply(pkgs, requireNamespace, quietly = TRUE, FUN.VALUE = logical(1))]
  if (length(missing_pkgs) > 0) {
    stop_with(
      "Instale estes pacotes localmente antes de gerar o manifest.json:\n- ",
      paste(missing_pkgs, collapse = "\n- ")
    )
  }
}

check_rsconnect <- function() {
  if (!requireNamespace("rsconnect", quietly = TRUE)) {
    stop_with("O pacote 'rsconnect' não está instalado. Rode localmente: install.packages('rsconnect')")
  }
}

generate_manifest <- function() {
  check_required_files()
  check_rsconnect()
  check_installed_packages(required_pkgs)
  
  write_manifest_packages_file(required_pkgs, manifest_pkgs_file)
  prepend_source_to_app(app_file, source_line)
  inject_source_into_rmd(rmd_file, source_line)
  
  rsconnect::writeManifest(
    appDir = getwd(),
    appPrimaryDoc = app_file,
    appMode = "shiny",
    quiet = FALSE
  )
  
  if (!file.exists(manifest_file)) {
    stop_with("Algo falhou: o arquivo 'manifest.json' não foi criado.")
  }
  
  message("")
  message("Processo concluído com sucesso.")
  message("Arquivos principais no diretório:")
  message("- ", normalizePath(app_file, winslash = "/", mustWork = TRUE))
  message("- ", normalizePath(rmd_file, winslash = "/", mustWork = TRUE))
  message("- ", normalizePath(manifest_pkgs_file, winslash = "/", mustWork = TRUE))
  message("- ", normalizePath(manifest_file, winslash = "/", mustWork = TRUE))
  message("")
  message("Backups criados com sufixo: .bak_manifest")
}

generate_manifest()