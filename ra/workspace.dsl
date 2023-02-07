/*
 docker run --name struct -it --rm  -p 8080:8080 -v /Users/rnadorp/Documents/Internal/Structurizr/ra/:/usr/local/structurizr structurizr/lite
 docker run --name ngnix   -d --rm  -p 7070:80   -v /Users/rnadorp/Documents/Internal/Structurizr/ra:/usr/share/nginx/html:ro -d nginx
 docker network connect structurizr-net struct
 docker network connect structurizr-net ngnix
 
 docker exec -ti ngnix ping struct


 ONLY ONCE, BEFORE docker network connect statements: docker network create structurizr-net 
 
*/
!include constants.dsl

workspace "${ORGANISATION_NAME} - ${ARCHITECTURE_NAME}" {

    !docs wiki
    !adrs  adrs

    model {
        enterprise "${ORGANISATION_NAME}" {
            domainExpertFinance = person "Domain Expert Finance" "" "Inergy - Person"
            domainExpertDataGovernance = person "Domain Expert DG" "" "Microsoft Azure - "
            dataGovernanceSystem = softwaresystem "Data Governance System" {
                dataManagementApplication = container "Purview" "Descr" "Technology"   

            }
            erpSystem = softwaresystem "ERP" {
                erpFinance = container "Finance" "descr" "techn" "Microsoft Azure - Dynamics"
            }
            crmSystem = softwaresystem "CRM" {
                crmOppMgt = container "Opportunity Management" "descr" "techn" "<tag>"
            }
            dataPlatformSystem         = softwaresystem "Data Platform"   {
                dpDataLayerIngest          = container  "Layer Ingest"    "descr" "techn"     "Microsoft Azure - Datalake" {
                    dpIngestFileStorage    = component  "File Storage" "Descr" "Techn" "Microsoft Azure - FileStorage"
                }
                dpDataLayerDataArea        = container      "Layer Data Area" "descr" "Snowflake" "Microsoft Azure - Snowflake"
                dpDataLayerBusinessArea    = container      "Layer Business Area" "descr" "Snowflake" "Microsoft Azure - Snowflake"
                dpDataLayerInformationArea = container      "Layer Information Area" "descr" "Snowflake" "Microsoft Azure - Snowflake"
            }
        }



    # relationships between people and software systems
    domainExpertDataGovernance -> dataGovernanceSystem "Manages Data Governance"
    domainExpertFinance -> dataGovernanceSystem "Uses Data Governance"
    domainExpertFinance -> erpFinance "Manages Finance"
    
    
    # relationships to/from containers
    erpFinance -> dpDataLayerIngest "Push data to"
    crmSystem -> dpDataLayerIngest "Push data to"
    dpDataLayerIngest -> dpDataLayerDataArea "Transform to"
    dpDataLayerDataArea -> dpDataLayerBusinessArea "Transform to"


    # relationships to/from components
    

    }
    views {
        systemlandscape "SystemLandscape" {
            include *
            autoLayout
        }

        systemcontext dataGovernanceSystem "SystemContext" {
            include dataGovernanceSystem
            animation {
                dataGovernanceSystem

            }
            autoLayout
        }
        systemcontext dataPlatformSystem "DataPlatformContext" {
            include dataGovernanceSystem dataPlatformSystem
            animation {
                dataGovernanceSystem

            }
            autoLayout
        }

        container dataPlatformSystem "DataPlatformContainers" {
            include *
            animation {
                dpDataLayerIngest
                dpDataLayerDataArea
                dpDataLayerBusinessArea
            }
            autoLayout
        }

    
          styles {
            element "Person" {
                color #a52025
                fontSize 22
                shape Person
            }
            element "Customer" {
                background #08427b
            }
    
            element "Software System" {
                background #881b1f
                color #ffffff
                shape RoundedBox
            }
            element "Existing System" {
                background #999999
                color #ffffff
            }
            element "Container" {
                background #a52025
                color #ffffff
            }
            element "Web Browser" {
                shape WebBrowser
            }
            element "Mobile App" {
                shape MobileDeviceLandscape
            }
            element "Database" {
                shape Cylinder
            }
            element "Component" {
                background #85bbf0
                color #000000
            }

            element "Microsoft Azure - Azure Synapse Analytics" {
                color #ffffff
                background #999999
                opacity 90

            }
        }


        themes https://raw.githubusercontent.com/structurizr/themes/master/microsoft-azure-2021.01.26/theme.json
        
}
}

       