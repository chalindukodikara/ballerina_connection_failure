import ballerina_connection_failure.client_secret_manager as secretManager;

import ballerina/io;

// The `main` function can accept command-line arguments and return `error` or `nil`.
public function main() returns error? {
    string clusterId = "7eca5163-6a37-ee11-b8f0-000d3adac5f0";
    secretManager:SecretItem[] secrets = [];
    secrets.push({
        "Name": "01ee6dd0-033c-1b78-9316-c9af8891539b",
        "Value": "test-1"
    });
    secrets.push({
        "Name": "01ee6e51-aeda-11c0-8b35-a7129d8aebc6",
        "Value": "test-2"
    });
    foreach int i in 0 ..< 5 {
        io:println("Before calling secret manager client, lood id : ", i + 1);
        _ = check secretManager:storeConfigsInKV(clusterId, secrets);
        io:println("###### After calling secret manager client, lood id : ", i + 1, " ######");
    }
}
