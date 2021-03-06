% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/handle.r
\name{handle}
\alias{handle}
\title{Create a handle tied to a particular host.}
\usage{
handle(url, cookies = TRUE)
}
\arguments{
\item{url}{full url to site}

\item{cookies}{DEPRECATED}
}
\description{
This handle preserves settings and cookies across multiple requests. It is
the foundation of all requests performed through the httr package, although
it will mostly be hidden from the user.
}
\note{
Because of the way argument dispatch works in R, using handle() in the
http methods (See \code{\link[=GET]{GET()}}) will cause problems when trying to
pass configuration arguments (See examples below). Directly specifying the
handle when using http methods is not recommended in general, since the
selection of the correct handle is taken care of when the user passes an url
(See \code{\link[=handle_pool]{handle_pool()}}).
}
\examples{
handle("http://google.com")
handle("https://google.com")

h <- handle("http://google.com")
GET(handle = h)
# Should see cookies sent back to server
GET(handle = h, config = verbose())

h <- handle("http://google.com", cookies = FALSE)
GET(handle = h)$cookies
\dontrun{
# Using the preferred way of configuring the http methods
# will not work when using handle():
GET(handle = h, timeout(10))
# Passing named arguments will work properly:
GET(handle = h, config = list(timeout(10), add_headers(Accept = "")))
}

}
