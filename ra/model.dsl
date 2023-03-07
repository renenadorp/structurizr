
     model {
            

        enterprise "Data Platform Reference Architecture " {
            erpStaff    = person "ERP Staff" "ERP" "Internal Staff"
            crmStaff    = person "CRM Staff" "CRM Staff" "Internal Staff"
            dataOwner   = person "Data Owner" "CRM Staff" "Internal Staff"
            dataExpert  = person "Data Expert" "CRM Staff" "Internal Staff"
            dataSteward = person "Data Steward" "Data Steward" "Internal Staff"
            reportUser  = person "Reporting Staff" "Reporting Staff" "Internal Staff"

            erpSystem = softwaresystem "ERP System" "Stores all of the core information about customers, accounts, transactions, etc." "System OutScope"
            crmSystem = softwaresystem "CRM System" "Allows customers to withdraw cash." "System OutScope"


            DataPlatformSystem = softwaresystem "Enterprise Data Platform" "Data platform." "System InScope" {
                ingestionContainer      = container "Ingestion Area" "Ingest" "<Technology used>" "File System"
                enrichmentApplication   = container "Data Enrichment Web Application" "Database" "App"
                stagingContainer        = container "Data Area" "Staging" "Snowflake" "Database"
                enterpriseContainer     = container "Business Area" "Business Area" "Snowflake" "Database - Snowflake"
                biContainer             = container "Information Area" "Information Area" "Snowflake" "Database - Snowflake"
                metadataContainer       = container "Metadata Area" "Metadata" "Database"
            }
            MetaDataSystem = softwaresystem "Metadata " "Metadata " "System InScope"
            MasterDataSystem = softwaresystem "Masterdata " "Masterdata " "System OutScope"
            DataEnrichtmentSystem = softwaresystem "Data Enrichment Sytstem" "Data Enrichment" "System InScope"
            EnterpriseReportingSystem = softwaresystem "Enterprise Reporting" "Enterprise Reporting" "System InScope"

        }

        # relationships between people and software systems
        erpStaff    -> erpSystem "Uses"
        crmStaff    -> crmSystem "Uses"
        dataSteward -> MetaDataSystem "Uses"
        dataSteward -> MasterDataSystem "Uses"
        dataExpert  -> MetadataSystem "Data Expert"
        dataOwner   -> MetadataSystem "Data Owner"
        reportUser  -> EnterpriseReportingSystem

        # relationships between software systems and software systems
        erpSystem -> dataPlatformSystem "ERP Data "
        crmSystem -> dataPlatformSystem "CRM Data"
        DataEnrichtmentSystem -> dataPlatformSystem "Enrichment Data"
        MasterDataSystem -> dataPlatformSystem "Master Data"
        DataPlatformSystem -> EnterpriseReportingSystem "Uses data from"
        DataPlatformSystem -> MetaDataSystem "Vertical Lineage"



        # relationships between containers

        # relationships between components

        
            
    }
