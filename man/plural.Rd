% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/misc_funs.R
\name{plural}
\alias{plural}
\alias{plural_len}
\title{Adds an s and/or a singular/plural verb depending on the argument's length}
\usage{
plural(x, type, s, verb = FALSE, past = FALSE)

plural_len(x, type, s, verb = FALSE, past = FALSE)
}
\arguments{
\item{x}{An integer of length one (\code{plural}) or a vector \code{plural_len}.}

\item{type}{Character string, default is missing. If \code{type = "s.is.past"} it means that an "s" will be added if \code{x} is greater than 1 (or of length greater than one for \code{plural_len}); it will be followed by the verb "to be" in past tense in singular or plural form depending on \code{x}. This argument must be made of keywords separated by points without space, the keywords are "s", "past" and a verb (i.e. any thing different than "s" and "past"). Missing keywords mean their value is equal to \code{FALSE}.}

\item{s}{Logical, used only if the argument type is missing. Whether to add an "s" if the form of \code{x} is plural. Default is missing: equals to \code{TRUE} if no other argument is provided, \code{FALSE} otherwise.}

\item{verb}{Character string or \code{FALSE}, used only if the argument type is missing. The verb to be inserted in singular or plural depending on the value of \code{x}. default is \code{FALSE}.}

\item{past}{Logical, used only if the argument type is missing. Whether the verb should be in past tense. Default is \code{FALSE}.}
}
\value{
Returns a character string of length one.
}
\description{
Utilities to write user-level messages. These functions add an \sQuote{s} or a verb at the appropriate form depending on whether the argument is equal to unity (\code{plural}) or of length one (\code{plural_len}).
}
\section{Functions}{
\itemize{
\item \code{plural_len()}: Adds an s and conjugate a verb depending on the length of \code{x}

}}
\examples{

# Let's create an error message when NAs are present
my_crossprod = function(mat){
 if(anyNA(mat)){
   row_na = which(rowSums(is.na(mat)) > 0)
   n_na = length(row_na)
   stop("In argument 'mat': ", n_letter(n_na), " row", plural(n_na, "s.contain"),
        " NA values (", ifelse(n_na<=3, "", "e.g. "), "row",
        enumerate_items(head(row_na, 3), "s"),
        "). Please remove ", ifunit(n_na, "it", "them"), " first.")
 }
 crossprod(mat)
}

mat = matrix(rnorm(30), 10, 3)
mat4 = mat1 = mat
mat4[c(1, 7, 13, 28)] = NA
mat1[7] = NA

# Error raised because of NA: informative (and nice) messages
try(my_crossprod(mat4))
try(my_crossprod(mat1))

}
\author{
Laurent Berge
}
