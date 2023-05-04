
     model {
            
     
        group "Data Platform" {
            enrichtmentSystem = softwaresystem "Enrichment System" "Data Enrichment" "" {
             
                tags "System" "InScope"
                enrichmentApplication   = container "Data Enrichment Web Application" "Database" "App"

                }
            DataPlatformSystem = softwaresystem "Enterprise Data Platform" "Data platform." "System InScope" {
             
                tags "System" "InScope"
            
                laContainer             = container "Lake Area" "Ingest" "" "Datalake"
                daContainer             = container "Data Area" "Staging" "" "Database"
                da2baContainer          = container "Business Area Transformation" "" "" "Module"
                ba2iaContainer          = container "Information Area Transformation" "" "" "Module"
                in2daContainer          = container "Data Area Transformation" "" "" "Module"
                baContainer             = container "Business Area" "Business Area" "" "Database" {
                    baSchemaComponent           = component "Business Area Schema" "Business Area" "" "" {
                        tags  "Database Schema"
                    } 
                    baEntityScriptComponent     = component "Business Area Entity Script" "Business Area" "SQL" "" {
                        tags "Script"
                    }

                }
                iaContainer             = container "Information Area" "Information Area" "" "Database Schema" {
                    iaSchemaComponent   = component "Information Area Object" {
                        tags "Script"
                    }
                    iaObjectScriptComponent = component "Information Area Object Script" {
                        tags "Database Schema"
                    }
                }
                xaContainer             = container "Exploration Area" "Exploration" "" "Database" {
                    xaSchemaComponent = component "Exploration Area Object" {
                        tags "Database Schema"
                    }
                    xaObjectScriptComponent = component "Exploration Area Object Script" {
                        tags "Script"
                    }
                    
                    }
                maContainer             = container "Metadata Area" "Metadata" "" "Database" {
                    maSchemaComponent = component "Metadata Area Object" {
                        tags "Database Schema"
                    }
                    maObjectScriptComponent = component "Metadata Area Object Script" {
                        tags "Script"
                    }
                    
                    }


                orchContainer  = container "Orchestration Engine" "Orchestration" "" "" {
                    tags "Module"
                    orchestrationComponent = component "OrchestrationComponent" "Orchestration" "" "" 
                }
            }
        
  
            metadataSystem = softwaresystem "Metadata System" "Metadata System" "System InScope" {
                tags "System" "InScope"
            
            businessGlossaryContainer = container "Business Glossary" "Business Glossary" "" {
                tags "Business Glossary"
                }
            maGeneralContainer      = container "Metadata General" "" "" ""  {
                description "General purpose or temporary placeholder"
            }
            dataCatalogContainer    = container "Data Catalog" "Catalog" "" "Data Catalog" 
            dataLineageContainer    = container "Data Lineage" "Data Lineage" "" "Data Lineage Container"
            dataModelContainer      = container "Data Model" "Data Model" "" "Data Model Container"
            dataQualityContainer    = container "Data Quality Engine" "Data Quality Engine" "" "Module"
                }
            
        
          EnterpriseReportingSystem = softwaresystem "Enterprise Reporting" "Enterprise Reporting" "" {
            tags "System" "InScope"
            biEnterpriseDataSet     = container "BI Enterprise Dataset" "BI Dataset" "Power BI" "Dataset - PowerBI"
            biDomainDataSet1        = container "BI Domain Dataset 1" "BI Dataset" "Power BI" "Dataset - PowerBI"
            biDomainDataSet2        = container "BI Domain Dataset 2" "BI Dataset" "Power BI" "Dataset - PowerBI"
            biReport1               = container "BI Report 1" "BI Report" "Power BI" "Power BI Report"
            biReport2               = container "BI Report 2" "BI Report" "Power BI" "Power BI Report"
            }


            monitoringSystem = softwaresystem "Monitoring System" "Monitoring" "" {
                tags "System" "InScope"
                dpMonitoring = container "Data Platform Monitoring Service" "BI Dataset" "Power BI" "Monitoring"
                dpAlerting   = container "Data Platform Alerting Service" "BI Report" "Power BI" "Alerting - OpsGenie"
            }

            dataSharingSystem = softwaresystem "Data Sharing System" "Data Sharing" ""  {
                tags "System" "InScope"
            }

            dataScienceSystem = softwaresystem "Data Science System" "Data Science" {
                tags "System" "InScope"
            }


        }
        group "Personen" {
            erpStaff    = person "ERP Staff" "ERP" "" {
                tags "Internal Staff"
            }
            crmStaff    = person "CRM Staff" "CRM Staff" "Internal Staff"


            dataOwner   = person "Data Owner" "CRM Staff" "Internal Staff"
            dataExpert  = person "Data Expert" "CRM Staff" "Internal Staff"
            dataSteward = person "Data Steward" "Data Steward" "Internal Staff"

            DataManagementEmployee = person "Data Management Medewerker" "" "Internal Staff"

            BusinessUser  = person "Business User" "" "Internal Staff"
            ExternalUser  = person "External User" "" "External Staff"
            BusinessAnalyst  = person "Business Analyst" "" ""{
                tags "Internal Staff"
            }
            DataScientist = person "Data Scientist" "" "Internal Staff"
            BeveiligingEmployee            = person "Beveiliging Medewerker" "" "Internal Staff"
            SupportEmployee            = person "Support Medewerker" "" "Internal Staff"
        }
        group "Business Applicaties" {

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
            EnterprisePortalSystem = softwaresystem "Enterprise Portal" "Enterprise Portal" "" {
                tags "System" "OutScope"

            }
                        CustomerSupportSystem = softwaresystem "Customer Support System" {
                customerTicketing = container "Customer Ticketing System" "" "" "" 
                tags "System" "OutScope"
            }
            

        }
     
        ##########################################
        # RELATIONS
        ##########################################
        
        group "Relations: People" {
            # relationships between people and software systems
        
            erpStaff        -> erpSystem "Uses"
            crmStaff        -> crmSystem "Uses"
            dataSteward     -> metadataSystem "Uses"
            dataSteward     -> mdmSystem "Uses"
            dataExpert      -> metadataSystem "Data Expert"
            dataOwner       -> metadataSystem "Data Owner"

            ExternalUser      -> DataSharingSystem
            BusinessUser      -> EnterpriseReportingSystem

            DataManagementEmployee -> EnterpriseReportingSystem
            DataManagementEmployee -> dataPlatformSystem
            DataManagementEmployee -> enrichtmentSystem
            BusinessAnalyst -> dataPlatformSystem
            DataManagementEmployee -> metadataSystem
            BeveiligingEmployee -> iamSystem
            DataScientist -> dataScienceSystem
            SupportEmployee -> MonitoringSystem
            SupportEmployee -> customerTicketing
         }
        group "Relations: Systems" {
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
            iamSystem -> DataSharingSystem          "Access"
            }
        group "Relations: Containers" {
            enrichmentApplication -> laContainer "Data"
            erpSystem       -> laContainer      "Data"
            crmSystem       -> laContainer      "Data"
            wmsSystem       -> laContainer      "Data"

            laContainer     -> in2daContainer   "Data"
            in2daContainer  -> daContainer      "Transform"

            daContainer     -> da2baContainer   "Data"
            da2baContainer  -> baContainer      "Transform"

            baContainer     -> ba2iaContainer   "Data"
            ba2iaContainer  -> iaContainer      "Transform"

            orchContainer   -> in2daContainer   "Orchestrate"
            orchContainer   -> da2baContainer   "Orchestrate"
            orchContainer   -> ba2iaContainer   "Orchestrate"

            orchContainer   -> monitoringSystem "Metadata" "Status"
            

            daContainer -> maContainer  "Metadata"
            daContainer -> maContainer  "Metadata"
            iaContainer -> maContainer  "Metadata"

            daContainer -> maContainer "Metadata"
            baContainer -> maContainer "Metadata"
            iaContainer -> maContainer "Metadata"
            maGeneralContainer -> maContainer 

            dpMonitoring -> customerTicketing "Ticket"

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
        group "Relations: Components" {
            }
        
            
    }
 
