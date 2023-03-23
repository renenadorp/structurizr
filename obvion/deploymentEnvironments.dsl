group "DeploymentEnvironments" {
            deploymentEnvironment "Production" {
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
                        tags "Server"
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

                    deploymentNode "Linux Server Monitoring (???)" {
                        deploymentNode "Zoetes Email Server" {
                            tags "Server"
                            zoetesInstance = containerInstance zoetesContainer
                        }
                    }
                    deploymentNode "Linux Server" {
                        tags "Server"
                        deploymentNode "Java VM" {
                            tags "Java VM"
                            scdInstance = containerInstance scdContainer
                            islInstance = containerInstance islContainer
                        }
                        deploymentNode "Pentaho Data Integration" {
                            tags  "Pentaho" "Server" 
                            etlEngineInstance = containerInstance etlEngine
                        }
                     }     
                    deploymentNode "Netezza Datawarehouse Appliance" "Netezza" "version: ???"{
                            tags "Server" "Dataplatform - Netezza" "Netezza"

                            sdaInstance = containerInstance sdaContainer
                            bdaInstance = containerInstance bdaContainer
                            dwaInstance = containerInstance dwaContainer
                            fraInstance = containerInstance fraContainer
                            ddaInstance = containerInstance ddaContainer

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