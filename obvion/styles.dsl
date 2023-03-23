styles {
            element "Internal Staff" {
                color #ffffff
                background #335b43
                fontSize 22
                shape Person
            }
            element "Datalake" {
                color #ffffff

                fontSize 22
                shape Folder
            }

            element "FTP Server" {
                shape Folder 
            }
            element "Customer" {
                background #08427b
                shape Person
            }
            element "System InScope" {
                stroke grey
                background white
                color grey
                shape RoundedBox
            }
            element "System OutScope" {
                stroke grey
                background white
                color grey
                shape RoundedBox
            }
            element "Container" {
                stroke grey
                background white
                color grey
                shape RoundedBox
            }
            element "Web Browser" {
                shape WebBrowser
            }
            element "Mobile App" {
                shape MobileDeviceLandscape
            }

            element "Database - Netezza" {
                stroke grey
                background white
                color grey
                shape Cylinder
            }
            element "Database - Virtual" {
                stroke grey
                border dashed
                background white
                color grey
                shape Cylinder
            }
            
            element "Component" {
                background #ffffff
                stroke #578BCF
                color  #578BCF
                shape Component
            }
            element "Data Center" {
                stroke grey
                strokeWidth 20
            }


            element "Server" {
                stroke "#820003"
                strokeWidth 20

            }

        
        }