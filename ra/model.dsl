
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

            erpSystem           = softwaresystem "ERP System" "Enterprise Resource Planning" "System OutScope"
            crmSystem           = softwaresystem "CRM System" "Customer Relationship Management System" "System OutScope"
            wmsSystem           = softwaresystem "WMS" "Warehouse Management System" "System OutScope"
            hrmSystem           = softwaresystem "HRM" "Human Resource Management System" "System OutScope"
            iamSystem           = softwaresystem "IAM" "Identity & Access Management System" "System InScope"
            MasterDataSystem    = softwaresystem "Masterdata " "Masterdata " "System OutScope"


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
                orchestrationContainer  = container "Orchestration Engine" "Orchestration" "" "Microsoft Azure - Data Factories"
            }
            
            MetaDataSystem = softwaresystem "Metadata System" "Metadata System" "System InScope" {
                businessGlossaryContainer = container "Business Glossary" "Glossary" "" "Glossary - Purview"
                dataCatalogContainer = container "Data Catalog" "Catalog" "" "Catalog - Purview"


            }
            
            DataEnrichtmentSystem = softwaresystem "Data Enrichment System" "Data Enrichment" "System InScope" {
                enrichmentApplication   = container "Data Enrichment Web Application" "Database" "App"

            }
            EnterpriseReportingSystem = softwaresystem "Enterprise Reporting" "Enterprise Reporting" "System InScope" {
                biEnterpriseDataSet     = container "BI Enterprise Dataset" "BI Dataset" "Power BI" "Dataset - PowerBI"
                biDomainDataSet1        = container "BI Domain Dataset 1" "BI Dataset" "Power BI" "Dataset - PowerBI"
                biDomainDataSet2        = container "BI Domain Dataset 2" "BI Dataset" "Power BI" "Dataset - PowerBI"
                biReport1               = container "BI Report 1" "BI Report" "Power BI" "Power BI Report"
                biReport2               = container "BI Report 2" "BI Report" "Power BI" "Power BI Report"
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
        enrichmentApplication -> ingestionContainer "Is a datasource for"
        erpSystem -> ingestionContainer "ERP Data"
        crmSystem -> ingestionContainer "CRM Data"

        ingestionContainer      -> in2daContainer "Is a datasource for"
        in2daContainer          -> daContainer "Transforms data for"

        daContainer             -> da2baContainer "Is input for"
        da2baContainer          -> baContainer "Transforms data for"

        baContainer             -> ba2iaContainer "Is a datasource for"
        ba2iaContainer          -> iaContainer "Transforms data for"

        orchestrationContainer  -> in2daContainer "Orchestrates"
        orchestrationContainer  -> da2baContainer "Orchestrates"
        orchestrationContainer  -> ba2iaContainer "Orchestrates"
        

        maContainer -> daContainer "Describes"
        maContainer -> baContainer "Describes"
        maContainer -> iaContainer "Describes"

        daContainer -> dqContainer "Is validated by"
        baContainer -> dqContainer "Is validated by"
        dqContainer -> maContainer "Store DQ data in "

        # relationships between components
        biEnterpriseDataSet -> biDomainDataSet1 "Is a dataset for"
        biEnterpriseDataSet -> biDomainDataSet2 "Is a dataset for"
        biDomainDataSet1 -> biReport1 "Is a datasource for"
        biDomainDataSet2 -> biReport2 "Is a datasource for"
        
        
            
    }
