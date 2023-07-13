views {
       
    systemlandscape "dataPlatformLandscapeSimple" {
        include dataScientist DataManagementEmployee BeveiligingEmployee BusinessUser BusinessAnalyst SupportEmployee ExternalUser CustomerSupportSystem erpSystem dataScienceSystem   crmSystem wmsSystem monitoringSystem metadataSystem  srcSystem dataPlatformSystem  enterpriseReportingSystem   enrichtmentSystem mdmSystem EnterprisePortalSystem DataSharingSystem iamSystem 
        exclude "DataManagementEmployee -> EnterpriseReportingSystem"
        exclude "DataManagementEmployee -> DataPlatformSystem"
        exclude "iamSystem -> *"
        #autoLayout tb
    }

    systemcontext dataPlatformSystem "SystemContext_DataPlatform " {
        include *
        exclude element.type==Person
    }

    container dataPlatformSystem "Container_DataPlatform" {
        include *

    }


    

    container metadataSystem "Metadata" {
        include *

        autoLayout lr
    }



    !include styles.dsl

    !include themes.dsl
    

}