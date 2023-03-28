
     model {
            
     
        group "People" {
            #erpStaff    = person "ERP Staff" "ERP" "Internal Staff"
            
 
        }

        group "Systems" {
            businessResultsSystem = softwaresystem "Business Results System" ""  {
                businessInternalContainer = container "Business Internal Factors"                 {
                    customerSatisfactionComponent = component "Customer Satisfaction"
                    competitivenessComponent = component "Competitie Kracht"
                    

                }
                businessCostsContainer = container "Business External Factors" {
                    failingProjectsComponent = component "Failing Projects"
                    productivityComponent = component "Productiviteit"
                }
            }

            dqResultsSystem           = softwaresystem "DQ Benefit System" "DQ Benefit" "System InScope" {
                
                dqBenefitsContainer = container "DQ Benefits" {
                    dataIntegrationCapability = component "Data Integration"

                }
                dqCostsContainer = container "DQ Costs" {
                    dataStandardization = component "Data Standardization"
                    
                }
            
            }

        }
 ###########
        # Relations
        group "Relations" {
            dataIntegrationCapability -> productivityComponent "+"



        }
        
        }
