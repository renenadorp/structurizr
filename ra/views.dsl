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
        autoLayout lr
    }

    container dataPlatformSystem "DataPlatform" {
        include *

        autoLayout lr
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