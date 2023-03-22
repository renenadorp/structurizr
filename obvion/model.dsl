
     model {
            

#/*     
        group "People" {
            #erpStaff    = person "ERP Staff" "ERP" "Internal Staff"
            
#*/ 
        }

        group "Source Systems" {
            shsSystem           = softwaresystem "Stater Hypotheek System" "Stater" "System OutScope" 
            crmSystem           = softwaresystem "CRM System" "Customer Relationship Management System" "System OutScope" {
                crmViews = container "CRM Views"

            }
        }

        group "Data & Analytics" {
            FTPSystem = softwaresystem "FTP Server" {
                ingContainer = container "Ingest"  "" "" "File Server" 
                   
            }

            DataPlatformSystem = softwaresystem "Data Platform System" "" {
                    sdaContainer = container "SDA"  "" "" "Database" {
                        digbdaComponent = component "DIG_BDA" "" "" "Stored Procedure"
                        sdaDataComponent = component "SDA Data" "" "" ""
                    }
                    bdaContainer = container "BDA" "" "" "Database" {
                        digdwaComponent = component "DIG_DWA" "" "" "Stored Procedure"
                        bdaDataComponent = component "BDA Data" "" "" "" 

                    }
                    dwaContainer = container "DWA" "" "" "Database" {
                        dwaDataComponent = component "DWA Data" "" "" "" 
                    }
                    fraContainer = container "FRA" "" "" "Database" {
                        digfraComponent = component "DIG_FRA" "" "" ""
                        fraDataComponent = component "FRA Data" "" ""
                    }
                    edaContainer = container "EDP" "" "" "Database - Virtual"
                    ddaContainer = container "DDA" "" "" "Database"
                     
            }
            ReportingSystem  = softwaresystem "Reporting System" "Microstrategy" "" {
                biReportingEngine = container "Reporting Engine" "Microstrategy"
                biReport = container "Report" "Microstrategy Report"
            }
            
            etlSystem        = softwaresystem "ETL System" "" "Data Processing" {
                etldailyContainer  = container "ETL Daily" "Pentaho Job" "ETL - Pentaho Job"
                etlsdaContainer  = container "SDA Main" "Pentaho Job" "ETL - Pentaho Job"
                etlbdaContainer   = container "BDA Main" "Pentaho Job" "ETL - Pentaho Job"
                etlfraContainer  = container "FRA Main" "Pentaho Job" "ETL - Pentaho Job"
                etldwaContainer = container "DWA Main" "Pentaho Job" "ETL - Pentaho Job" 
                etlexpContainer = container "DDA Main" "Pentaho Job" "ETL - Pentaho Job" 
                
                scdContainer        = container "SCD" "" "ETL - Java"
                islContainer        = container "ISL" "" "ETL - Java"
            
                }
            }
            

            
        

        group "Relations" {
            # relationships between people and software systems        
            #dataSteward     -> metadataSystem "Uses"
        
            # relationships between software systems and software systems

            shsSystem       -> ingContainer     "Push"
            crmViews        -> islContainer     "Pull"

            # DAILY
            etldailyContainer -> etlsdaContainer "Triggers"
            etldailyContainer -> etlfraContainer "Triggers"
            etldailyContainer -> etlbdaContainer "Triggers"
            etldailyContainer -> etldwaContainer "Triggers"
            etldailyContainer -> etlexpContainer "Triggers"


            # SDA
            ingContainer    -> etlsdaContainer "Datasource for"
            etlsdaContainer -> islContainer "Triggers"
            etlsdaContainer -> scdContainer "Triggers"
            scdContainer    -> sdaContainer "Historize"
            islContainer    -> sdaContainer "Load"

            # BDA
            etlbdaContainer -> digbdaComponent  "Triggers"
            sdaDataComponent    -> digbdaComponent  "Datasource for"
            digbdaComponent -> bdaContainer     "Transform"

            # DWA
            etldwaContainer -> digdwaComponent "Triggers"
            bdaDataComponent   -> digdwaComponent "Datasource for"        
            digdwaComponent -> dwaContainer "Transform"

            # FRA
            etlfraContainer -> digfraComponent "Triggers"
            bdaDataComponent   -> digfraComponent  "Transform"
            digfraComponent -> fraDataComponent "Transform"

            # EDA
            sdaContainer -> edaContainer "Read Only"
            bdaContainer -> edaContainer "Read Only"
            dwaContainer -> edaContainer "Read Only"
            fraContainer -> edaContainer "Read Only"
            
            # REPORTING
            dwaContainer -> biReport   "Provides data to"



        }
        
        group "DeploymentEnvironments" {
            deploymentEnvironment "Live" {
                deploymentNode "Data Center - Previder" {

                    deploymentNode "FTP Server" {
                        IngestInstance = containerInstance ingContainer
                        }
                    deploymentNode "ETL Server" {
                        deploymentNode "Java VM" {
                            scdInstance = containerInstance scdContainer
                            islInstance = containerInstance islContainer
                        }
                        deploymentNode "Pentaho Data Integration" {
                            etldailyInstance = containerInstance etldailyContainer
                        }
                    }        
                    deploymentNode "Netezza" {
                        tags "Dataplatform - Netezza"
                        sdaInstance = containerInstance sdaContainer
                        bdaInstance = containerInstance bdaContainer
                        dwaInstance = containerInstance dwaContainer
                        fraInstance = containerInstance fraContainer
                        ddaInstance = containerInstance ddaContainer

              
                        
                    }
                    deploymentNode "Windows" {
                        ReportingInstance = containerInstance biReportingEngine
                    }
            
                }
            }
            
        }
     }
