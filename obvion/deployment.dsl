group "DeploymentEnvironments" {
            deploymentEnvironment "Production" {
                deploymentNode "AdviseursPortaal" {
                    tags "Data Center"
                        advInstance = containerInstance advContainer 
                    
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
                        tags  "Obvion CRM" "Server"

                        crmInstance = containerInstance crmContainer
                        crmViewsInstance = containerInstance crmViews
                    
                 }
                 }


                deploymentNode "Power BI Service" {
                        tags "Reporting - Power BI" "Data Center"
                        PowerBIReportsInstance  = containerInstance PowerBIReports
                    }
                deploymentNode "Data Center - OpsGenie" "" "SaaS"{
                    opsGenieInstance = containerInstance opsGenieContainer

                    }
                
                
                
                deploymentNode "Data Center - Previder" {
                    tags "Data Center" "Data Center - Previder"
                    deploymentNode "SystemDevelopment" "" "Linux" {
                        tags "Server" "SVN"
                        svnInstance = containerInstance svnContainer
                        pwdInstance = containerInstance pwdContainer
                        rdkInstance = containerInstance rdkContainer
                        
                    }
                    deploymentNode "Microstrategy Server"  ""  "Linux" {
                        tags "Microstrategy" 
                        MicrostrategyReportsInstance = containerInstance MicrostrategyReports
                        MicrostrategySemanticLayerInstance = containerInstance MicrostrategySemanticLayer
                    }
            
                    deploymentNode "Monitoring Server" "" "Linux"{
                        tags "Server"
                        zoetesEmailServerInstance   = containerInstance zoetesEmailServerContainer
                        zenossEventInstance         = containerInstance zenossEventContainer 
                        }

                    deploymentNode "Repository Server" "" "Linux"{
                            tags "Server" 
                            idqDatabaseInstance = containerInstance idqDatabaseContainer 
                            MicrostrategyRepositoryInstance = containerInstance MicrostrategyRepositoryComponent

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

                        }
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
                    
                    
        
            }


                    
                
        }
}