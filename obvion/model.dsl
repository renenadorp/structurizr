
     model {
            
     
        group "People" {
            #erpStaff    = person "ERP Staff" "ERP" "Internal Staff"
            
 
        }

        group "Source Systems" {
            shsSystem           = softwaresystem "Stater Hypotheek System" "Stater" "System OutScope" {
                shsContainer    = container "SHS"
                shsdwhContainer = container "SHSDWH"
                tmnContainer    = container "TMN"
            }
            crmSystem           = softwaresystem "CRM System" "Customer Relationship Management System" "System OutScope" {
                crmContainer = container "CRM"
                crmViews = container "CRM Views"

            }
        }

        group "Data & Analytics" {
            FTPSystem               = softwaresystem "FTP Server" {
                tags "FTP Server"
                shsDataFull  = container "SHS Data Full"  "" "" "Zip" 
                shsDataDelta = container "SHS Data Delta"  "" "" "Zip" 
                tmnDataFull  = container "TMN Data Full" "" "" "Zip"
                }

            DataPlatformSystem      = softwaresystem "Data Platform System" "" {
                    sdaContainer = container "SDA"  "" "Netezza" "Database - Netezza" {
                        digbdaComponent = component "DIG_BDA" "" "Stored Procedure - Netezza" "Stored Procedure"
                        sdaDataComponent = component "SDA Data" "" "Table - Netezza" ""
                    }
                    bdaContainer = container "BDA" "" "Database - Netezza" "Database - Netezza" {
                        digdwaComponent = component "DIG_DWA" "" "" "Stored Procedure"
                        bdaDataComponent = component "BDA Data" "" "" "" 

                    }
                    dwaContainer = container "DWA" "" "Netezza" "Database - Netezza" {
                        dwaDataComponent = component "DWA Data" "" "" "" 
                    }
                    fraContainer = container "FRA" "" "Netezza" "Database - Netezza" {
                        digfraComponent = component "DIG_FRA" "" "" ""
                        fraDataComponent = component "FRA Data" "" ""
                    }
                    edaContainer = container "EDP" "" "Database" "Database - Netezza"
                    ddaContainer = container "DDA" "" "Database - Netezza" "Database - Netezza" {
                        ddaDataComponent = component "DDA Data" "" ""

                    }
                     
                }
            MicrostrategyReportingSystem  = softwaresystem "Reporting System" "Microstrategy" "" {
                dwaReportsMicrostrategy = container "DWA Reports - Microstrategy" "Microstrategy" "Microstrategy" {
                    tags "Reporting - Microstrategy"
                    description "Microstrategy"
                    properties {
                        version "??.??"
                    }
                    privateBIReport = component "Report" "Microstrategy Report"

                }
                }        
            PowerBIReportingSystem    = softwaresystem "Power BI Service" "Power BI" "" {
                dwaReportsPowerBI = container "DWA Reports - Power BI" "Reporting - Power BI" {
                    tags "Reporting - Power BI"
                    PowerBIReport = component "Report" "Power BI Report"

                }
            }
            
            
            etlSystem               = softwaresystem "ETL System" "" "Data Processing" {
                etlEngine  = container "ETL Engine" "Pentaho Server" "" {
                    tags "ETL - Pentaho"
                    etlDailyComponent  = component "Daily Main" "Pentaho Job" "ETL - Pentaho Job"
                    etlsdaComponent    = component "SDA Main" "Pentaho Job" "ETL - Pentaho Job"
                    etlbdaComponent    = component "BDA Main" "Pentaho Job" "ETL - Pentaho Job"
                    etlfraComponent    = component "FRA Main" "Pentaho Job" "ETL - Pentaho Job"
                    etldwaComponent    = component "DWA Main" "Pentaho Job" "ETL - Pentaho Job" 
                    etlexpComponent    = component "DDA Main" "Pentaho Job" "ETL - Pentaho Job" 
                }
                scdContainer        = container "SCD" "" "Java - Jar" {
                    description "Java component for historization (Slowly Changing Dimensions)"
                    tags "Java - Jar"
                }
                islContainer        = container "ISL" "" "ETL - Java" {
                    tags "Java - Jar"
                    description "Java component ingesting data (Inergy Smart Loader)"

                }
            
                }
             }       
        
        #
        # Relations
        group "Relations" {

            # SHS
            shsContainer -> shsdwhContainer     "Push"
            shsdwhContainer -> shsDataFull      "Push"
            shsdwhContainer -> shsDataDelta     "Push"

            tmnContainer -> tmnDataFull "Push"

            # CRM
            crmContainer -> crmViews "Read"
            crmViews        -> islContainer     "Pull"

            # DAILY
            etlDailyComponent -> etlsdaComponent ""
            etlDailyComponent -> etlfraComponent ""
            etlDailyComponent -> etlbdaComponent ""
            etlDailyComponent -> etldwaComponent ""
            etlDailyComponent -> etlexpComponent ""


            # SDA
            shsDataFull     -> etlsdaComponent "Datasource for"
            shsDataDelta    -> etlsdaComponent "Datasource for"
            etlsdaComponent -> islContainer ""
            etlsdaComponent -> scdContainer ""
            scdContainer    -> sdaContainer ""
            islContainer    -> sdaContainer ""

            # BDA
            etlbdaComponent  -> digbdaComponent  ""
            sdaDataComponent -> digbdaComponent  ""
            digbdaComponent  -> bdaContainer     ""

            # DWA
            etldwaComponent  -> digdwaComponent ""
            bdaDataComponent -> digdwaComponent ""        
            digdwaComponent  -> dwaContainer ""

            # FRA
            etlfraComponent  -> digfraComponent ""
            bdaDataComponent -> digfraComponent  ""
            digfraComponent  -> fraDataComponent ""
 
            # DDA
            bdaDataComponent -> ddaDataComponent "Data Delivery"
    
            # EDA
            sdaContainer -> edaContainer "Read Only"
            bdaContainer -> edaContainer "Read Only"
            dwaContainer -> edaContainer "Read Only"
            fraContainer -> edaContainer "Read Only"
            
            # REPORTING
            dwaContainer -> privateBIReport   "Provides data to"
            dwaContainer -> PowerBIReport     "Provides data to"



        }
        
        group "DeploymentEnvironments" {
            deploymentEnvironment "Live" {
                deploymentNode "Data Center - CRM" {
                    tags "Data Center" "Data Center - CRM"
                    deploymentNode "CRM" {
                        crmInstance = containerInstance crmContainer
                        crmViewsInstance = containerInstance crmViews
                    }
                }
                deploymentNode "Data Center - Stater" {
                    tags "Data Center - Stater" "Data Center"
                    deploymentNode "SHS" {
                        shsInstance = containerInstance shsContainer
                        shsdwhInstance = containerInstance shsdwhContainer
                        tmnInstance = containerInstance tmnContainer
                        }
                    }
                deploymentNode "Data Center - Centric" {
                    tags "Data Center - Centric" "Data Center"

                deploymentNode "FTP Server" {
                        shsDataFullInstance = containerInstance shsDataFull
                        shsDataDeltaInstance = containerInstance shsDataDelta
                        tmnDataFullInstance = containerInstance tmnDataFull
                        }
                    }

                deploymentNode "Power BI Service" {
                        tags "Reporting - Power BI" "Data Center"
                        dwaReportsPowerBIInstance = containerInstance dwaReportsPowerBI
                    }
                deploymentNode "Data Center - Previder" {
                    tags "Data Center" "Data Center - Previder"

                    deploymentNode "Linux Server" {
                        tags "Linux Server"
                        deploymentNode "Java VM" {
                            tags "Java VM"
                            scdInstance = containerInstance scdContainer
                            islInstance = containerInstance islContainer
                        }
                        deploymentNode "Pentaho Data Integration" {
                            tags  "ETL - Pentaho" 
                            etlEngineInstance = containerInstance etlEngine
                        }
                     }     
                    deploymentNode "Netezza Datawarehouse Appliance" "Netezza" "version: ???"{
                            tags "Netezza Server" "Dataplatform - Netezza"

                            sdaInstance = containerInstance sdaContainer
                            bdaInstance = containerInstance bdaContainer
                            dwaInstance = containerInstance dwaContainer
                            fraInstance = containerInstance fraContainer
                            ddaInstance = containerInstance ddaContainer

                     }                        
                    
                    deploymentNode "Windows Server" {
                        tags "Windows Server"
                        deploymentNode "Microstrategy Server" {
                            tags "BI - Microstrategy" 
                            dwaReportsMicrostrategyInstance = containerInstance dwaReportsMicrostrategy
                        }
                     }
            
                }
            }
            
        }
     }
