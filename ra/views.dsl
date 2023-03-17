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
        include businessGlossaryContainer daContainer baContainer iaContainer maContainer

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

    component orchestrationContainer "Orchestration"    {
        include *
        autoLayout
    }

    !include styles.dsl

    !include themes.dsl
    

}