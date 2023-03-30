group "DeploymentEnvironments" {
            deploymentEnvironment "Production" {

                deploymentNode "Data Center - Stater" {
                    tags "Data Center - Stater" "Data Center"
                    deploymentNode "SHS" {
                        shsInstance = containerInstance shsContainer
                        shsdwhInstance = containerInstance shsdwhContainer
                        tmnInstance = containerInstance tmnContainer
                        pccInstance = containerInstance pccContainer
                        }
                    }                
                deploymentNode "Data Center - Kadaster" {
                    tags "Data Center - Kadaster" "Data Center"
                deploymentNode "BAG" {
                    kstBAGDatasetInstance = containerInstance kstBAGDatasetContainer

                    }
                 }

                deploymentNode "Data Center - Itility" {
                    tags "Data Center - Itility" "Data Center"
                    #NetworkControllerObvionInstance = containerInstance NetworkControllerObvion
                    NetworkControllerObvion = infrastructureNode "Network Controller Obvion" {
                        #-> NetworkControllerPrevider "Network Link"
                    }

                    deploymentNode "FTP Server (InFlow)" {
                            tags "Server"
                            shhdataFullInstance = containerInstance shhdataFull
                            tmnDataFullInstance = containerInstance tmnDataFull
                            bagDataFullInstance = containerInstance bagDataFull
                            }
                    
                    deploymentNode "FTP Server (OutFlow)" {
                            tags "Server"                    
                        expDataIRBInstance   = containerInstance expDataIRB
                        expDataIFRSInstance  = containerInstance expDataIFRS
                        expDataPCCInstance   = containerInstance expDataPCC

                        }                    
                         
                
                    deploymentNode "CRM" {
                        tags  "Obvion CRM" "Server"

                        crmInstance = containerInstance crmContainer
                        crmViewsInstance = containerInstance crmViews
                    
                 }
                 deploymentNode "Adviseurs Portaal" {
                    tags "Obvion" "Server"
                    advInstance = containerInstance advContainer 
                 }
                 }


                deploymentNode "Power BI Service" {
                        tags "Reporting - Power BI" "Data Center"
                        PowerBIReportsInstance  = containerInstance PowerBIReports
                    }
                deploymentNode "Data Center - OpsGenie" "" "SaaS"{
                    tags "OpsGenie" "Server"
                    opsGenieInstance = containerInstance opsGenieContainer

                    }

                deploymentNode "Data Center - Previder" {
                    #NetworkControllerPreviderInstance = containerInstance NetworkControllerPrevider
                    tags "Data Center" "Data Center - Previder"
                    NetworkControllerPrevider = infrastructureNode "Network Controller Previder" {
                        -> NetworkControllerObvion "Network Link 1"
                        -> NetworkControllerObvion "Network Link 2"
                        
                    }
                    deploymentNode "VMWare" {

                        deploymentNode "SystemDevelopment" "" "Linux" {
                            tags "Server" "SVN"
                            svnInstance = containerInstance svnContainer
                            pwdInstance = containerInstance pwdContainer
                            rdkInstance = containerInstance rdkContainer
                            fitInstance = containerInstance fitContainer
                            lqbInstance = containerInstance lqbContainer

                            
                            }
                        deploymentNode "MicroStrategy Server"  ""  "Linux" {
                            tags "MicroStrategy" "Server"
                            MicroStrategyReportsInstance = containerInstance MicroStrategyReports
                            MicroStrategySemanticLayersInstance = containerInstance MicroStrategySemanticLayers
                        }
                
                        deploymentNode "Monitoring Server" "" "Linux"{
                            tags "Server"
                            zoetesEmailServerInstance   = containerInstance zoetesEmailServerContainer
                            zenossEventInstance         = containerInstance zenossEventContainer 
                            }

                        deploymentNode "Repository Server" "" "Linux"{
                                tags "Server" 
                                idqDatabaseInstance = containerInstance idqDatabaseContainer  {
                                    tags "Postgress"
                                }
                                MicroStrategyRepositoryInstance = containerInstance MicroStrategyRepositoryComponent {
                                    tags "Oracle"
                                }

                        }    
                        deploymentNode "ETL Server" "" "Linux"{
                            tags "Server"
                            deploymentNode "Java VM" {
                                tags "Java VM"
                                scdInstance = containerInstance scdContainer
                                islInstance = containerInstance islContainer
                                dctInstance = containerInstance dctContainer
                                damInstance = containerInstance damContainer
                                etlEngineInstance = containerInstance etlEngine
                                hitInstance = containerInstance hitContainer
                                

                            }
                        }                   
                        deploymentNode "Netezza Datawarehouse Appliance" "Netezza" "version: 7.2.1.5-P1" {
                            tags "Server" "Netezza"

                            hdaInstance = containerInstance hdaContainer
                            bdaInstance = containerInstance bdaContainer
                            dwaInstance = containerInstance dwaContainer
                            fraInstance = containerInstance fraContainer
                            ddaInstance = containerInstance ddaContainer
                            expInstance = containerInstance expContainer

                     }     
                    }                   
                    
                    
        
            }


                    
                
        }
}