views {
    systemlandscape "dataPlatformLandscape" {
        include *
        autoLayout lr
    }    
    systemlandscape "dataPlatformLandscapeSimple" {
        include monitoringSystem metadataSystem  srcSystem dataPlatformSystem  enterpriseReportingSystem   enrichtmentSystem mdmSystem EnterprisePortalSystem
        autoLayout tb
    }

    systemcontext dataPlatformSystem "SystemContext" {
        include * 
    }

    container dataPlatformSystem "DataPlatform" {
        include *

    }


    container EnterpriseReportingSystem "Reporting" {
        include *

        autoLayout lr
    }

    container metadataSystem "Metadata" {
        include *

        autoLayout lr
    }

    component baContainer "baContainer"    {
        include *
        autoLayout
    }

    component orchContainer "Orchestration"    {
        include *
        autoLayout
    }

    !include styles.dsl

    !include themes.dsl
    

}