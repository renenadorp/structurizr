/*
workspace "${ORGANISATION_NAME} - ${ARCHITECTURE_NAME}" {
*/
workspace "DQ" "DQ" {
    
    !docs wiki
    !adrs adrs
    !include constants.dsl

    !include model.dsl
    !include views.dsl

}


