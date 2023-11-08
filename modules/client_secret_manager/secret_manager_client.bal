import ballerina_connection_failure.config;

import ballerina/http;

final http:Client secretManagerEndpoint = check new (config:secretManagerUrl);
const SECRET_MANAGER = "SECRET_MANAGER";

# `storeConfigsInKV` function will return references after storing config values in key vault of the respective cluster.
#
# + context - The context of the request.
# + clusterId - The cluster id of the environment.
# + secrets - The secrets to be stored.
# + return - Outputs the reference details of the stored configs or an error.
public isolated function storeConfigsInKV(string clusterId, SecretItem[] secrets)
                                                                                    returns string|error {
    SecretGroup secretGroup = {
        ClusterId: clusterId,
        SystemSecret: false,
        Secrets: secrets
    };
    http:Response|error resp = secretManagerEndpoint->/api/v1/secrets/set.post(secretGroup.toJson());
    if resp is error {
        return resp;
    }
    return (check resp.getTextPayload()).toString();
}
