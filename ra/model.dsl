
     model {
            
            erpSystem = softwaresystem "ERP System" "Stores all of the core information about customers, accounts, transactions, etc." "System OutScope"
            crmSystem = softwaresystem "CRM System" "Allows customers to withdraw cash." "System OutScope"
            MasterDataSystem = softwaresystem "Masterdata " "Masterdata " "System OutScope"

/*
            erpStaff    = person "ERP Staff" "ERP" "Internal Staff"
            crmStaff    = person "CRM Staff" "CRM Staff" "Internal Staff"


            dataOwner   = person "Data Owner" "CRM Staff" "Internal Staff"
            dataExpert  = person "Data Expert" "CRM Staff" "Internal Staff"
            dataSteward = person "Data Steward" "Data Steward" "Internal Staff"
            reportUser  = person "Reporting Staff" "Reporting Staff" "Internal Staff"

*/
        enterprise "Data Platform Reference Architecture " {

            DataPlatformSystem = softwaresystem "Enterprise Data Platform" "Data platform." "System InScope" {
                ingestionContainer      = container "Ingestion Area" "Ingest" "<Technology used>" "Datalake"
                daContainer             = container "Data Area" "Staging" "Snowflake" "Database"
                baContainer             = container "Business Area" "Business Area" "Snowflake" "Database - Snowflake"
                iaContainer             = container "Information Area" "Information Area" "Snowflake" "Database - Snowflake"
                dqContainer             = container "Data Quality Engine" "Data Quality Engine" "Snowflake" "Database - Snowflake"
                metadataContainer       = container "Metadata Area" "Metadata" "Database"
            }
            MetaDataSystem = softwaresystem "Metadata System" "Metadata System" "System InScope"
            DataEnrichtmentSystem = softwaresystem "Data Enrichment System" "Data Enrichment" "System InScope" {
                enrichmentApplication   = container "Data Enrichment Web Application" "Database" "App"

            }
            EnterpriseReportingSystem = softwaresystem "Enterprise Reporting" "Enterprise Reporting" "System InScope" {
                biDataSet = container "BI Dataset" "BI Dataset" "Power BI" "Power BI Dataset"
                biReport  = container "BI Report" "BI Report" "Power BI" "Power BI Report"
            }

        }

        # relationships between people and software systems
        /*
        erpStaff    -> erpSystem "Uses"
        crmStaff    -> crmSystem "Uses"
        dataSteward -> MetaDataSystem "Uses"
        dataSteward -> MasterDataSystem "Uses"
        dataExpert  -> MetadataSystem "Data Expert"
        dataOwner   -> MetadataSystem "Data Owner"
        reportUser  -> EnterpriseReportingSystem
    */

        # relationships between software systems and software systems
        erpSystem -> dataPlatformSystem "ERP Data "
        crmSystem -> dataPlatformSystem "CRM Data"
        #DataEnrichtmentSystem -> dataPlatformSystem "Enrichment Data"
        MasterDataSystem -> dataPlatformSystem "Master Data"
        DataPlatformSystem -> EnterpriseReportingSystem "Is datasource for"
        DataPlatformSystem -> MetaDataSystem "Is defined in"
        EnterpriseReportingSystem -> MetaDataSystem "Is defined in"



        # relationships between containers
        daContainer -> baContainer "Is a datasource for"
        baContainer -> iaContainer "Is a datasource for"
        ingestionContainer -> daContainer "Is a datasource for"
        enrichmentApplication -> ingestionContainer "Is a datasource for"

        # relationships between components

        
            
    }
