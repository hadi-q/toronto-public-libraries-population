# Mapping Toronto's Libraries, Part 2: Understanding the Relationship Between Income and Library Locations

## Overview

These are the files needed to build the report, *Mapping Toronto's Libraries, Part 2: Understanding the Relationship Between Income and Library Locations*. The report analyzes the Library Branch General Information dataset from Open Data Toronto, and adds additional insights from StatCan data about incomes and other variables at a neighbourhood or census tract level. The goal of this paper is to build on the original paper's analysis to determine whether there is a correlation between a neighbourhood's income and its accessibility to Toronto Public Library branches.

## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from OpenDataToronto and StatCan.
-   `data/analysis_data` contains the cleaned datasets that were constructed.
-   `other` contains sketches that were created to plan out the graphs and charts constructed as well as information on LLM usage.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.

## How to Run

- Run ``scripts/00-simulate_data.R`` to simulate envisioned data
- Run ``scripts/01-download_data.R`` to download raw data from opendatatoronto (data from StatCan downloaded separately from their website GUI)
- Run scripts/02-data_cleaning.R to generate cleaned data (note: the script to clean StatCan data is not working as of 04/24/24; please use ``analysis_data_census.csv`` from ``data/analysis_data``)
- Render outputs/paper/paper.qmd to generate the PDF of the paper

## Statement on LLM usage

ChatGPT v3.5 was used to help generate code to extract and clean data. See full transcripts of prompts and responses in ``other/llm``.