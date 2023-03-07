/*
 * docker run -it --rm  -p 8080:8080 -v /Users/rnadorp/Documents/Internal/Structurizr/ra/:/usr/local/structurizr structurizr/lite
 * docker run --name nginx   -d --rm  -p 80:80   -v /Users/rnadorp/Documents/Internal/Structurizr/ra:/usr/share/nginx/html -d nginx
 * docker network connect structurizr-net struct
 * docker network connect structurizr-net ngnix
 * docker exec -ti ngnix ping struct
 *ONLY ONCE, BEFORE docker network connect statements: docker network create structurizr-net 
*/
!include constants.dsl

workspace "${ORGANISATION_NAME} - ${ARCHITECTURE_NAME}" {

    !docs wiki
    !adrs adrs

    !include model.dsl
    views {
        systemlandscape "SystemLandscape" {
            include *
            
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
            #autoLayout
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


        themes ${THEMES}

}
}

       