
     model {
            
     
        group "People" {
            #erpStaff    = person "ERP Staff" "ERP" "Internal Staff"
            
 
        }

        group "Systems" {
            shsSystem           = softwaresystem "Stater Hypotheek System" "Stater" "System OutScope" {
                tags "System"
                shsContainer    = container "Stater Hypotheek Systeem"
                shsdwhContainer = container "SHSDWH"
                tmnContainer    = container "Tallyman"
                pccContainer    = container "PowerCurve" "" 

            }
            crmSystem           = softwaresystem "CRM System" "Customer Relationship Management System"  {
                tags "System"

                crmContainer = container "CRM"
                crmViews = container "CRM Views"

            }
            kstSystem           = softwaresystem "Kadaster" "Kadaster"  {
                tags "System"
                kstBAGDatasetContainer = container "BAG"
             }
            
            bkrSystem           = softwaresystem "BKR" "BKR"  {
                tags "System"
                bkrBKRDatasetContainer = container "BKR"
             }
                      
            calSystem           = softwaresystem "Calcasa" "Calcasa"  {
                tags "System"
                calCALDatasetContainer = container "Calcasa"
            }
           mvwSystem           = softwaresystem "MoneyView" "MoneyView"  {
                tags "System"
                mvwMVWDatasetContainer = container "MoneyView"
            }

            advSystem           = softwaresystem "AdviseursPortaal" "" "System" {
                tags "System"
                advContainer    = container "AdviseursPortaal" "" 
             }
            
        }

        group "Data & Analytics" {
            #NetworkingSystemPrevider = softwareSystem "Network Previder" {
            #    NetworkControllerPrevider = container "Network Controller Previder"
            #}

            InergyDevelopmentSystem = softwaresystem "Inergy Development System" {
                                tags "System"

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
                 idsContainer = container "IDS" "Inergy Deployment System" {
                    tags "Perl"
                    technology "perl"
                 }


            }
            InergyMonitoringSystem = softwaresystem "Inergy Monitoring System" {
                tags "System"

                zoetesEmailServerContainer = container "Zoetes Email Server"
                zenossEventContainer = container "Zenoss Events Server"

                idqDatabaseContainer = container "IDQ" "" "PostgreSQL" {
                    tags "Database" "Postgress"
                }             

                opsGenieContainer = container "OpsGenie" {
                    tags "OpsGenie"
                }

            }

            FTPSystem               = softwaresystem "Data InFlow" {
                tags "FTP Server" "System"

                shhdataFull  = container "SHS Data"  "" "Full/Delta" "Zip" 
                tmnDataFull  = container "TMN Data"  "" "Full Only" "Zip"
                bagDataFull  = container "BAG Data" "Zipped XML" "Full Only" "Zip" 
                bkrDataFull  = container "BKR Data" "" "" "" 
                calDataIn  = container "Calcasa: Taxatiewaarden" "" "" "" 
                pccDataFull  = container "PowerCurve Data" "" "" "" 
                mvwDataFull  = container "Moneyview Data" "" "" "" 

                }

            DataPlatformSystem      = softwaresystem "Data Platform System" "" {
                                tags "System"

                    hdaContainer = container "HDA"  "" "Netezza" "" {
                        tags "Netezza" "Database"
                        digbdaComponent = component "DIG_BDA" "" "Stored Procedure - Netezza" "Stored Procedure"
                        hdaDataComponent = component "HDA Data" "" "Table - Netezza" ""
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
                    expContainer = container "Exploration" "Including FRED" "Database" "Database - Netezza" {
                        tags "Netezza" "Exploration"  "Database"
                            fredDataComponent = component "FRED" "" ""
                            fredScriptsComponent = component "FRED SQL Scripts" "" "" 

                    }
                    ddaContainer = container "DDA" "" "Database - Netezza" "" {
                        tags "Netezza" "Database"
                        ddaDataIFRSComponent = component "DDA IFRS Data" "" ""
                        ddaDataIRBComponent  = component "DDA IRB Data" "" ""
                        ddaDataCALComponent  = component "DDA Calcasa Data" "" ""
                        ddaAdviseursPortalComponent = component "AdviseursPortaal Data" "" ""
                        ddaDataPCCComponent = component "PowerCurve Data" "" ""
                        ddaDataCRMComponent = component "CRM Views" "" ""
                        ddaDataMicroStrategyCRMComponent = component "MicroStrategy Views - CRM" "" ""
                        ddaDataMicroStrategyFRAComponent = component "MicroStrategy Views - FRA" "" ""
                        ddaDataMicroStrategyDWAComponent = component "MicroStrategy Views - DWA" "" ""

                    }
                     
                }
            MicroStrategyReportingSystem  = softwaresystem "MicroStrategy" "MicroStrategy" "" {
                tags "System" "Reporting"
                properties {
                    version "??.??"
                }

                MicroStrategyRepositoryComponent = container "MicroStrategy Repository" "" "Oracle" {
                        tags "Database" "Oracle"
                 }

                MicroStrategySemanticLayers = container "MicroStrategy - Semantic Layers " {
                    tags "MicroStrategy"
                    MicroStrategySemanticLayerDWA = component " Semantic Layer MicroStrategy DWA" {
                        tags "MicroStrategy" 
                        }
                    MicroStrategySemanticLayerFRA = component " Semantic Layer MicroStrategy FRA" {
                        tags "MicroStrategy"
                 }           
                }
                MicroStrategyReports  = container "MicroStrategy - Reports" "MicroStrategy" "MicroStrategy" {
                    tags "MicroStrategy"
                    description "MicroStrategy"

                    MicroStrategyReportFRA = component "FRA Reports" "MicroStrategy Report"
                    MicroStrategyReportDWA = component "DWA Reports" "MicroStrategy Report"

                 }
               
                }        
            PowerBIReportingSystem    = softwaresystem "Power BI Service" "Power BI" "" {
                                tags "System"

                PowerBIReports = container "Power BI Reports" "Reporting - Power BI" 
             }
            FTPRaboSystem             = softwaresystem "Data OutFlow" {
                tags "FTP Server"   "System"

                expDataIRB      = container "IRB Data Full"  "" "" "Zip" 
                expDataIFRS     = container "IFRS Data Full"  "" "" "Zip" 
                expDataPCC      = container "PCC Data "  "" "" "" 
                expDataCAL      = container "Calcasa: Adresses"  "" "" "" 
                expDataFINREP   = container "FINREP"  "" "" "" 
                expDataCOREP    = container "COREP"  "" "" "" 
             }
            
            
            etlSystem                 = softwaresystem "Pentaho ETL System" "" "Data Processing" {
                                tags "System"

                sqlScriptsContainer   = container "SQL Scripts" "" "" {
                    description "SQL Script files"
                    tags "File" "SQL"
                }
                etlEngine  = container "Pentaho Data Integration" "Pentaho Server" "" {
                    tags "Pentaho"
                    etlDailyComponent  = component "Daily Main" "Pentaho Job" "ETL - Pentaho Job"
                    etlhdaComponent    = component "hda Main" "Pentaho Job" "ETL - Pentaho Job"
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
                
                lqbContainer        = container "Liquibase" "Liquibase" "" {
                    tags "Liquibase"
                    description "Database management"
                }
                
                            
                hitContainer        = container "HIT" "Hit Ratio" "R" {
                    tags "R"
                    technology "R"
                    description "Kans op conversie voor hypotheek-aanvragen"
                }
                
            
                }
             }       
        
        ###########
        # Relations
        group "Relations" {

            # SHS
            shsContainer    -> shsdwhContainer     "" "Push"
            shsdwhContainer -> shhdataFull      "DDS1" "Push" "Daily"

            tmnContainer    -> tmnDataFull "" "Push"
            # CRM
            crmContainer    -> crmViews "Read"
            
            # KADASTER
            kstBAGDatasetContainer -> bagDataFull

            # BKR
            bkrBKRDatasetContainer -> bkrDataFull

       
            # CALCASA
            calCALDatasetContainer -> calDataIn
            expDataCAL -> calCALDatasetContainer

            # MONEYVIEW
            mvwMVWDatasetContainer -> mvwDataFull

            # ETL
            etlDailyComponent -> etlhdaComponent ""
            etlDailyComponent -> etlfraComponent ""
            etlDailyComponent -> etlbdaComponent ""
            etlDailyComponent -> etldwaComponent ""
            etlDailyComponent -> etlddaComponent ""

            # SQL
            fredDataComponent ->  fredScriptsComponent                                        



            # hda
            shhdataFull     -> etlhdaComponent ""
            tmnDataFull     -> etlhdaComponent ""
            mvwDataFull     -> etlhdaComponent ""

            crmViews        -> etlhdaComponent "" "Pull"

            bagDataFull     -> etlhdaComponent ""
            bkrDataFull     -> etlhdaComponent ""
            calDataIn     -> etlhdaComponent ""

            etlhdaComponent -> islContainer ""
            etlhdaComponent -> scdContainer ""
            scdContainer    -> hdaContainer ""
            islContainer    -> hdaContainer ""

            # BDA
            etlbdaComponent  -> digbdaComponent  ""
            hdaDataComponent -> digbdaComponent  ""
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
            dwaDataComponent -> ddaDataCRMComponent "CRM data from DWA"
            #dwaDataComponent -> ddaDataMicroStrategyDWAComponent  "DWA"
            #fraDataComponent -> ddaDataMicroStrategyFRAComponent  "FRA"
            fraDataComponent -> ddaDataIFRSComponent 
            fraDataComponent -> ddaDataIRBComponent   
            fraDataComponent -> ddaDataPCCComponent
            bdaDataComponent -> ddaDataCALComponent


            # DELIVERY: CALCASA
            ddaDataCALComponent  -> etlexpComponent ""
         
            # DELIVERY: RABO
            ddaDataIRBComponent  -> etlexpComponent ""
            ddaDataIFRSComponent -> etlexpComponent ""
            ddaDataPCCComponent  -> etlexpComponent ""
            ddaDataCRMComponent  -> crmContainer "CRM reads data from DDA"

            etlexpComponent      -> expDataIRB    "IRB "
            etlexpComponent      -> expDataIFRS   "IFRS"
            etlexpComponent      -> expDataPCC   "PCC"
            etlexpComponent      -> expDataCAL   "Calcasa"

            expContainer        -> sqlScriptsContainer
            sqlScriptsContainer -> expDataCOREP
            sqlScriptsContainer -> expDataFINREP

            # EXPLORATION 
            hdaContainer -> expContainer "Read Only"
            bdaContainer -> expContainer "Read Only"
            dwaContainer -> expContainer "Read Only"
            fraContainer -> expContainer "Read Only"
            
            # REPORTING - MicroStrategy
            MicroStrategyRepositoryComponent   -> MicroStrategyReports
             
            dwaDataComponent -> MicroStrategySemanticLayerDWA  "DWA"
            fraDataComponent ->  MicroStrategySemanticLayerFRA "FRA"

            #ddaDataMicroStrategyDWAComponent -> MicroStrategySemanticLayerDWA "DWA & FRA (Technical Implementation)"
            #ddaDataMicroStrategyFRAComponent -> MicroStrategySemanticLayerFRA "FRA (Technical Implementation)" 
            
            MicroStrategySemanticLayerFRA    -> MicroStrategyReportFRA  "DWA & FRA"
            MicroStrategySemanticLayerDWA    -> MicroStrategyReportDWA  "DWA"
            MicroStrategyRepositoryComponent -> MicroStrategyReports 
        
            # REPORTING - POWER BI
            hdaDataComponent -> PowerBIReports ""
            bdaDataComponent -> PowerBIReports ""
            fraDataComponent -> PowerBIReports ""

            # ADVISEURS PORTAL
            ddaAdviseursPortalComponent -> advContainer
 
            # MONITORING
            etlEngine -> zoetesEmailServerContainer
            zoetesEmailServerContainer -> zenossEventContainer  "Events" "API"
            zoetesEmailServerContainer -> opsGenieContainer     "Events" "API"
            
            zenossEventContainer -> idqDatabaseContainer "ETL Logging"

            # DEVELOPMENT
            rdkContainer -> etlDailyComponent "Deploy"
            rdkContainer -> hdaContainer "Deploy" 
            rdkContainer -> bdaContainer "Deploy"
            rdkContainer -> dwaContainer "Deploy"
            rdkContainer -> fraContainer "Deploy"
            rdkContainer -> ddaContainer "Deploy"
            rdkContainer -> expContainer "Deploy"

            # NETWORKING
            #NetworkControllerObvion -> NetworkControllerPrevider "Network Link (2x)"
        }
        
        !include deployment.dsl
     }
