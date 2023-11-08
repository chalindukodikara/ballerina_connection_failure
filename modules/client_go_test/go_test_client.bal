// Copyright (c) 2023, WSO2 Inc. (http://www.wso2.com). All Rights Reserved.
//
// This software is the property of WSO2 Inc. and its suppliers, if any.
// Dissemination of any information or reproduction of any material contained
// herein in any form is strictly forbidden, unless permitted by WSO2 expressly.
// You may not alter or remove any copyright or other notice from copies of this content.
import ballerina_connection_failure.config;

import ballerina/http;

final http:Client goTestEndpoint = check new (config:goTestUrl);

# `getHelloWorld` function will return the hello world string.
#
# + return - Outputs the cluster id.
public isolated function getHelloWorld() returns string|error {
    string endpoint = string ``;
    http:Response|error resp = goTestEndpoint->get(endpoint);
    if resp is error {
        return resp;
    }
    return (check resp.getTextPayload()).toString();
}
