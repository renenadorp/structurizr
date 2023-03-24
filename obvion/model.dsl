
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

        group "Target Systems" {
            advSystem           = softwaresystem "AdviseursPortal" "" "System OutScope" {
                advContainer    = container "AP"
            }
        }

        group "Data & Analytics" {

            InergyDevelopmentSystem = softwaresystem "Inergy Development System" {
                svnContainer = container "SVN"

            }
            InergyMonitoringSystem = softwaresystem "Inergy Monitoring System" {
                zoetesContainer = container "Zoetes Email Server"

            }
            FTPSystem               = softwaresystem "FTP Server" {
                tags "FTP Server"
                shsDataFull  = container "SHS Data Full"  "" "" "Zip" 
                shsDataDelta = container "SHS Data Delta"  "" "" "Zip" 
                tmnDataFull  = container "TMN Data Full" "" "" "Zip"
                bagDataFull  = container "BAG Data Full" "Zipped XML" "" "Zip" 
                }

            DataPlatformSystem      = softwaresystem "Data Platform System" "" {
                    sdaContainer = container "SDA"  "" "Netezza" "" {
                        tags "Netezza"
                        digbdaComponent = component "DIG_BDA" "" "Stored Procedure - Netezza" "Stored Procedure"
                        sdaDataComponent = component "SDA Data" "" "Table - Netezza" ""
                    }
                    bdaContainer = container "BDA" "" "Database - Netezza" "" {
                        tags "Netezza"
                        digdwaComponent = component "DIG_DWA" "" "" "Stored Procedure"
                        bdaDataComponent = component "BDA Data" "" "" "" 

                    }
                    dwaContainer = container "DWA" "" "Netezza" "" {
                        tags "Netezza"
                        dwaDataComponent = component "DWA Data" "" "" "" 
                    }
                    fraContainer = container "FRA" "" "Netezza" "" {
                        tags "Netezza"
                        digfraComponent = component "DIG_FRA" "" "" ""
                        fraDataComponent = component "FRA Data" "" ""
                    }
                    edaContainer = container "EDP" "" "Database" "Database - Netezza" {
                        tags "Netezza"
                    }
                    ddaContainer = container "DDA" "" "Database - Netezza" "" {
                        tags "Netezza"
                        ddaDataIFRSComponent = component "DDA IFRS Data" "" ""
                        ddaDataIRBComponent = component "DDA IRB Data" "" ""
                        ddaAdviseursPortalComponent = component "AdviseursPortal" "" ""
                        ddaDataMicrostrategyCRMComponent = component "CRM Views" "" ""
                        ddaDataMicrostrategyFRAComponent = component "Microstrategy Views - FRA" "" ""
                        ddaDataMicrostrategyDWAComponent = component "Microstrategy Views - DWA" "" ""

                    }
                     
                }
            MicrostrategyReportingSystem  = softwaresystem "Reporting System" "Microstrategy" "" {
                tags "Microstrategy"

                dwaSemanticLayerMicrostrategy = container "DWA Semantic Layer Microstrategy" {
                    tags "Microstrategy"

                }
                fraSemanticLayerMicrostrategy = container "FRA Semantic Layer Microstrategy" {
                    tags "Microstrategy"

                }
                
                dwaReportsMicrostrategy = container "DWA Reports - Microstrategy" "Microstrategy" "Microstrategy" {
                    tags "Microstrategy"
                    description "Microstrategy"
                    properties {
                        version "??.??"
                    }
                    MicrostrategyReportDWA = component "Report" "Microstrategy Report"

                }
                fraReportsMicrostrategy = container "FRA Reports - Microstrategy" "Microstrategy" "Microstrategy" {
                    tags "Microstrategy"
                    description "Microstrategy"
                    properties {
                        version "??.??"
                    }
                    MicrostrategyReportFRA = component "Report" "Microstrategy Report"

                }
                }        
            PowerBIReportingSystem    = softwaresystem "Power BI Service" "Power BI" "" {
                dwaReportsPowerBI = container "DWA Reports - Power BI" "Reporting - Power BI" {
                    tags "Power BI"
                    PowerBIReport = component "Report" "Power BI Report"

                }
            }
            FTPRaboSystem = softwaresystem "FTP Rabo Server" {
                tags "FTP Server"
                expDataIRB   = container "IRB Data Full"  "" "" "Zip" 
                expDataIFRS  = container "IFRS Data Full"  "" "" "Zip" 
            }
            
            
            
            
            etlSystem               = softwaresystem "Pentaho ETL System" "" "Data Processing" {
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
            
                }
             }       
        
        ###########
        # Relations
        group "Relations" {

            # SHS
            shsContainer    -> shsdwhContainer     "Push"
            shsdwhContainer -> shsDataFull      "Push"
            shsdwhContainer -> shsDataDelta     "Push"

            tmnContainer    -> tmnDataFull "Push"

            # CRM
            crmContainer    -> crmViews "Read"
            crmViews        -> islContainer     "Pull"

            # DAILY
            etlDailyComponent -> etlsdaComponent ""
            etlDailyComponent -> etlfraComponent ""
            etlDailyComponent -> etlbdaComponent ""
            etlDailyComponent -> etldwaComponent ""
            etlDailyComponent -> etlddaComponent ""


            # SDA
            shsDataFull     -> etlsdaComponent "Datasource for"
            shsDataDelta    -> etlsdaComponent "Datasource for"
            tmnDataFull     -> etlsdaComponent "Datasource for"

            bagDataFull     -> etlsdaComponent "Datasource for"

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
            fraDataComponent -> ddaDataIFRSComponent "Data Delivery"
            fraDataComponent -> ddaDataIRBComponent  "Data Delivery"

            ddaDataMicrostrategyDWAComponent -> ddaDataMicrostrategyDWAComponent "DWA Views"

            # DELIVERY: RABO
            ddaDataIRBComponent  -> etlexpComponent ""
            ddaDataIFRSComponent -> etlexpComponent ""


            etlexpComponent      -> expDataIRB   "IRB to Rabo"
            etlexpComponent      -> expDataIFRS   "IFRS to Rabo"


            # EDA
            sdaContainer -> edaContainer "Read Only"
            bdaContainer -> edaContainer "Read Only"
            dwaContainer -> edaContainer "Read Only"
            fraContainer -> edaContainer "Read Only"
            
            # REPORTING - MICROSTRATEGY
            ddaDataMicrostrategyFRAComponent -> fraSemanticLayerMicrostrategy
            fraSemanticLayerMicrostrategy    -> fraReportsMicrostrategy    "Provides data to"

            ddaDataMicrostrategyDWAComponent -> dwaSemanticLayerMicrostrategy
            dwaSemanticLayerMicrostrategy    -> dwaReportsMicrostrategy    "Provides data to"
        
            # REPORTING - POWER BI
            dwaDataComponent -> PowerBIReport "DWA or DDA as a source??"

            # ADVISEURS PORTAL\
            ddaAdviseursPortalComponent -> advContainer



            # MONITORING
            etlEngine -> zoetesContainer   "Email"


        }
        
        !include deploymentEnvironments.dsl
     }
