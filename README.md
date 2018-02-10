# Simple Shell for Publishing AWS-SNS (only from MacOS) 

this is simple shell for publishing by simple notification service of aws

## How to use
add this export-settings to your .bash_profile

````
export AWS_ACCESS_KEY_ID={ your aws_key_id }
export AWS_SECRET_ACCESS_KEY={ your aws_key }
export AWS_DEFAULT_REGION={ your aws_region }
export AWS_DEFAULT_OUTPUT=json
````

and source .bash_profile

so you can publish like this

````
$ sh ./pushNotification.sh { your endpointArn_suffix } { "Android" or "iOS" }
````

if you don't know your endpointArn in AWS SNS Application
then you can search endpointArn like this

````
$ sh ./selectEndpointArn.sh { search text ex.) "test" }  { "Android" or "iOS" }
````
