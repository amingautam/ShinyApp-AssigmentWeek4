library(shiny)

shinyServer(function(input, output) {
    
    output$caption <- renderText({
        input$caption
    })
    
    # customize the length drop-down menu; display 5 rows per page by default
    output$mytable3 = renderDataTable({
        input$goButton
        #iris
        library(ggplot2)
        isolate({iris[, input$show_vars, drop = FALSE]})
    }, options = list(aLengthMenu = c(5, 30, 50), iDisplayLength = 5))
  
    mytable4 <- reactive({
      switch (input$dataset,
          'mytable3' = mytable3
      )  
    })
        #iris[, input$show_vars, drop = FALSE]
    #}, options = list(aLengthMenu = c(5, 30, 50), iDisplayLength = 5))
    
    output$summary <- renderPrint({
        dataset <- iris[, input$show_vars, drop = FALSE]
        #dataset <- renderDataoutput$
        summary(dataset)
    })  
    

})
