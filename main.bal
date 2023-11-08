// import ballerina_connection_failure.client_cloud_manager as cloudManager;
// import ballerina_connection_failure.client_secret_manager as secretManager;
import ballerina_connection_failure.client_go_test as goTest;

// import ballerina/io;

// import ballerina/lang.runtime;

public function main() returns error? {
    foreach int i in 0 ..< 200 {
        _ = check goTest:getHelloWorld();
    }
}

// string clusterId = "7eca5163-6a37-ee11-b8f0-000d3adac5f0";
// secretManager:SecretItem[] secrets = [];
// secrets.push({
//     "Name": "01ee6dd0-033c-1b78-9316-c9af8891539b"
// });
// secrets.push({
//     "Name": "01ee6e51-aeda-11c0-8b35-a7129d8aebc6"
// });
// foreach int i in 0 ..< 10 {
//     io:println("Before calling secret manager client, lood id : ", i + 1);
//     _ = check secretManager:storeConfigsInKV(clusterId, secrets);
//     // runtime:sleep(2);
//     io:println("###### After calling secret manager client, lood id : ", i + 1, " ######");
// }
// string[] envList = ["1576756c-fb69-4444-8f46-2d7b4865022b", "3283b9bf-a21e-4003-aadc-588aca4387ea", "0af31d8b-9f84-4e20-b42d-fb4a5927940d", "ad5a37e4-9c92-4952-9694-c3269fdd8cdc", "842e5f7b-eed1-423b-98c2-e074c008c949"];
// foreach int i in 0 ..< 5 {
//     io:println("Before calling cloud manager client, lood id : ", i + 1);
//     _ = check cloudManager:getClusterID(envList[i]);
//     // runtime:sleep(1);
//     io:println("###### After calling cloud manager client, lood id : ", i + 1, " ######");
// }
