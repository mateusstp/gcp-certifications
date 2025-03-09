#!/bin/bash

export PROJECT_ID=qwiklabs-gcp-00-ca6669264d23
export DATABASE_ID=banking-ops-db
export INSTANCE_ID=banking-ops-instance

gcloud config set project $PROJECT_ID

# Insert data into Portfolio table
gcloud spanner databases execute-sql $DATABASE_ID --instance=$INSTANCE_ID --sql="INSERT INTO Portfolio (PortfolioId, Name, ShortName, PortfolioInfo) VALUES 
(1, 'Banking', 'Bnkg', 'All Banking Business'),
(2, 'Asset Growth', 'AsstGrwth', 'All Asset Focused Products'),
(3, 'Insurance', 'Insurance', 'All Insurance Focused Products')"

# Insert data into Category table
gcloud spanner databases execute-sql $DATABASE_ID --instance=$INSTANCE_ID --sql="INSERT INTO Category (CategoryId, PortfolioId, CategoryName) VALUES 
(1, 1, 'Cash'),
(2, 2, 'Investments - Short Return'),
(3, 2, 'Annuities'),
(4, 3, 'Life Insurance')"

# Insert data into Product table
gcloud spanner databases execute-sql $DATABASE_ID --instance=$INSTANCE_ID --sql="INSERT INTO Product (ProductId, CategoryId, PortfolioId, ProductName, ProductAssetCode, ProductClass) VALUES 
(1, 1, 1, 'Checking Account', 'ChkAcct', 'Banking LOB'),
(2, 2, 2, 'Mutual Fund Consumer Goods', 'MFundCG', 'Investment LOB'),
(3, 3, 2, 'Annuity Early Retirement', 'AnnuFixed', 'Investment LOB'),
(4, 4, 3, 'Term Life Insurance', 'TermLife', 'Insurance LOB'),
(5, 1, 1, 'Savings Account', 'SavAcct', 'Banking LOB'),
(6, 1, 1, 'Personal Loan', 'PersLn', 'Banking LOB'),
(7, 1, 1, 'Auto Loan', 'AutLn', 'Banking LOB'),
(8, 4, 3, 'Permanent Life Insurance', 'PermLife', 'Insurance LOB'),
(9, 2, 2, 'US Savings Bonds', 'USSavBond', 'Investment LOB')"


gcloud spanner databases ddl update $DATABASE_ID --instance=$INSTANCE_ID --ddl="ALTER TABLE Category ADD COLUMN MarketingBudget INT64"
