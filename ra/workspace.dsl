/*
workspace "${ORGANISATION_NAME} - ${ARCHITECTURE_NAME}" {
*/
workspace "Inergy Data Platform" "Inergy Data Platform Reference" {
    
    !docs wiki
    !adrs adrs
    !include constants.dsl

    !include model.dsl
    views {
        systemlandscape "dataPlatformLandscape" {
            include *
            autoLayout lr
        }

        systemcontext dataPlatformSystem "SystemContext" {
            include *
            autoLayout
        }

        container dataPlatformSystem "Containers" {
            include *

            autoLayout
        }

        !include styles.dsl
        
        themes https://172.21.0.4:8081/Azure/theme.json

    }
}


