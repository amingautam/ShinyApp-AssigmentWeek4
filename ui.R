library(shiny)
library(ggplot2)  # for the diamonds dataset

shinyUI(pageWithSidebar(
    headerPanel('My ShinyApp'),
    sidebarPanel(
        textInput("caption", "Caption:", "My Help/Documentation Page"),
        helpText('This caption changes reflect on the Main panel (on the right)
                 HELP tab as soon as you start making changes to the text field.'),
        checkboxGroupInput('show_vars', 'Columns in Iris to show:', names(iris),
                           selected = names(iris)),
        #submitButton("Update View"),
        actionButton("goButton","Go Button (for IRIS tab ONLY)!!"),
        helpText('For the Iris tab, we can select iris variables to show in the table;
             by selecting the check boxes BUT the changes WONT apply until 
            you press the GO button.  See the HELP Tab for more info.')
        
    ),
    mainPanel(
        tabsetPanel(
            tabPanel('Help/HOW-TO',
                     h1(textOutput("caption")),
                     includeHTML("ShinyProjectHelp.html")),
            tabPanel('Iris',
                     #h1(textOutput("caption")),
                     dataTableOutput("mytable3")),
                     #verbatimTextOutput("summary")),
            tabPanel('Summary',
                     helpText('For the Summary tab, we can select iris variables to show;
             by selecting the check boxes and the changes WILL apply 
             even WITHOUT pressing the GO button. See the HELP Tab for more info.'),
                      verbatimTextOutput("summary")),
            tabPanel('Plot/Graph',
                     helpText('For the Plot/Graph tab, we can select iris variables to show;
             by selecting the check boxes and the changes WILL apply 
                              even WITHOUT pressing the GO button. See the HELP Tab for more info.'),
                     plotOutput("plotOut"))
            
            
        
            
        )
    )
    
)

)
