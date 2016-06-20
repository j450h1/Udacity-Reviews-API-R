library(jsonlite)
library(httr)

# Load Credentials
path <- '/Users/jas/tokens/'
json_file <- paste0(path,'udacity.json')
credentials <- fromJSON(json_file, flatten=TRUE)

getJSON <- function(requestURI){
  certifications <- GET(requestURI,
                        add_headers(Authorization = credentials$API_Key),
                        accept("application/json"))
  stop_for_status(certifications)
  certifications <- content(certifications)
  certifications <- toJSON(certifications, pretty=TRUE, auto_unbox=TRUE)
  return(certifications)
}

certificationsURI <- 'https://review-api.udacity.com/api/v1/me/certifications'
certifications <- getJSON(certificationsURI)

assigned.submissionsURI <- 'https://review-api.udacity.com/api/v1/me/submissions/assigned'
assigned.submissions <- getJSON(assigned.submissionsURI)

submissionsURI <- 'https://review-api.udacity.com/api/v1/me/submissions'
submissions <- getJSON(submissionsURI)

feedbackURI <- 'https://review-api.udacity.com/api/v1/me/student_feedbacks'
feedback <- getJSON(feedbackURI)

feedback.statsURI <- 'https://review-api.udacity.com/api/v1/me/student_feedbacks/stats'
feedback.stats <- getJSON(feedback.statsURI)

submissions.completedURI <- 'https://review-api.udacity.com/api/v1/me//certifications'
submissions.coompleted <- getJSON(submissions.completedURI)
