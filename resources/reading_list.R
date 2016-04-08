reading_list <- function(file) {
    x <- read.table(
        file,
        header = FALSE,
        sep = "|",
        col.names = c("Title", "Author", "URL", "Category"),
        stringsAsFactors = FALSE
    )
    x$Title <- paste0(
        "<a href='",
        x$URL,
        "'>",
        x$Title,
        "</a>"
    )
    x <- x[c("Title", "Author", "Category")]
    x <- DT::datatable(
        x,
        rownames = FALSE,
        escape = FALSE,
        options = list(
            dom='t',
            pageLength = 50,
            ordered = FALSE
        )
    )
    return(x)
}