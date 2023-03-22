
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
                    sdaContainer = container "SDA"  "" "Database - Netezza" "Database" {
                        digbdaComponent = component "DIG_BDA" "" "Stored Procedure - Netezza" "Stored Procedure"
                        sdaDataComponent = component "SDA Data" "" "Table - Netezza" ""
                    }
                    bdaContainer = container "BDA" "" "Database - Netezza" "Database" {
                        digdwaComponent = component "DIG_DWA" "" "" "Stored Procedure"
                        bdaDataComponent = component "BDA Data" "" "" "" 

                    }
                    dwaContainer = container "DWA" "" "Database - Netezza" "Database" {
                        dwaDataComponent = component "DWA Data" "" "" "" 
                    }
                    fraContainer = container "FRA" "" "Database - Netezza" "Database" {
                        digfraComponent = component "DIG_FRA" "" "" ""
                        fraDataComponent = component "FRA Data" "" ""
                    }
                    edaContainer = container "EDP" "" "Database - Netezza" "Database - Virtual"
                    ddaContainer = container "DDA" "" "Database - Netezza" "Database"
                     
            }
            privateReportingSystem  = softwaresystem "Reporting System" "Microstrategy" "" {
                privateBIEngine = container "Reporting Engine" "Reporting - Microstrategy" {
                    tags "Reporting - Microstrategy"
                    privateBIReport = component "Report" "Microstrategy Report"

                }
            }
            
            cloudReportingSystem  = softwaresystem "Power BI Service" "Power BI" "" {
                cloudBIEngine = container "Reporting Engine" "Reporting - Power BI" {
                    tags "Reporting - Power BI"
                    cloudBIReport = component "Report" "Power BI Report"

                }
            }
            
            
            etlSystem        = softwaresystem "ETL System" "" "Data Processing" {
                etlEngine  = container "ETL Engine" "Pentaho Server" "ETL - Pentaho Server" {
                    etlDailyComponent  = component "Daily Main" "Pentaho Job" "ETL - Pentaho Job"
                    etlsdaComponent    = component "SDA Main" "Pentaho Job" "ETL - Pentaho Job"
                    etlbdaComponent    = component "BDA Main" "Pentaho Job" "ETL - Pentaho Job"
                    etlfraComponent    = component "FRA Main" "Pentaho Job" "ETL - Pentaho Job"
                    etldwaComponent    = component "DWA Main" "Pentaho Job" "ETL - Pentaho Job" 
                    etlexpComponent    = component "DDA Main" "Pentaho Job" "ETL - Pentaho Job" 
                }
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
            etlDailyComponent -> etlsdaComponent ""
            etlDailyComponent -> etlfraComponent ""
            etlDailyComponent -> etlbdaComponent ""
            etlDailyComponent -> etldwaComponent ""
            etlDailyComponent -> etlexpComponent ""


            # SDA
            ingContainer    -> etlsdaComponent "Datasource for"
            etlsdaComponent -> islContainer ""
            etlsdaComponent -> scdContainer ""
            scdContainer    -> sdaContainer ""
            islContainer    -> sdaContainer ""

            # BDA
            etlbdaComponent -> digbdaComponent  ""
            sdaDataComponent    -> digbdaComponent  ""
            digbdaComponent -> bdaContainer     ""

            # DWA
            etldwaComponent -> digdwaComponent ""
            bdaDataComponent   -> digdwaComponent ""        
            digdwaComponent -> dwaContainer ""

            # FRA
            etlfraComponent -> digfraComponent ""
            bdaDataComponent   -> digfraComponent  ""
            digfraComponent -> fraDataComponent ""

            # EDA
            sdaContainer -> edaContainer "Read Only"
            bdaContainer -> edaContainer "Read Only"
            dwaContainer -> edaContainer "Read Only"
            fraContainer -> edaContainer "Read Only"
            
            # REPORTING
            dwaContainer -> privateBIReport   "Provides data to"
            dwaContainer -> cloudBIReport   "Provides data to"



        }
        
        group "DeploymentEnvironments" {
            deploymentEnvironment "Live" {
                deploymentNode "Data Center - Centric" {

                    deploymentNode "FTP Server" {
                        IngestInstance = containerInstance ingContainer
                        }
                    }

                    deploymentNode "Power BI Service" {
                        tags "Reporting - Power BI"
                        cloudReportingInstance = containerInstance cloudBIEngine
                    }
                deploymentNode "Data Center - Previder" {

                    deploymentNode "ETL Server" {
                        deploymentNode "Java VM" {
                            tags "Java VM"
                            scdInstance = containerInstance scdContainer
                            islInstance = containerInstance islContainer
                        }
                        deploymentNode "Pentaho Data Integration" {
                            tags "ETL - Pentaho"
                            etlEngineInstance = containerInstance etlEngine
                        }
                    }     
                    deploymentNode "Linux" {   
                        deploymentNode "Netezza" {
                            tags "Dataplatform - Netezza"
                            sdaInstance = containerInstance sdaContainer
                            bdaInstance = containerInstance bdaContainer
                            dwaInstance = containerInstance dwaContainer
                            fraInstance = containerInstance fraContainer
                            ddaInstance = containerInstance ddaContainer

                    }                        
                    }
                    deploymentNode "Windows" {
                        deploymentNode "Microstrategy Server" {
                            tags "BI - Microstrategy"
                            ReportingInstance = containerInstance privateBIEngine
                        }
                    }
            
                }
            }
            
        }
     }
