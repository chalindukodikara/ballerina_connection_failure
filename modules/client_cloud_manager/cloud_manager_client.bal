// Copyright (c) 2023, WSO2 Inc. (http://www.wso2.com). All Rights Reserved.
//
// This software is the property of WSO2 Inc. and its suppliers, if any.
// Dissemination of any information or reproduction of any material contained
// herein in any form is strictly forbidden, unless permitted by WSO2 expressly.
// You may not alter or remove any copyright or other notice from copies of this content.
import ballerina_connection_failure.config;

import ballerina/http;

final http:Client cloudManagerEndpoint = check new (config:cloudManagerUrl);
const CLOUD_MANAGER = "CLOUD_MANAGER";

# `getClusterID` function will return cluster ID of a given environment template uuid.
#
# + envTemplateUuid - The environment template uuid.
# + return - Outputs the cluster id.
public isolated function getClusterID(string envTemplateUuid) returns string|error {
    map<string|string[]> headers = {"x-organization-id": "0", "x-project-id": "global"};
    string endpoint = string `/api/v1/env-templates/${envTemplateUuid}`;
    http:Response|error resp = cloudManagerEndpoint->get(endpoint, headers);
    if resp is error {
        return resp;
    }
    return (check resp.getTextPayload()).toString();
}
