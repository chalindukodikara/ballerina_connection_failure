// Copyright (c) 2023, WSO2 LLC. (http://www.wso2.com). All Rights Reserved.
//
// This software is the property of WSO2 LLC. and its suppliers, if any.
// Dissemination of any information or reproduction of any material contained
// herein in any form is strictly forbidden, unless permitted by WSO2 expressly.
// You may not alter or remove any copyright or other notice from copies of this content.

public type CloudManagerResponseData record {|
    ClusterData data;
|};

public type ClusterData record {
    string id;
    string created_at;
    int organization_id;
    string organization_uuid;
    string env_name;
    string region;
    string choreo_env;
    string cluster_id;
    string docker_credential_uuid;
    string external_apim_env_name;
    string internal_apim_env_name;
    string sandbox_apim_env_name;
    boolean critical;
    string pdp_web_app_dns_prefix;
};
