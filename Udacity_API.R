library(jsonlite)
library(httr)

# Load credentials
path <- '/Users/jas/tokens/' #change to the path where your API key in a JSON file is stored
json_file <- paste0(path,'udacity.json') #this file has the API_key 
credentials <- fromJSON(json_file, flatten=TRUE)

# Function to generate results for most of the API calls without start and end date arguments
getJSON <- function(requestURI){
  certifications <- GET(requestURI,
                        add_headers(Authorization = credentials$API_Key), #the JSON file with your API key has a key called API_KEY
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
