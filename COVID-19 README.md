# COVID-19 Data Analysis Project

Welcome to the COVID-19 Data Analysis project, focused on cleaning, transforming, and analyzing global COVID-19 case, death, and vaccination data. This project utilizes SQL queries to explore critical trends such as infection rates, death rates, and vaccination progress across different countries and continents.

## Table of Contents
- [Introduction](#introduction)
- [Data Source](#data-source)
- [Objectives](#objectives)
- [Methodology](#methodology)
- [Key Questions Addressed](#key-questions-addressed)
- [Conclusion](#conclusion)

## Introduction

COVID-19 had a significant global impact, and analyzing the data collected throughout the pandemic can reveal important insights into its spread and the responses to it. This project focuses on exploring case trends, death percentages, infection rates per population, and vaccination rollouts using SQL.

## Data Source

The data used in this analysis comes from the [Our World in Data COVID-19 dataset](https://ourworldindata.org/coronavirus), which includes daily updates on cases, deaths, population, and vaccinations.

## Objectives

- Understand the relationship between total cases and total deaths to assess the risk of mortality from infection.
- Analyze what percentage of a country’s population was infected.
- Identify countries and continents with the highest death counts and infection rates.
- Examine global COVID-19 trends over time.
- Track vaccination progress and determine what percentage of the population is vaccinated.

## Methodology

1. **Filtering and Cleaning:**
   - Removed rows where the "continent" field was null to ensure we're working with country-level data.

2. **Case and Death Analysis:**
   - Calculated death percentages by comparing total deaths to total cases.
   - Assessed infection rates by comparing total cases to population size.

3. **Aggregation:**
   - Grouped data by countries and continents to identify maximum infection and death counts.

4. **Global Summary:**
   - Summarized total new cases, total new deaths, and calculated global death percentage.

5. **Vaccination Progress:**
   - Used window functions to compute cumulative vaccinations over time.
   - Created a CTE and temporary table for population-vaccination percentage calculations.

6. **View Creation:**
   - Created a SQL view to store and reuse vaccination percentage data for visualization purposes.

## Key Questions Addressed

1. **What is the likelihood of dying if you contract COVID-19?**
   - Calculated by `(total_deaths / total_cases) * 100`.

2. **What percentage of the population got infected?**
   - Calculated by `(total_cases / population) * 100`.

3. **Which countries had the highest infection and death rates?**
   - Identified countries with the highest total cases and deaths relative to their populations.

4. **Which continent had the highest death count?**
   - Aggregated death data at the continent level.

5. **What is the global death rate from COVID-19?**
   - Summarized and calculated from all new cases and deaths worldwide.

6. **How did COVID-19 vaccination progress over time?**
   - Used rolling sums and CTEs to calculate and visualize cumulative vaccinations.

## Conclusion

This project provides a comprehensive view of the COVID-19 pandemic's effects across the globe. By leveraging SQL for data transformation and analysis, we gain insights into infection patterns, death rates, and the effectiveness of vaccination efforts. This structured analysis can support healthcare planning, future pandemic preparedness, and public awareness.

---

### Project Structure

- **`data/`**: Directory storing COVID-19 cases and vaccinations data.
- **`queries/`**: Contains SQL scripts for data cleaning, transformation, and analysis.
- **`views/`**: Includes created views for persistent and reusable analysis.
- **`results/`**: Output tables and visualizations derived from queries.

