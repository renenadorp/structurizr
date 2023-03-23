
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

            InergyDevelopmentSystem = softwaresystem "Inergy Development System" {
                svnContainer = container "SVN"

            }
            InergyMonitoringSystem = softwaresystem "Inergy Monitoring" {
                zoetesContainer = container "Zoetes Email Server"


            }
            FTPSystem               = softwaresystem "FTP Server" {
                tags "FTP Server"
                shsDataFull  = container "SHS Data Full"  "" "" "Zip" 
                shsDataDelta = container "SHS Data Delta"  "" "" "Zip" 
                tmnDataFull  = container "TMN Data Full" "" "" "Zip"
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
                        ddaDataMicrostrategyFRAComponent = component "Microstrategy Views - FRA" "" ""
                        ddaDataMicrostrategyDWAComponent = component "Microstrategy Views - DWA" "" ""

                    }
                     
                }
            MicrostrategyReportingSystem  = softwaresystem "Reporting System" "Microstrategy" "" {
                dwaSemanticLayerMicrostrategy = container "DWA Semantic Layer Microstrategy"
                fraSemanticLayerMicrostrategy = container "FRA Semantic Layer Microstrategy"
                
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
            digdwaComponent  -> dwaContainer    ""

            # FRA
            etlfraComponent  -> digfraComponent  ""
            bdaDataComponent -> digfraComponent  ""
            digfraComponent  -> fraDataComponent ""
 
            # DDA
            fraDataComponent -> ddaDataIFRSComponent "Data Delivery"
            fraDataComponent -> ddaDataIRBComponent  "Data Delivery"
            ddaDataMicrostrategyDWAComponent -> ddaDataMicrostrategyDWAComponent "DWA Views"
            # EDA
            sdaContainer -> edaContainer "Read Only"
            bdaContainer -> edaContainer "Read Only"
            dwaContainer -> edaContainer "Read Only"
            fraContainer -> edaContainer "Read Only"
            
            # REPORTING
            ddaDataMicrostrategyFRAComponent -> fraSemanticLayerMicrostrategy
            fraSemanticLayerMicrostrategy    -> fraReportsMicrostrategy    "Provides data to"

            ddaDataMicrostrategyDWAComponent -> dwaSemanticLayerMicrostrategy
            dwaSemanticLayerMicrostrategy    -> dwaReportsMicrostrategy    "Provides data to"

            dwaDataComponent -> PowerBIReport
            # MONITORING
            etlEngine -> zoetesContainer   "Email"


        }
        
        !include deploymentEnvironments.dsl
     }
