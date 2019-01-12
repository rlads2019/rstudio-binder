decrypt <- function(password) {
  rcrypt::decrypt('encrypted.gpg', 
                  output = 'temp', 
                  passphrase = password)
  if (!file.exists('encrypted.gpg')) {
    stop('No encrypted file')
  }
  if (file.exists('temp')) {
    token <- readLines('temp')
    file.remove('temp')
    return(token)
  } else {
    warning('Wrong Password')
    return(NULL)
  }
}