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

    !include styles.dsl
    
    themes https://renenadorp.github.io/structurizr/ra/www/themes/Inergy/theme.json 

}