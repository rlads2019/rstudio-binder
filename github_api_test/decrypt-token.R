decrypt <- function(password) {
  rcrypt::decrypt('encrypted.gpg', 
                  output = 'temp', 
                  passphrase = password)
  if (file.exists('temp')) {
    token <- readLines('temp')
    file.remove('temp')
    return(token)
  } else return(100)
}