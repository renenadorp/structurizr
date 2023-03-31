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
                    tags "Data Center - Kadaster" "Data Center" "Kadaster"
                deploymentNode "BAG" {
                    kstBAGDatasetInstance = containerInstance kstBAGDatasetContainer

                    }
                 }
            deploymentNode "BKR" {
                tags "Data Center"
                    bkrBKRDatasetInstance = containerInstance bkrBKRDatasetContainer

                    }
            deploymentNode "Calcasa" {
                tags "Data Center"
                calCALDatasetInstance = containerInstance calCALDatasetContainer

             }
                 
                deploymentNode "Data Center - MoneyView" {
                    tags "Data Center - MoneyView" "Data Center" "MoneyView"
                deploymentNode "MVW" {
                    mvwMVWDatasetInstance = containerInstance mvwMVWDatasetContainer

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
                            bkrDataFullInstance = containerInstance bkrDataFull
                            calDataInInstance = containerInstance calDataIn
                            mvwDataFullInstance = containerInstance mvwDataFull
                            }
                    
                    deploymentNode "FTP Server (OutFlow)" {
                            tags "Server"                    
                        expDataIRBInstance   = containerInstance expDataIRB
                        expDataIFRSInstance  = containerInstance expDataIFRS
                        expDataPCCInstance   = containerInstance expDataPCC
                        expDataCALInstance    = containerInstance expDataCAL
                        expDataFINREPInstance    = containerInstance expDataFINREP
                        expDataCOREPInstance    = containerInstance expDataCOREP
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
                            tags "Server" 
                            svnInstance = containerInstance svnContainer
                            pwdInstance = containerInstance pwdContainer
                            rdkInstance = containerInstance rdkContainer
                            fitInstance = containerInstance fitContainer
                            lqbInstance = containerInstance lqbContainer
                            idsInstance = containerInstance idsContainer

                            
                            }
                        deploymentNode "MicroStrategy Server"  ""  "Linux" {
                            tags "" "Server"
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
                                
                        }
                        deploymentNode "Oracle Server" "" "Linux"{
                                tags "Server" 
 
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
                            deploymentNode "File System" {
                                sqlScriptsInstance = containerInstance sqlScriptsContainer
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