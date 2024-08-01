-- Data Cleaning
-- Objectives:
-- 1. Remove Duplicates
-- 2. Standardize Data
-- 3. Deal with Null_values / Empty_values
-- 4. Remove any columns if necessary

-- Removing Duplicates
CREATE TABLE layoffs_staging
LIKE layoffs;

INSERT layoffs_staging
SELECT *
FROM layoffs;

SELECT *
FROM layoffs_staging;

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,'date',stage,country,funds_raised_millions) AS row_num
FROM layoffs_staging;

WITH duplicate_cte AS
(SELECT *, 
ROW_NUMBER() OVER(
PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,'date',stage,country,funds_raised_millions) AS row_num
FROM layoffs_staging
)

SELECT *
FROM duplicate_cte
WHERE row_num > 1;

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
FROM layoffs_staging2;

INSERT INTO layoffs_staging2
SELECT *, 
ROW_NUMBER() OVER(
PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,'date',stage,country,funds_raised_millions) AS row_num
FROM layoffs_staging;

SELECT * 
FROM layoffs_staging2
WHERE row_num>1;

DELETE 
FROM layoffs_staging2
WHERE row_num>1;

SELECT * 
FROM layoffs_staging2;


-- Standardizing Data
SELECT TRIM(company), company
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET company=TRIM(company);

SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY 1;

SELECT industry
FROM layoffs_staging2
ORDER BY 1;

UPDATE layoffs_staging2
SET industry = 'crypto'
WHERE industry LIKE 'crypto%';

SELECT DISTINCT country
FROM layoffs_staging2
ORDER BY 1;

UPDATE layoffs_staging2
SET country = 'United States'
WHERE country LIKE 'United S%';

-- Changing date in TEXT format to date in date format
SELECT `date`
,str_to_date(`date`,'%m,%d,%Y')
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET `date`=str_to_date(`date`,'%m,%d,%Y');

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;

SELECT *
FROM layoffs_staging2;

-- Removing Null & Empty values
SELECT *
FROM layoffs_staging2
WHERE indUstry IS NULL;

SELECT * 
FROM layoffs_staging2
WHERE company LIKE '%Interactive';

UPDATE layoffs_staging2
SET industry='Other'
WHERE company LIKE '%Interactive';


SELECT *
FROM layoffs_staging2
WHERE company = 'Airbnb';

UPDATE layoffs_staging2
SET industry='Travel'
WHERE company = 'Airbnb';

UPDATE layoffs_staging2
SET industry='Transportation'
WHERE company = 'Carvana';

UPDATE layoffs_staging2
SET industry='Consumer'
WHERE company = 'Juul';

SELECT *
FROM layoffs_staging2;


SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

DELETE 
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

-- Deleting a column
ALTER TABLE layoffs_staging2
DROP COLUMN row_num;