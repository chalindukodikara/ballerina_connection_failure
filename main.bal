import ballerina_connection_failure.client_cloud_manager as cloudManager;
import ballerina_connection_failure.client_secret_manager as secretManager;

// import ballerina_connection_failure.client_go_test as goTest;
import ballerina/io;

// import ballerina/lang.runtime;

public function main() returns error? {
    string[] envList = ["49eae34b-fb17-479f-a657-0bba998a4e79", "433a2e50-5d4b-4efb-a994-680173bc1079", "0af31d8b-9f84-4e20-b42d-fb4a5927940d", "ad5a37e4-9c92-4952-9694-c3269fdd8cdc", "842e5f7b-eed1-423b-98c2-e074c008c949"];
    io:println("Before calling cloud manager client");
    string|error resp = check cloudManager:getClusterID(envList[1]);
    io:println("Before calling secret manager client");
    string|error configValueList = check secretManager:retrieveConfigValuesFromKV();
    string|error configValueList2 = check secretManager:retrieveConfigValuesFromKV();
    io:println("Before calling cloud manager client 2");
    string|error resp2 = check cloudManager:getClusterID(envList[1]);
    io:println("###### After calling cloud manager client ######");
}

