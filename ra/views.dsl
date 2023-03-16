views {
    systemlandscape "dataPlatformLandscape" {
        include *
        autoLayout lr
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

    container MetadataSystem "Metadata" {
        include *

        autoLayout lr
    }

    component baContainer "baContainer"    {
        include *
        autoLayout
    }

    !include styles.dsl

    !include themes.dsl
    

}