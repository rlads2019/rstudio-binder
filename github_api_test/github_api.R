tk <- 'b84e27b38e2bcee15f31064f328698134c6adee3'

repos <- gh::gh('/user/repos', .token = tk)

# Create new repo
new_repo <- gh("POST /user/repos", name = "github-api-test", .token = tk)

# Create a fork
fork_from_rlads <- gh("POST /repos/:owner/:repo/forks",
                      owner = 'rlads2017G1',
                      repo = 'taiwan.github.io',
                      .token = tk)

# Delete a repo (requires delete_repo)
delete_fork <- gh("DELETE /repos/:owner/:repo",
                  owner = "liao961120",
                  repo = "taiwan.github.io",
                  .token = tk)


# Create/Upload a file
upload_file <- function(file, owner, repo, path, token) {
  url <- paste0('https://api.github.com/repos/',
                owner, '/', repo, '/contents/', path)
  rq <- httr::PUT(url, httr::verbose(), encode = 'json',
            httr::add_headers(`Authorization` = paste0('token ', token)),
            body = list(
              content = base64enc::base64encode(file),
              committer = list(name = 'Yongfu',
                               email = 'liao961120@gmail.com'),
              message = 'Commit from gh API')
            )
  return(httr::content(rq))
}

# Get file sha
get_sha <- function(owner, repo, path, token) {
  url <- paste0('https://api.github.com/repos/',
                owner, '/', repo, '/contents/', path)
  rq <- httr::GET(url,
            httr::add_headers(`Authorization` = 
                          paste0('token ', token)),
            httr::verbose())
  return(httr::content(rq))
}


# Pull request
pr <- gh("POST /repos/:owner/:repo/pulls", 
         owner = "rlads2017G1", repo = "taiwan.github.io",
         title = "pull request via GitHub API",
         head = 'liao961120:master',
         base = "master",
         body = paste(readLines('pl_message.md'),
                      collapse = '\n'),
         maintainer_can_modify = TRUE,
         .token = tk)

