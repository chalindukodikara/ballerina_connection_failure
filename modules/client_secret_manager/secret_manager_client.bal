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
    http:Response|error resp = secretManagerEndpoint->/api/v1/secrets/get.post(secretGroup.toJson());
    if resp is error {
        return resp;
    }
    return (check resp.getTextPayload()).toString();
}

# `retrieveConfigValuesFromKV` function will return values for the provided references.
#
# + context - The context of the request.
# + clusterId - The cluster id of the environment.
# + secrets - The secrets to be retrieved.
# + return - Outputs the config values for the environment ids.
public isolated function retrieveConfigValuesFromKV()
                                                                                    returns string|error {
    SecretItem[] secrets = [];
    secrets.push({
        "Name": "01ee7ebe-c770-1ab8-ade5-584ac5adffb9"
    });
    secrets.push({
        "Name": "01ee7ebe-c770-1ab8-b16a-4188708e8251"
    });
    SecretGroup secretGroup = {
        ClusterId: "7eca5163-6a37-ee11-b8f0-000d3adac5f0",
        SystemSecret: false,
        Secrets: secrets
    };
    http:Response|error resp = secretManagerEndpoint->/api/v1/secrets/get.post(secretGroup.toJson());
    if resp is error {
        return resp;
    }
    return resp.getTextPayload();
}
