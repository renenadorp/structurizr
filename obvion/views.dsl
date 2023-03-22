views {
    systemlandscape "dataPlatformLandscape" {
        include *
        autoLayout lr
    }    

    systemcontext DataPlatformSystem "SystemContext" {
        include *
        
        autoLayout 
    }

    container DataPlatformSystem "Container" {
        include element.type==container
        autoLayout tb
    }


    deployment DataPlatformSystem "Live" "LiveDeployment" {
        include element.type==containerInstance element.type==deploymentNode
        autoLayout lr
    }    


    !include styles.dsl

    !include themes.dsl
    

}