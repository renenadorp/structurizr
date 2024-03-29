views {
    // image * "image" {
    //         image www/themes/Inergy/images/netezza.jpeg
    //     }
    systemlandscape "dataPlatformLandscape" {
        include *
        #autoLayout lr
    }    

    systemcontext DataPlatformSystem "SystemContext" {
        include *
        
        autoLayout 
    }

    container DataPlatformSystem "DataPlatformContainer" {
        include element.type==container element.type==component
        autoLayout tb
    }


    deployment DataPlatformSystem "Production" "LiveDeployment" {
        include element.type==containerInstance element.type==deploymentNode
        exclude "etlEngine -> hdaContainer" 
        exclude "etlEngine -> bdaContainer" 
        exclude "etlEngine -> dwaContainer" 
        exclude "etlEngine -> fraContainer" 
        exclude "rdkContainer -> *"
        exclude "ddaDataMicroStrategyDWAComponent -> MicroStrategySemanticLayerDWA"
        exclude "ddaDataMicroStrategyFRAComponent -> MicroStrategySemanticLayerFRA"
        

        
    }    

    #filtered "DataPlatformContainer" exclude "Relationship" "FilteredDeploymentLive" "descr"



    !include styles.dsl

    !include themes.dsl
    

}