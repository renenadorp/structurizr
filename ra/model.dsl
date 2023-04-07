
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

        group "Bron Systemen" {

            srcSystem           = softwaresystem "Source System" "Some Source System" {
                tags "System" "OutScope"
            }

            erpSystem           = softwaresystem "ERP System" "Enterprise Resource Planning" {
                tags "System" "OutScope"
            }
            crmSystem           = softwaresystem "CRM System" "Customer Relationship Management System"   {
                tags "System" "OutScope"
            }
            wmsSystem           = softwaresystem "WMS" "Warehouse Management System"   {
                tags "System" "OutScope"
            }
            hrmSystem           = softwaresystem "HRM" "Human Resource Management System"   {
                tags "System" "OutScope"
            }
            iamSystem           = softwaresystem "IAM" "Identity & Access Management System" "System InScope"  {
                tags "System" "InScope"
            }
            mdmSystem           = softwaresystem "Masterdata System" "Data "   {
                tags "System" "OutScope"
            }
            

        }
        group "Data Platform" {
            enrichtmentSystem = softwaresystem "Enrichment System" "Data Enrichment" "" {
             
                tags "System" "InScope"
            
            enrichmentApplication   = container "Data Enrichment Web Application" "Database" "App"

        }
            DataPlatformSystem = softwaresystem "Enterprise Data Platform" "Data platform." "System InScope" {
             
                tags "System" "InScope"
            
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
        }
        
        
        group "Metadata Systemen"  {
         metadataSystem = softwaresystem "Metadata System" "Metadata System" "System InScope" {
                tags "System" "InScope"
            
            businessGlossaryContainer = container "Business Glossary" "Business Glossary" "" {
                tags "Business Glossary"
                }
            dataCatalogContainer    = container "Data Catalog" "Catalog" "" "Data Catalog"
            dataLineageContainer    = container "Data Lineage" "Data Lineage" "" "Data Lineage Container"
            dataModelContainer      = container "Data Model" "Data Model" "" "Data Model Container"
            dataQualityContainer    = container "Data Quality Engine" "Data Quality Engine" "" "Component"
        }

        }

        group "Doel Systems" {
            
        
          EnterpriseReportingSystem = softwaresystem "Enterprise Reporting" "Enterprise Reporting" "" {
            tags "System" "InScope"
            biEnterpriseDataSet     = container "BI Enterprise Dataset" "BI Dataset" "Power BI" "Dataset - PowerBI"
            biDomainDataSet1        = container "BI Domain Dataset 1" "BI Dataset" "Power BI" "Dataset - PowerBI"
            biDomainDataSet2        = container "BI Domain Dataset 2" "BI Dataset" "Power BI" "Dataset - PowerBI"
            biReport1               = container "BI Report 1" "BI Report" "Power BI" "Power BI Report"
            biReport2               = container "BI Report 2" "BI Report" "Power BI" "Power BI Report"
            }

            EnterprisePortalSystem = softwaresystem "Enterprise Portal" "Enterprise Portal" "" {
                tags "System" "OutScope"

            }
            monitoringSystem = softwaresystem "Monitoring System" "Monitoring" "" {
                tags "System" "InScope"
                dpMonitoring = container "Data Platform Monitoring Service" "BI Dataset" "Power BI" "Monitoring - "
                dpAlerting   = container "Data Platform Alerting Service" "BI Report" "Power BI" "Alerting - OpsGenie"
            }

            dataSharingSystem = softwaresystem "Data Sharing System" "Data Sharing" ""  {
                tags "System" "OutScope"
            }

            dataScienceSystem = softwaresystem "Data Science System" "Data Science" {
                tags "System" "InScope"
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
    

            # SYSTEM
            mdmSystem                    -> dataPlatformSystem          "Data"
            DataPlatformSystem           -> dataSharingSystem           "Data"
            DataPlatformSystem           -> EnterpriseReportingSystem   "Data"
            DataPlatformSystem           -> EnterprisePortalSystem      "Data"
            srcSystem                    -> dataPlatformSystem          "Data" "Source to DP"
            DataPlatformSystem           -> srcSystem                   "Data" "DP to source"
            DataPlatformSystem           -> dataScienceSystem           "Data" 
            dataScienceSystem            -> DataPlatformSystem          "Model"

            iamSystem -> dataPlatformSystem         "Access"
            iamSystem -> EnterpriseReportingSystem  "Access" 
            iamSystem -> enrichtmentSystem          "Access"
            iamSystem -> dataScienceSystem          "Access"
            iamSystem -> metaDataSystem          "Access"
            iamSystem -> MonitoringSystem          "Access"


            # CONTAINER
            enrichmentApplication -> inContainer "Data"
            erpSystem       -> inContainer      "Data"
            crmSystem       -> inContainer      "Data"
            wmsSystem       -> inContainer      "Data"

            inContainer     -> in2daContainer   "Data"
            in2daContainer  -> daContainer      "Transform"

            daContainer     -> da2baContainer   "Data"
            da2baContainer  -> baContainer      "Transform"

            baContainer     -> ba2iaContainer   "Data"
            ba2iaContainer  -> iaContainer      "Transform"

            orchContainer   -> in2daContainer   "Orchestrate"
            orchContainer   -> da2baContainer   "Orchestrate"
            orchContainer   -> ba2iaContainer   "Orchestrate"

            orchContainer   -> monitoringSystem "Status"
            

            daContainer -> maContainer  "Metadata"
            daContainer -> maContainer  "Metadata"
            iaContainer -> maContainer  "Metadata"

            daContainer -> dataQualityContainer "Metadata"
            baContainer -> dataQualityContainer "Metadatata"
            #dataQualityContainer -> maContainer "Metadata"

            #businessGlossaryContainer    -> baContainer "Describe"

            #COMPONENT
            biEnterpriseDataSet -> biDomainDataSet1 "Dataset Link"
            biEnterpriseDataSet -> biDomainDataSet2 "Dataset Link"

            biDomainDataSet1 -> biReport1 "Data"
            biDomainDataSet2 -> biReport2 "Data"

            biReport1 -> dataCatalogContainer "Metadata"
            biReport2 -> dataCatalogContainer "Metadata"
            
        }
        
            
    }
