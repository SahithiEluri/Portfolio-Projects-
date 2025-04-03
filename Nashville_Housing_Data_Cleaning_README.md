
# Nashville Housing Data Cleaning Project

Welcome to the Nashville Housing Data Cleaning project. This project focuses on cleaning and transforming raw housing data using SQL to prepare it for further analysis. The dataset comes from property transactions in Nashville and is refined to ensure accuracy, consistency, and clarity.

## Table of Contents
- [Introduction](#introduction)
- [Data Source](#data-source)
- [Objectives](#objectives)
- [Methodology](#methodology)
- [Key Steps in Data Cleaning](#key-steps-in-data-cleaning)
- [Conclusion](#conclusion)

## Introduction

Raw housing datasets often contain inconsistencies, null values, duplicates, and formatting issues that must be addressed before analysis. This project aims to demonstrate SQL-based techniques to clean such datasets, using the Nashville Housing data as a case study.

## Data Source

The dataset used in this project is sourced from property transactions in Nashville. It includes various details such as sale dates, property and owner addresses, sale prices, and more.

## Objectives

- Standardize date formats.
- Populate missing property address data.
- Break down address fields into separate columns.
- Clean up categorical fields for clarity.
- Remove duplicate records.
- Drop unnecessary columns.

## Methodology

All operations were performed using SQL on a Microsoft SQL Server environment. The steps include updates, transformations, and deletions performed through various SQL queries and commands.

## Key Steps in Data Cleaning

1. **Standardizing the Sale Date Format**
   - Converted `SaleDate` into a proper `Date` format and stored it in a new column `SaleDateConverted`.

2. **Populating Missing Property Addresses**
   - Filled null `PropertyAddress` values by joining on matching `ParcelID` with non-null records.

3. **Splitting Address Columns**
   - Separated `PropertyAddress` into `PropertySpliAddress` and `PropertySpliCity`.
   - Separated `OwnerAddress` into `OwnerSplitAddress`, `OwnerSplitCity`, and `OwnerSplitState` using string parsing functions.

4. **Cleaning 'SoldAsVacant' Column**
   - Standardized values from `'Y'`/`'N'` to `'Yes'`/`'No'` for better readability.

5. **Removing Duplicate Records**
   - Used `ROW_NUMBER()` with `PARTITION BY` on key identifying columns to detect duplicates and mark rows for removal.

6. **Dropping Unnecessary Columns**
   - Dropped columns such as `PropertyAddress`, `OwnerAddress`, `SaleDate`, and `TaxDistrict` after their information was transformed and stored separately.

## Conclusion

This project successfully demonstrates a comprehensive approach to data cleaning using SQL. These steps ensure that the Nashville Housing dataset is more structured, consistent, and ready for accurate analysis and visualization.

---

### Project Structure

- **`data/`**: Contains the original and cleaned datasets.
- **`sql_scripts/`**: Includes SQL scripts for each data cleaning step.
- **`results/`**: Final cleaned tables and summary reports.
