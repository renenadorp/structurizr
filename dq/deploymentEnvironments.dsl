group "DeploymentEnvironments" {
            deploymentEnvironment "Production" {
                deploymentNode "AdviseursPortaal" {
                    tags "Data Center"
                    deploymentNode "AP" {
                        advInstance = containerInstance advContainer 
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

                    deploymentNode "FTP Server (InFlow)" {
                            tags "Server"
                            shsDataFullInstance = containerInstance shsDataFull
                            shsDataDeltaInstance = containerInstance shsDataDelta
                            tmnDataFullInstance = containerInstance tmnDataFull
                            bagDataFullInstance = containerInstance bagDataFull
                            }
                    
                    deploymentNode "FTP Server (OutFlow)" {
                            tags "Server"                    
                        expDataIRBInstance   = containerInstance expDataIRB
                        expDataIFRSInstance  = containerInstance expDataIFRS

                        }                    
                         
                
                
                    deploymentNode "CRM" {
                        tags "Server" "CRM"

                        crmInstance = containerInstance crmContainer
                        crmViewsInstance = containerInstance crmViews
                    
                 }
                 }


                deploymentNode "Power BI Service" {
                        tags "Reporting - Power BI" "Data Center"
                        dwaReportsPowerBIInstance = containerInstance dwaReportsPowerBI
                    }
                deploymentNode "Data Center - Previder" {
                    tags "Data Center" "Data Center - Previder"

                    deploymentNode "Monitoring Server (???)" {
                        tags "Server"
                            
                            zoetesInstance = containerInstance zoetesContainer
                    }
                    deploymentNode "ETL Server" {
                        tags "Server"
                        deploymentNode "Java VM" {
                            tags "Java VM"
                            scdInstance = containerInstance scdContainer
                            islInstance = containerInstance islContainer
                        }
                            tags  "" "Server" 
                            etlEngineInstance = containerInstance etlEngine
                        
                     }     
                    deploymentNode "Netezza Datawarehouse Appliance" "Netezza" "version: ???" {
                            tags "Server" "Netezza"

                            sdaInstance = containerInstance sdaContainer
                            bdaInstance = containerInstance bdaContainer
                            dwaInstance = containerInstance dwaContainer
                            fraInstance = containerInstance fraContainer
                            ddaInstance = containerInstance ddaContainer
                            edaInstance = containerInstance edaContainer

                     }                        
                    
                    deploymentNode "Windows Server" {
                        tags "Server"
                        deploymentNode "Microstrategy Server" {
                            tags "Microstrategy"
                            dwaSemanticLayerMicrostrategyInstance = containerInstance dwaSemanticLayerMicrostrategy
                            fraSemanticLayerMicrostrategyInstance = containerInstance fraSemanticLayerMicrostrategy
                            
                            dwaReportsMicrostrategyInstance = containerInstance dwaReportsMicrostrategy
                            fraReportsMicrostrategyInstance = containerInstance fraReportsMicrostrategy
                        }
                     }
            
                }
            }
            
        }