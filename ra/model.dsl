
     model {
            

#/*
            erpStaff    = person "ERP Staff" "ERP" "Internal Staff"
            crmStaff    = person "CRM Staff" "CRM Staff" "Internal Staff"


            dataOwner   = person "Data Owner" "CRM Staff" "Internal Staff"
            dataExpert  = person "Data Expert" "CRM Staff" "Internal Staff"
            dataSteward = person "Data Steward" "Data Steward" "Internal Staff"
            reportUser  = person "Reporting Staff" "Reporting Staff" "Internal Staff"

#*/
        enterprise "Data Platform Reference Architecture " {

            erpSystem = softwaresystem "ERP System" "Stores all of the core information about customers, accounts, transactions, etc." "System OutScope"
            crmSystem = softwaresystem "CRM System" "Allows customers to withdraw cash." "System OutScope"
            MasterDataSystem = softwaresystem "Masterdata " "Masterdata " "System OutScope"


            DataPlatformSystem = softwaresystem "Enterprise Data Platform" "Data platform." "System InScope" {
                ingestionContainer      = container "Ingestion Area" "Ingest" "<Technology used>" "Datalake"
                daContainer             = container "Data Area" "Staging" "Snowflake" "Database - Snowflake"
                da2baContainer          = container "Business Area Transformation" "" "" "Component - Snowflake"
                ba2iaContainer          = container "Information Area Transformation" "" "" "Component - Snowflake"
                in2daContainer          = container "Data Area Transformation" "" "" "Component - Snowflake"
                baContainer             = container "Business Area" "Business Area" "Snowflake" "Database - Snowflake"
                iaContainer             = container "Information Area" "Information Area" "Snowflake" "Database - Snowflake"
                dqContainer             = container "Data Quality Engine" "Data Quality Engine" "Snowflake" "Component - Snowflake"
                maContainer             = container "Metadata Area" "Metadata" "" "Database - Snowflake"
            }
            
            MetaDataSystem = softwaresystem "Metadata System" "Metadata System" "System InScope"
            
            DataEnrichtmentSystem = softwaresystem "Data Enrichment System" "Data Enrichment" "System InScope" {
                enrichmentApplication   = container "Data Enrichment Web Application" "Database" "App"

            }
            EnterpriseReportingSystem = softwaresystem "Enterprise Reporting" "Enterprise Reporting" "System InScope" {
                biDataSet = container "BI Dataset" "BI Dataset" "Power BI" "Dataset - PowerBI"
                biReport  = container "BI Report" "BI Report" "Power BI" "Power BI Report"
            }
            
            DataPlatformMonitoringSystem = softwaresystem "DataPlatform Monitoring System" "Monitoring" "System InScope" {
                dpMonitoring = container "Data Platform Monitoring Service" "BI Dataset" "Power BI" "Monitoring - "
                dpAlerting   = container "Data Platform Alerting Service" "BI Report" "Power BI" "Alerting - OpsGenie"
            }

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
        #erpSystem -> dataPlatformSystem "ERP Data"
        #crmSystem -> dataPlatformSystem "CRM Data"

        #DataEnrichtmentSystem -> dataPlatformSystem "Enrichment Data"
        MasterDataSystem             -> dataPlatformSystem           "Master Data"
        DataPlatformSystem           -> EnterpriseReportingSystem    "Is datasource for"
        DataPlatformMonitoringSystem -> DataPlatformSystem           "Monitors"
        MetaDataSystem               -> DataPlatformSystem           "Describes"
        MetaDataSystem               -> EnterpriseReportingSystem    "Describes"


        # relationships between containers
        baContainer -> ba2iaContainer "Is a datasource for"
        ba2iaContainer -> iaContainer "Transforms data for"
        ingestionContainer -> in2daContainer "Is a datasource for"
        in2daContainer -> da2baContainer "Loads data into"

        maContainer -> daContainer "Describes"
        maContainer -> baContainer "Describes"
        maContainer -> iaContainer "Describes"
        enrichmentApplication -> ingestionContainer "Is a datasource for"
        erpSystem -> ingestionContainer "ERP Data"
        crmSystem -> ingestionContainer "CRM Data"
        daContainer -> da2baContainer "Is input for"
        da2baContainer ->   baContainer "Transforms data for"
        daContainer -> dqContainer "Is validated by"
        baContainer -> dqContainer "Is validated by"
        dqContainer -> maContainer "Store DQ data in "
        # relationships between components
        biDataSet -> biReport "Is a datasource for"
        
        
            
    }
