
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
            crmSystem           = softwaresystem "CRM System" "Customer Relationship Management System"  {
                tags ""
                crmContainer = container "CRM"
                crmViews = container "CRM Views"

            }
        }

        group "Target Systems" {
            advSystem           = softwaresystem "AdviseursPortaal" "" "System OutScope" {
                advContainer    = container "AdviseursPortaal" "" 
            }
        }

        group "Data & Analytics" {

            InergyDevelopmentSystem = softwaresystem "Inergy Development System" {
                svnContainer = container "SVN" "Version Control" {
                    tags "SVN"
                    }
                rdkContainer = container "Rundeck" {
                    tags "Rundeck"
                    }
                pwdContainer = container "PowerDesigner" "Data Modeling" {
                    tags "PowerDesigner"
                    }
                fitContainer = container "FitNesse" "Testing Software" {
                    tags "Fitnesse"
                }


            }
            InergyMonitoringSystem = softwaresystem "Inergy Monitoring System" {
                zoetesEmailServerContainer = container "Zoetes Email Server"
                zenossEventContainer = container "Zenoss Events Server"

                idqDatabaseContainer = container "IDQ" {
                    tags "Database" "Postgress"
                }             

                opsGenieContainer = container "OpsGenie"

            }

            FTPSystem               = softwaresystem "FTP Server" {
                tags "FTP Server"
                shsDataFull  = container "SHS Data"  "" "Full/Delta" "Zip" 
                tmnDataFull  = container "TMN Data"  "" "Full Only" "Zip"
                bagDataFull  = container "BAG Data" "Zipped XML" "Full Only" "Zip" 
                }

            DataPlatformSystem      = softwaresystem "Data Platform System" "" {
                    sdaContainer = container "SDA"  "" "Netezza" "" {
                        tags "Netezza" "Database"
                        digbdaComponent = component "DIG_BDA" "" "Stored Procedure - Netezza" "Stored Procedure"
                        sdaDataComponent = component "SDA Data" "" "Table - Netezza" ""
                    }
                    bdaContainer = container "BDA" "" "Database - Netezza" "" {
                        tags "Netezza" "Database"
                        digdwaComponent = component "DIG_DWA" "" "" "Stored Procedure"
                        bdaDataComponent = component "BDA Data" "" "" "Data" 

                    }
                    dwaContainer = container "DWA" "" "Netezza" "" {
                        tags "Netezza" "Database"
                        dwaDataComponent = component "DWA Data" "" "" "Data" 
                    }
                    fraContainer = container "FRA" "" "Netezza" "" {
                        tags "Netezza" "Database"
                        digfraComponent = component "DIG_FRA" "" "" ""
                        fraDataComponent = component "FRA Data" "" ""
                    }
                    edaContainer = container "EDA" "" "Database" "Database - Netezza" {
                        tags "Netezza" "EDA"  "Database"
                    }
                    ddaContainer = container "DDA" "" "Database - Netezza" "" {
                        tags "Netezza" "Database"
                        ddaDataIFRSComponent = component "DDA IFRS Data" "" ""
                        ddaDataIRBComponent = component "DDA IRB Data" "" ""
                        ddaAdviseursPortalComponent = component "AdviseursPortaal" "" ""
                        ddaDataMicrostrategyCRMComponent = component "CRM Views" "" ""
                        ddaDataMicrostrategyFRAComponent = component "Microstrategy Views - FRA" "" ""
                        ddaDataMicrostrategyDWAComponent = component "Microstrategy Views - DWA" "" ""

                    }
                     
                }
            MicrostrategyReportingSystem  = softwaresystem "Reporting System" "Microstrategy" "" {
                tags "Microstrategy"

                MicrostrategyRepositoryComponent = container "Microstrategy Repository" {
                        tags "Database" "Oracle"
                 }

                MicrostrategySemanticLayer = container " Semantic Layer Microstrategy" {
                    tags "Microstrategy"
                 }           

                MicrostrategyReports  = container "Reports - Microstrategy" "Microstrategy" "Microstrategy" {
                    tags "Microstrategy"
                    description "Microstrategy"
                    properties {
                        version "??.??"
                    }
                    MicrostrategyReport = component "Report" "Microstrategy Report"

                 }
               
                }        
            PowerBIReportingSystem    = softwaresystem "Power BI Service" "Power BI" "" {
                PowerBIReports = container "Power BI Reports" "Reporting - Power BI" 
             }
            FTPRaboSystem             = softwaresystem "FTP Rabo Server" {
                tags "FTP Server"
                expDataIRB   = container "IRB Data Full"  "" "" "Zip" 
                expDataIFRS  = container "IFRS Data Full"  "" "" "Zip" 
             }
            
            
            etlSystem                 = softwaresystem "Pentaho ETL System" "" "Data Processing" {
                etlEngine  = container "Pentaho Data Integration" "Pentaho Server" "" {
                    tags "Pentaho"
                    etlDailyComponent  = component "Daily Main" "Pentaho Job" "ETL - Pentaho Job"
                    etlsdaComponent    = component "SDA Main" "Pentaho Job" "ETL - Pentaho Job"
                    etlbdaComponent    = component "BDA Main" "Pentaho Job" "ETL - Pentaho Job"
                    etlfraComponent    = component "FRA Main" "Pentaho Job" "ETL - Pentaho Job"
                    etldwaComponent    = component "DWA Main" "Pentaho Job" "ETL - Pentaho Job" 
                    etlddaComponent    = component "DDA Main" "Pentaho Job" "ETL - Pentaho Job" 
                    etlexpComponent    = component "EXP Main" "Pentaho Job" "ETL - Pentaho Job" 
                }
                scdContainer        = container "SCD" "" "Java - Jar" {
                    description "Java component for historization (Slowly Changing Dimensions)"
                    tags "Java - Jar"
                }
                islContainer        = container "ISL" "" "ETL - Java" {
                    tags "Java - Jar"
                    description "Java component for data ingestion (Inergy Smart Loader)"

                }
                dctContainer        = container "DCT" "" "ETL - Java" {
                    tags "Java - Jar"
                    description "Java component for data comparison (Data Compare Tool)"

                }
                damContainer        = container "DAM" "Domain Analysis Module" "ETL - Java" {
                    tags "Java - Jar"
                    description "Java component for data profiling"

                }

            
                }
             }       
        
        ###########
        # Relations
        group "Relations" {

            # SHS
            shsContainer    -> shsdwhContainer     "" "Push"
            shsdwhContainer -> shsDataFull      "DDS1" "Push" "Daily"

            tmnContainer    -> tmnDataFull "" "Push"

            # CRM
            crmContainer    -> crmViews "Read"

            # DAILY
            etlDailyComponent -> etlsdaComponent ""
            etlDailyComponent -> etlfraComponent ""
            etlDailyComponent -> etlbdaComponent ""
            etlDailyComponent -> etldwaComponent ""
            etlDailyComponent -> etlddaComponent ""

            # SDA
            shsDataFull     -> etlsdaComponent ""
            tmnDataFull     -> etlsdaComponent ""
            crmViews        -> etlsdaComponent "" "Pull"

            bagDataFull     -> etlsdaComponent ""

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
            digdwaComponent  -> dwaContainer    ""

            # FRA
            etlfraComponent  -> digfraComponent  ""
            bdaDataComponent -> digfraComponent  ""
            digfraComponent  -> fraDataComponent ""
 
            # DDA
           
            dwaDataComponent -> ddaDataMicrostrategyDWAComponent  "DWA"
            fraDataComponent -> ddaDataMicrostrategyFRAComponent  "FRA"
            fraDataComponent -> ddaDataIFRSComponent 
            fraDataComponent -> ddaDataIRBComponent   

            # DELIVERY: RABO
            ddaDataIRBComponent  -> etlexpComponent ""
            ddaDataIFRSComponent -> etlexpComponent ""


            etlexpComponent      -> expDataIRB    "IRB to Rabo"
            etlexpComponent      -> expDataIFRS   "IFRS to Rabo"


            # EDA
            sdaContainer -> edaContainer "Read Only"
            bdaContainer -> edaContainer "Read Only"
            dwaContainer -> edaContainer "Read Only"
            fraContainer -> edaContainer "Read Only"
            
            # REPORTING - MICROSTRATEGY
            MicrostrategyRepositoryComponent   -> MicrostrategyReport
             

            ddaDataMicrostrategyDWAComponent -> MicrostrategySemanticLayer 
            MicrostrategySemanticLayer    -> MicrostrategyReports  
            MicrostrategyRepositoryComponent -> MicrostrategyReports 
        
            # REPORTING - POWER BI
            sdaDataComponent -> PowerBIReports ""
            bdaDataComponent -> PowerBIReports ""
            fraDataComponent -> PowerBIReports ""

            # ADVISEURS PORTAL
            ddaAdviseursPortalComponent -> advContainer
 
            # MONITORING
            etlEngine -> zoetesEmailServerContainer
            zoetesEmailServerContainer -> zenossEventContainer "Events" "API"
            zoetesEmailServerContainer ->  opsGenieContainer "Events" "API"
            
            zenossEventContainer -> idqDatabaseContainer "ETL Logging"

            # DEVELOPMENT
            rdkContainer -> etlDailyComponent "Deploy"
            rdkContainer -> sdaContainer "Deploy" 
            rdkContainer -> bdaContainer "Deploy"
            rdkContainer -> dwaContainer "Deploy"
            rdkContainer -> fraContainer "Deploy"
            rdkContainer -> ddaContainer "Deploy"
            rdkContainer -> edaContainer "Deploy"

        }
        
        !include deployment.dsl
     }
