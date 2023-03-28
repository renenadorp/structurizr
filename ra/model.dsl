
     model {
            

#/*     
        group "People" {
            erpStaff    = person "ERP Staff" "ERP" "Internal Staff"
            crmStaff    = person "CRM Staff" "CRM Staff" "Internal Staff"


            dataOwner   = person "Data Owner" "CRM Staff" "Internal Staff"
            dataExpert  = person "Data Expert" "CRM Staff" "Internal Staff"
            dataSteward = person "Data Steward" "Data Steward" "Internal Staff"

            reportUser  = person "Reporting Staff" "Reporting Staff" "Internal Staff"
            dataScientist = person "Data Scientist" "Data Science Staff" "Internal Staff"
#*/ 
        }

        group "Source Systems" {

            srcSystem           = softwaresystem "Source System" "Some Source System" "System OutScope"

            erpSystem           = softwaresystem "ERP System" "Enterprise Resource Planning" "System OutScope"
            crmSystem           = softwaresystem "CRM System" "Customer Relationship Management System" "System OutScope"
            wmsSystem           = softwaresystem "WMS" "Warehouse Management System" "System OutScope"
            hrmSystem           = softwaresystem "HRM" "Human Resource Management System" "System OutScope"
            iamSystem           = softwaresystem "IAM" "Identity & Access Management System" "System InScope"
            mdmSystem           = softwaresystem "Masterdata System" "Masterdata " "System OutScope"

        }

        DataPlatformSystem = softwaresystem "Enterprise Data Platform" "Data platform." "System InScope" {
            inContainer             = container "Ingestion Area" "Ingest" "<Technology used>" "Datalake"
            daContainer             = container "Data Area" "Staging" ".." "Database"
            da2baContainer          = container "Business Area Transformation" "" "" "Component"
            ba2iaContainer          = container "Information Area Transformation" "" "" "Component"
            in2daContainer          = container "Data Area Transformation" "" "" "Component"
            baContainer             = container "Business Area" "Business Area" ".." "Database" {
                baSchemaComponent           = component "Business Area Schema" "Business Area" "Database Schema" "Database Schema" {
                    tags "Database Schema"
                } 
                baEntityScriptComponent     = component "Business Area Entity Script" "Business Area" "SQL" "Database SQL Script" {
                    tags "Database SQL Script"
                }

            }
            iaContainer             = container "Information Area" "Information Area" "" "Database"
            maContainer             = container "Metadata Area" "Metadata" "" "Database"

            orchContainer  = container "Orchestration Engine" "Orchestration" "" "" {
                orchestrationComponent = component "OrchestrationComponent" "Orchestration" "" "Microsoft Azure - Data Factories"
            }
        }
        
        metadataSystem = softwaresystem "Metadata System" "Metadata System" "System InScope" {
            businessGlossaryContainer = container "Business Glossary" "Business Glossary" "" {
                tags "Business Glossary"
                }
            dataCatalogContainer    = container "Data Catalog" "Catalog" "" "Data Catalog"
            dataLineageContainer    = container "Data Lineage" "Data Lineage" "" "Data Lineage Container"
            dataModelContainer      = container "Data Model" "Data Model" "" "Data Model Container"
            dqContainer             = container "Data Quality Engine" "Data Quality Engine" "" "Component"


        }
        
        enrichtmentSystem = softwaresystem "Enrichment System" "Data Enrichment" "System InScope" {
            enrichmentApplication   = container "Data Enrichment Web Application" "Database" "App"

        }

        group "Target Systems" {
        EnterpriseReportingSystem = softwaresystem "Enterprise Reporting" "Enterprise Reporting" "System InScope" {
            biEnterpriseDataSet     = container "BI Enterprise Dataset" "BI Dataset" "Power BI" "Dataset - PowerBI"
            biDomainDataSet1        = container "BI Domain Dataset 1" "BI Dataset" "Power BI" "Dataset - PowerBI"
            biDomainDataSet2        = container "BI Domain Dataset 2" "BI Dataset" "Power BI" "Dataset - PowerBI"
            biReport1               = container "BI Report 1" "BI Report" "Power BI" "Power BI Report"
            biReport2               = container "BI Report 2" "BI Report" "Power BI" "Power BI Report"
        }
        EnterprisePortalSystem = softwaresystem "Enterprise Poral" "Enterprise Portl" "System OutScope" {

        }
        monitoringSystem = softwaresystem " Monitoring System" "Monitoring" "System InScope" {
            dpMonitoring = container "Data Platform Monitoring Service" "BI Dataset" "Power BI" "Monitoring - "
            dpAlerting   = container "Data Platform Alerting Service" "BI Report" "Power BI" "Alerting - OpsGenie"
        }

        }

        group "Relations" {
            # relationships between people and software systems
        
            erpStaff        -> erpSystem "Uses"
            crmStaff        -> crmSystem "Uses"
            dataSteward     -> metadataSystem "Uses"
            dataSteward     -> mdmSystem "Uses"
            dataExpert      -> metadataSystem "Data Expert"
            dataOwner       -> metadataSystem "Data Owner"
            reportUser      -> EnterpriseReportingSystem
            
            /*
            dataScientist   -> inContainer
            dataScientist   -> daContainer
            dataScientist   -> baContainer
            dataScientist   -> iaContainer
            */
    

            # relationships between software systems and software systems

            mdmSystem                    -> dataPlatformSystem           "Master Data"
            DataPlatformSystem           -> EnterpriseReportingSystem    "Is datasource for"
            DataPlatformSystem           -> EnterprisePortalSystem    "Is datasource for"
            srcSystem                    -> dataPlatformSystem           "Is a datasource for"
            monitoringSystem             -> DataPlatformSystem           "Monitors"
            // MetaDataSystem               -> DataPlatformSystem           "Describes"
            // MetaDataSystem               -> EnterpriseReportingSystem    "Describes"
            iamSystem -> dataPlatformSystem "Manages access to"
            iamSystem -> EnterpriseReportingSystem "Manages access to"
            iamSystem -> enrichtmentSystem "Manages access to"


            # relationships between containers
            enrichmentApplication -> inContainer "Is a datasource for"
            erpSystem -> inContainer "ERP Data"
            crmSystem -> inContainer "CRM Data"

            inContainer      -> in2daContainer "Is a datasource for"
            in2daContainer          -> daContainer "Transforms data for"

            daContainer             -> da2baContainer   "Is input for"
            da2baContainer          -> baContainer      "Transforms data for"

            baContainer             -> ba2iaContainer   "Is a datasource for"
            ba2iaContainer          -> iaContainer      "Transforms data for"

            orchContainer  -> in2daContainer "Orchestrates"
            orchContainer  -> da2baContainer "Orchestrates"
            orchContainer  -> ba2iaContainer "Orchestrates"

            orchContainer  -> monitoringSystem "Sends status updates to "
            

            maContainer -> daContainer "Describes"
            maContainer -> baContainer "Describes"
            maContainer -> iaContainer "Describes"

            daContainer -> dqContainer "Is validated by"
            baContainer -> dqContainer "Is validated by"
            dqContainer -> maContainer "Store data validation results data in "

            businessGlossaryContainer    -> baContainer                  "Describes"

            # relationships between components
            biEnterpriseDataSet -> biDomainDataSet1 "Links selected datasets to"
            biEnterpriseDataSet -> biDomainDataSet2 "Links selected datasets to"

            biDomainDataSet1 -> biReport1 "Is a datasource for"
            biDomainDataSet2 -> biReport2 "Is a datasource for"
        }
        
            
    }
