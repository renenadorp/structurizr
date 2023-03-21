
     model {
            

#/*     
        group "People" {
            #erpStaff    = person "ERP Staff" "ERP" "Internal Staff"
            
#*/ 
        }

        group "Source Systems" {

            shsSystem           = softwaresystem "Stater Hypotheek System" "Stater" "System OutScope"

            crmSystem           = softwaresystem "CRM System" "Customer Relationship Management System" "System OutScope"

        }
        group "Core Dataplatform" {
            DataPlatformSystem = softwaresystem "Data Platform" "Netezza" {
                tags  "Database"
                ingContainer             = container "Ingestion Area" "Ingest" "<Technology used>" "FTP Server" {                
                }
                sdaContainer             = container "Staging Data Area" "Staging" ".." "" {
                    tags "Database - Netezza"
                    technology "Netezza"

                }

                sda2bdaContainer         = container "Business Data Area Transformation" "" "" "Component"
                ing2sdaContainer         = container "Staging Data Area Transformation" "" "" "Component"
                bda2dwaContainer         = container "Datawarehouse Area Transformation" "" "" "Component"
                dwa2sdaContainer         = container "Data Area Transformation" "" "" "Component"
                bdaContainer             = container "Business Area" "Business Area" ".." "Database" 
                dwaContainer             = container "Information Area" "Information Area" ".." "Database" 
                fraContainer             = container "Finance & Risk Area" "FRA Area" "" "Database"
                maContainer              = container "Metadata Area" "Metadata" "" "Database"
            }
            OrchestrationSystem = softwaresystem "ETL Server" "ETL" "System InScope"
            
        }

        group "Target Systems" {
            EnterpriseReportingSystem = softwaresystem "Enterprise Reporting" "Enterprise Reporting" "System InScope" 
            monitoringSystem = softwaresystem " Monitoring System" "Monitoring" "System InScope" {
                dpMonitoring = container "Data Platform Monitoring Service" "BI Dataset" "Power BI" "Monitoring - "
                dpAlerting   = container "Data Platform Alerting Service" "BI Report" "Power BI" "Alerting - OpsGenie"
                dqContainer  = container "Data Quality Service" "DQ" "DQ" "DQ"
            }

        }

        group "Relations" {
            # relationships between people and software systems
        

            #dataSteward     -> metadataSystem "Uses"
        
    

            # relationships between software systems and software systems

            DataPlatformSystem           -> EnterpriseReportingSystem    "Is datasource for"
            shsSystem                    -> dataPlatformSystem           "Is datasource for"


            # relationships between containers
            crmSystem -> ingContainer "CRM Data"

            ingContainer      -> ing2sdaContainer "Is a datasource for"
            ing2sdaContainer          -> sdaContainer "Transforms data for"

            sdaContainer             -> sda2bdaContainer   "Is input for"
            sda2bdaContainer          -> bdaContainer      "Transforms data for"

            bdaContainer             -> bda2dwaContainer   "Is a datasource for"
            bda2dwaContainer          -> dwaContainer      "Transforms data for"

            orchestrationSystem  -> ing2sdaContainer "Orchestrates"
            orchestrationSystem  -> sda2bdaContainer "Orchestrates"
            orchestrationSystem  -> bda2dwaContainer "Orchestrates"

            orchestrationSystem  -> monitoringSystem "Sends status updates to "
            



            # relationships between components
  
        }
        
            
    }
