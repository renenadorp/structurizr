
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