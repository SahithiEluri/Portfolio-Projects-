use portfolioproject;

/* cleaning Data in SQL Queries */
  select * from portfolioproject.dbo.NashvilleHousing

---------------------------------------------------------------------------------------------------
/* Standardize Date Format */

select SaleDateConverted, CONVERT(Date,SaleDate)
from portfolioproject.dbo.NashvilleHousing

update NashvilleHousing
set SaleDate = CONVERT(Date,SaleDate)

ALTER TABLE NashvilleHousing
add SaleDateConverted Date;

update NashvilleHousing
set SaleDateConverted = CONVERT(Date,SaleDate)

--------------------------------------------------------------------------------------------------------------
/* Populate Property Address Data */

select * 
from portfolioproject.dbo.NashvilleHousing
--where PropertyAddress is null
order by ParcelID

select a.ParcelID,a.PropertyAddress,b.ParcelID,b.PropertyAddress,ISNULL(a.PropertyAddress,b.PropertyAddress)
from portfolioproject.dbo.NashvilleHousing a
join portfolioproject.dbo.NashvilleHousing b
on a.ParcelID =b.ParcelID
  and a.[UniqueID ]<>b.[UniqueID ]
where a.PropertyAddress is null

UPDATE a
SET PropertyAddress = ISNULL(a.PropertyAddress,b.PropertyAddress)
from portfolioproject.dbo.NashvilleHousing a
join portfolioproject.dbo.NashvilleHousing b
on a.ParcelID =b.ParcelID
  and a.[UniqueID ]<>b.[UniqueID ]
where a.PropertyAddress is null

------------------------------------------------------------------------------------------------------
--Breaking out Address into Individual column (Address, City, State)

-------------Property Address

select PropertyAddress
from portfolioproject.dbo.NashvilleHousing
--where PropertyAddress is null
--order by ParcelID

select 
SUBSTRING (PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1) as Address  --imp
,SUBSTRING(PropertyAddress,  CHARINDEX(',', PropertyAddress) +1 , len(PropertyAddress )) as Address
from portfolioproject.dbo.NashvilleHousing 

ALTER TABLE NashvilleHousing
add PropertySpliAddress Nvarchar(255);

update NashvilleHousing
set PropertySpliAddress = SUBSTRING (PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1)

ALTER TABLE NashvilleHousing
add PropertySpliCity Nvarchar(255);

update NashvilleHousing
set PropertySpliCity = SUBSTRING(PropertyAddress,  CHARINDEX(',', PropertyAddress) +1 , len(PropertyAddress ))

select * 
from portfolioproject.dbo.NashvilleHousing 

--------------Owner Address-----------------

select OwnerAddress
from portfolioproject.dbo.NashvilleHousing 

select 
PARSENAME(Replace(OwnerAddress, ',','.'),3)
,PARSENAME(Replace(OwnerAddress, ',','.'),2)
,PARSENAME(Replace(OwnerAddress, ',','.'),1)
from portfolioproject.dbo.NashvilleHousing 

ALTER TABLE NashvilleHousing
add OwnerSplitAddress Nvarchar(255);

update NashvilleHousing
set OwnerSplitAddress = PARSENAME(Replace(OwnerAddress, ',','.'),3)

ALTER TABLE NashvilleHousing
add OwnerSplitCity Nvarchar(255);

update NashvilleHousing
set OwnerSplitCity = PARSENAME(Replace(OwnerAddress, ',','.'),2)

ALTER TABLE NashvilleHousing
add OwnerSplitState Nvarchar(255);

update NashvilleHousing
set OwnerSplitState = PARSENAME(Replace(OwnerAddress, ',','.'),1)

select * 
from portfolioproject.dbo.NashvilleHousing

------------------------------------------------------------------------------------
-----Chnage Y and N to Yes and No in "sold as vacant" Feild

select Distinct(SoldAsVacant),count(SoldAsVacant)
from portfolioproject.dbo.NashvilleHousing
group by SoldAsVacant
order by 2

select SoldAsVacant
,case when SoldAsVacant ='Y' then 'Yes'
     when SoldAsVacant ='N' then 'No'
	 else SoldAsVacant
	 end
from portfolioproject.dbo.NashvilleHousing

update NashvilleHousing
set SoldAsVacant = case when SoldAsVacant ='Y' then 'Yes'
     when SoldAsVacant ='N' then 'No'
	 else SoldAsVacant
	 end

-------------------------------------------------------------------
----Remove Duplicate

with RowNumCTE AS(
select *,
  ROW_NUMBER() OVER(
  Partition by ParcelID,
               PropertyAddress,
			   SalePrice,
			   SaleDate,
			   LegalReference
			   order by 
			        UniqueID
			        )row_num
from portfolioproject.dbo.NashvilleHousing
--order by ParcelID
)
select * 
from RowNumCTE
where row_num > 1
order by PropertyAddress

------------------------------------------------------------------------------------
---Delete Unused Column

select * 
from portfolioproject.dbo.NashvilleHousing

Alter table portfolioproject.dbo.NashvilleHousing
drop column PropertyAddress,OwnerAddress,SaleDate,TaxDistrict

