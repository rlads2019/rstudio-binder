tk='6b478973c8dc2d3ab9bd0a0d8d245db87aac9c31'
# Create Repo
curl -i -H "Authorization: token ${tk}" \
    -d '{ "name": "github-api-test3", "auto_init": true, "private": false, "gitignore_template": "nanoc" }' \
    https://api.github.com/user/repos
## Check created repo    
curl -i https://api.github.com/repos/liao961120/github-api-test


# Create a Fork
curl -i -H "Authorization: token ${tk}" \
    -X POST https://api.github.com/repos/rlads2017G1/taiwan.github.io/forks
   
# Create a file (upload file)
file=$( base64 iris.csv )

curl -X PUT -H "Authorization: token ${tk}" \
    -d '{ "message": "commit from github", "committer": { "name": "Yongfu Liao", "email": "liao961120@gmail.com" }, "content": "base64encoding"}' \
    https://api.github.com/repos/liao961120/github-api-test/contents/api/iris.csv


tk='6b478973c8dc2d3ab9bd0a0d8d245db87aac9c31'
curl -X PUT -H "Authorization: token ${tk}" \
    -d '{ "message": "commit from github", "committer": { "name": "Yongfu Liao", "email": "liao961120@gmail.com" }, "content": "base64encoding"}' \
    https://httpbin.org/put


