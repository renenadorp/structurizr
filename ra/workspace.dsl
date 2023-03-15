/*
workspace "${ORGANISATION_NAME} - ${ARCHITECTURE_NAME}" {
*/
workspace "Inergy Data Platform Reference Architecture" "Inergy Data Platform Reference" {
    
    !docs wiki
    !adrs adrs
    !include constants.dsl

    !include model.dsl
    !include views.dsl

}


