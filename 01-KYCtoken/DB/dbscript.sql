-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 16, 2024 at 01:50 AM
-- Server version: 10.7.3-MariaDB-log
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xLoad`
--


DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `AclRecord`
--

CREATE TABLE `AclRecord` (
  `Id` int(11) NOT NULL,
  `EntityName` varchar(400) NOT NULL,
  `CustomerRoleId` int(11) NOT NULL,
  `EntityId` int(11) NOT NULL,
  `CrDate` datetime(3) DEFAULT NULL,
  `ChDate` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ActivityLog`
--

CREATE TABLE `ActivityLog` (
  `Id` int(11) NOT NULL,
  `Comment` longtext NOT NULL,
  `IpAddress` varchar(200) DEFAULT NULL,
  `EntityName` varchar(400) DEFAULT NULL,
  `ActivityLogTypeId` int(11) NOT NULL,
  `CustomerId` int(11) NOT NULL,
  `EntityId` int(11) DEFAULT NULL,
  `CreatedOnUtc` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ActivityLogType`
--

CREATE TABLE `ActivityLogType` (
  `Id` int(11) NOT NULL,
  `SystemKeyword` varchar(100) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `Enabled` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `Address`
--

CREATE TABLE `Address` (
  `Id` int(11) NOT NULL,
  `CountryId` int(11) DEFAULT NULL,
  `StateProvinceId` int(11) DEFAULT NULL,
  `FirstName` longtext DEFAULT NULL,
  `LastName` longtext DEFAULT NULL,
  `Email` longtext DEFAULT NULL,
  `Company` longtext DEFAULT NULL,
  `County` longtext DEFAULT NULL,
  `City` longtext DEFAULT NULL,
  `Address1` longtext DEFAULT NULL,
  `Address2` longtext DEFAULT NULL,
  `ZipPostalCode` longtext DEFAULT NULL,
  `PhoneNumber` longtext DEFAULT NULL,
  `FaxNumber` longtext DEFAULT NULL,
  `CustomAttributes` longtext DEFAULT NULL,
  `CreatedOnUtc` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `AddressAttribute`
--

CREATE TABLE `AddressAttribute` (
  `Id` int(11) NOT NULL,
  `Name` varchar(400) NOT NULL,
  `IsRequired` tinyint(4) NOT NULL,
  `AttributeControlTypeId` int(11) NOT NULL,
  `DisplayOrder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `AddressAttributeValue`
--

CREATE TABLE `AddressAttributeValue` (
  `Id` int(11) NOT NULL,
  `Name` varchar(400) NOT NULL,
  `AddressAttributeId` int(11) NOT NULL,
  `IsPreSelected` tinyint(4) NOT NULL,
  `DisplayOrder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `Country`
--

CREATE TABLE `Country` (
  `Id` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `TwoLetterIsoCode` varchar(2) DEFAULT NULL,
  `ThreeLetterIsoCode` varchar(3) DEFAULT NULL,
  `AllowsBilling` tinyint(4) NOT NULL,
  `AllowsShipping` tinyint(4) NOT NULL,
  `NumericIsoCode` int(11) NOT NULL,
  `SubjectToVat` tinyint(4) NOT NULL,
  `Published` tinyint(4) NOT NULL,
  `DisplayOrder` int(11) NOT NULL,
  `LimitedToStores` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `Currency`
--

CREATE TABLE `Currency` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `CurrencyCode` varchar(5) NOT NULL,
  `DisplayLocale` varchar(50) DEFAULT NULL,
  `CustomFormatting` varchar(50) DEFAULT NULL,
  `Rate` decimal(18,4) NOT NULL,
  `LimitedToStores` tinyint(4) NOT NULL,
  `Published` tinyint(4) NOT NULL,
  `DisplayOrder` int(11) NOT NULL,
  `CreatedOnUtc` datetime(6) NOT NULL,
  `UpdatedOnUtc` datetime(6) NOT NULL,
  `RoundingTypeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `Id` int(11) NOT NULL,
  `Username` varchar(1000) DEFAULT NULL,
  `Email` varchar(1000) DEFAULT NULL,
  `EmailToRevalidate` varchar(1000) DEFAULT NULL,
  `FirstName` varchar(1000) DEFAULT NULL,
  `LastName` varchar(1000) DEFAULT NULL,
  `Gender` varchar(1000) DEFAULT NULL,
  `Company` varchar(1000) DEFAULT NULL,
  `StreetAddress` varchar(1000) DEFAULT NULL,
  `StreetAddress2` varchar(1000) DEFAULT NULL,
  `ZipPostalCode` varchar(1000) DEFAULT NULL,
  `City` varchar(1000) DEFAULT NULL,
  `County` varchar(1000) DEFAULT NULL,
  `Phone` varchar(1000) DEFAULT NULL,
  `Fax` varchar(1000) DEFAULT NULL,
  `VatNumber` varchar(1000) DEFAULT NULL,
  `TimeZoneId` varchar(1000) DEFAULT NULL,
  `CustomCustomerAttributesXML` longtext DEFAULT NULL,
  `DateOfBirth` datetime(6) DEFAULT NULL,
  `SystemName` varchar(400) DEFAULT NULL,
  `CurrencyId` int(11) DEFAULT NULL,
  `LanguageId` int(11) DEFAULT NULL,
  `BillingAddress_Id` int(11) DEFAULT NULL,
  `ShippingAddress_Id` int(11) DEFAULT NULL,
  `CustomerGuid` char(36) NOT NULL,
  `CountryId` int(11) NOT NULL,
  `StateProvinceId` int(11) NOT NULL,
  `VatNumberStatusId` int(11) NOT NULL,
  `TaxDisplayTypeId` int(11) DEFAULT NULL,
  `AdminComment` longtext DEFAULT NULL,
  `IsTaxExempt` tinyint(4) NOT NULL,
  `AffiliateId` int(11) NOT NULL,
  `VendorId` int(11) NOT NULL,
  `HasShoppingCartItems` tinyint(4) NOT NULL,
  `RequireReLogin` tinyint(4) NOT NULL,
  `FailedLoginAttempts` int(11) NOT NULL,
  `CannotLoginUntilDateUtc` datetime(6) DEFAULT NULL,
  `Active` tinyint(4) NOT NULL,
  `Deleted` tinyint(4) NOT NULL,
  `IsSystemAccount` tinyint(4) NOT NULL,
  `LastIpAddress` longtext DEFAULT NULL,
  `CreatedOnUtc` datetime(6) NOT NULL,
  `LastLoginDateUtc` datetime(6) DEFAULT NULL,
  `LastActivityDateUtc` datetime(6) NOT NULL,
  `RegisteredInStoreId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `CustomerAddresses`
--

CREATE TABLE `CustomerAddresses` (
  `Address_Id` int(11) NOT NULL,
  `Customer_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `CustomerAttribute`
--

CREATE TABLE `CustomerAttribute` (
  `Id` int(11) NOT NULL,
  `Name` varchar(400) NOT NULL,
  `IsRequired` tinyint(4) NOT NULL,
  `AttributeControlTypeId` int(11) NOT NULL,
  `DisplayOrder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `CustomerAttributeValue`
--

CREATE TABLE `CustomerAttributeValue` (
  `Id` int(11) NOT NULL,
  `Name` varchar(400) NOT NULL,
  `CustomerAttributeId` int(11) NOT NULL,
  `IsPreSelected` tinyint(4) NOT NULL,
  `DisplayOrder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `CustomerPassword`
--

CREATE TABLE `CustomerPassword` (
  `Id` int(11) NOT NULL,
  `CustomerId` int(11) NOT NULL,
  `Password` longtext DEFAULT NULL,
  `PasswordFormatId` int(11) NOT NULL,
  `PasswordSalt` longtext DEFAULT NULL,
  `CreatedOnUtc` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `CustomerRole`
--

CREATE TABLE `CustomerRole` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `SystemName` varchar(255) DEFAULT NULL,
  `FreeShipping` tinyint(4) NOT NULL,
  `TaxExempt` tinyint(4) NOT NULL,
  `Active` tinyint(4) NOT NULL,
  `IsSystemRole` tinyint(4) NOT NULL,
  `EnablePasswordLifetime` tinyint(4) NOT NULL,
  `OverrideTaxDisplayType` tinyint(4) NOT NULL,
  `DefaultTaxDisplayTypeId` int(11) NOT NULL,
  `PurchasedWithProductId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `Customer_CustomerRole_Mapping`
--

CREATE TABLE `Customer_CustomerRole_Mapping` (
  `Customer_Id` int(11) NOT NULL,
  `CustomerRole_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `EmailAccount`
--

CREATE TABLE `EmailAccount` (
  `Id` int(11) NOT NULL,
  `DisplayName` varchar(255) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Host` varchar(255) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Port` int(11) NOT NULL,
  `EnableSsl` tinyint(4) NOT NULL,
  `UseDefaultCredentials` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `GdprConsent`
--

CREATE TABLE `GdprConsent` (
  `Id` int(11) NOT NULL,
  `Message` longtext NOT NULL,
  `IsRequired` tinyint(4) NOT NULL,
  `RequiredMessage` longtext DEFAULT NULL,
  `DisplayDuringRegistration` tinyint(4) NOT NULL,
  `DisplayOnCustomerInfoPage` tinyint(4) NOT NULL,
  `DisplayOrder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `GdprLog`
--

CREATE TABLE `GdprLog` (
  `Id` int(11) NOT NULL,
  `CustomerId` int(11) NOT NULL,
  `ConsentId` int(11) NOT NULL,
  `CustomerInfo` longtext DEFAULT NULL,
  `RequestTypeId` int(11) NOT NULL,
  `RequestDetails` longtext DEFAULT NULL,
  `CreatedOnUtc` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `Language`
--

CREATE TABLE `Language` (
  `Id` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `LanguageCulture` varchar(20) NOT NULL,
  `UniqueSeoCode` varchar(2) DEFAULT NULL,
  `FlagImageFileName` varchar(50) DEFAULT NULL,
  `Rtl` tinyint(4) NOT NULL,
  `LimitedToStores` tinyint(4) NOT NULL,
  `DefaultCurrencyId` int(11) NOT NULL,
  `Published` tinyint(4) NOT NULL,
  `DisplayOrder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `Log`
--

CREATE TABLE `Log` (
  `Id` int(11) NOT NULL,
  `ShortMessage` longtext NOT NULL,
  `IpAddress` varchar(200) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `LogLevelId` int(11) NOT NULL,
  `FullMessage` longtext DEFAULT NULL,
  `PageUrl` longtext DEFAULT NULL,
  `ReferrerUrl` longtext DEFAULT NULL,
  `CreatedOnUtc` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `StateProvince`
--

CREATE TABLE `StateProvince` (
  `Id` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Abbreviation` varchar(100) DEFAULT NULL,
  `CountryId` int(11) NOT NULL,
  `Published` tinyint(4) NOT NULL,
  `DisplayOrder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `UrlRecord`
--

CREATE TABLE `UrlRecord` (
  `Id` int(11) NOT NULL,
  `EntityName` varchar(400) NOT NULL,
  `Slug` varchar(400) NOT NULL,
  `EntityId` int(11) NOT NULL,
  `IsActive` tinyint(4) NOT NULL,
  `LanguageId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AclRecord`
--
ALTER TABLE `AclRecord`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `ActivityLog`
--
ALTER TABLE `ActivityLog`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `ActivityLogType`
--
ALTER TABLE `ActivityLogType`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Address`
--
ALTER TABLE `Address`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `AddressAttribute`
--
ALTER TABLE `AddressAttribute`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `AddressAttributeValue`
--
ALTER TABLE `AddressAttributeValue`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Country`
--
ALTER TABLE `Country`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Currency`
--
ALTER TABLE `Currency`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `CustomerAddresses`
--
ALTER TABLE `CustomerAddresses`
  ADD PRIMARY KEY (`Address_Id`,`Customer_Id`);

--
-- Indexes for table `CustomerAttribute`
--
ALTER TABLE `CustomerAttribute`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `CustomerAttributeValue`
--
ALTER TABLE `CustomerAttributeValue`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `CustomerPassword`
--
ALTER TABLE `CustomerPassword`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `CustomerRole`
--
ALTER TABLE `CustomerRole`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Customer_CustomerRole_Mapping`
--
ALTER TABLE `Customer_CustomerRole_Mapping`
  ADD PRIMARY KEY (`Customer_Id`,`CustomerRole_Id`);

--
-- Indexes for table `EmailAccount`
--
ALTER TABLE `EmailAccount`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `GdprConsent`
--
ALTER TABLE `GdprConsent`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `GdprLog`
--
ALTER TABLE `GdprLog`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Language`
--
ALTER TABLE `Language`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Log`
--
ALTER TABLE `Log`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `StateProvince`
--
ALTER TABLE `StateProvince`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `UrlRecord`
--
ALTER TABLE `UrlRecord`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `AclRecord`
--
ALTER TABLE `AclRecord`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ActivityLog`
--
ALTER TABLE `ActivityLog`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ActivityLogType`
--
ALTER TABLE `ActivityLogType`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Address`
--
ALTER TABLE `Address`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `AddressAttribute`
--
ALTER TABLE `AddressAttribute`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `AddressAttributeValue`
--
ALTER TABLE `AddressAttributeValue`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Country`
--
ALTER TABLE `Country`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Currency`
--
ALTER TABLE `Currency`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Customer`
--
ALTER TABLE `Customer`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `CustomerAttribute`
--
ALTER TABLE `CustomerAttribute`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `CustomerAttributeValue`
--
ALTER TABLE `CustomerAttributeValue`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `CustomerPassword`
--
ALTER TABLE `CustomerPassword`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `CustomerRole`
--
ALTER TABLE `CustomerRole`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `EmailAccount`
--
ALTER TABLE `EmailAccount`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `GdprConsent`
--
ALTER TABLE `GdprConsent`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `GdprLog`
--
ALTER TABLE `GdprLog`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Language`
--
ALTER TABLE `Language`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Log`
--
ALTER TABLE `Log`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `StateProvince`
--
ALTER TABLE `StateProvince`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `UrlRecord`
--
ALTER TABLE `UrlRecord`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
