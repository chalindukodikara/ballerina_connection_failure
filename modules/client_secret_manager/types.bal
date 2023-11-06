
public type SecretItem record {
    # The name of the configuration key.
    string Name?;
    # The value of the configuration key.
    string Value?;
};

public type SecretGroup record {
    # The cluster id of the configuration group.
    string ClusterId;
    # Whether this is a system secret.
    boolean SystemSecret;
    # Config key value pairs.
    SecretItem[] Secrets;
};

public type SecretReference record {
    # The name of the config reference (this is an UUID).
    string Name?;
    # The value of the config key.
    string Value?;
    # The version of the config reference.
    string Version?;
    # The id of the config reference.
    string Id?;
};

public type SecretManagerResponseData record {
    # Reference data from secret manager.
    SecretReference[] Data;
    # Secret store provider.
    string SecretStoreProvider;
    # Secret store name.
    string SecretStoreName;
};
