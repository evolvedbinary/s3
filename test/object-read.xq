xquery version "3.1";

(: Test object:read :)

import module namespace aws_config = "http://history.state.gov/ns/xquery/aws_config" at "/db/apps/s3/modules/aws_config.xqm";
import module namespace object = "http://www.xquery.co.uk/modules/connectors/aws/s3/object" at "/db/apps/s3/modules/xaws/modules/uk/co/xquery/www/modules/connectors/aws-exist/s3/object.xq";

let $aws-access-key := $aws_config:AWS-ACCESS-KEY
let $aws-secret := $aws_config:AWS-SECRET-KEY
let $bucket := "static.history.state.gov"
let $key := "robots.txt"
return
    (
        object:get-config-acl($aws-access-key, $aws-secret, $bucket, $key),
        object:metadata($aws-access-key, $aws-secret, $bucket, $key),
        object:read($aws-access-key, $aws-secret, $bucket, $key)
    )