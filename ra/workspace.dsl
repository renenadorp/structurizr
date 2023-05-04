/*
workspace "${ORGANISATION_NAME} - ${ARCHITECTURE_NAME}" {
*/
workspace "Inergy Data Platform Referentie Architectuur" "Inergy Data Platform Referentie Architectuur" {
    
    !docs wiki
    !adrs adrs
    !include constants.dsl

    !include model.dsl
    !include views.dsl

}


