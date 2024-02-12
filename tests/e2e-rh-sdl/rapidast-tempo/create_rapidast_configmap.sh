#!/bin/bash

tempo_token=$(oc create token privileged-sa -n rapidast-tempo)

# Define the content for the ConfigMap
configmap_content=$(cat <<EOF
apiVersion: v1
kind: ConfigMap
metadata:
  name: rapidast-configmap
  namespace: rapidast-tempo
data:
  helmcustomscan.policy: |
    <?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>
    <configuration>
        <policy>helm-custom-scan</policy>
        <scanner>
            <level>MEDIUM</level>
            <strength>MEDIUM</strength>
        </scanner>
        <plugins>
            <p6>
                <enabled>false</enabled>
                <level>OFF</level>
            </p6>
            <p7>
                <enabled>true</enabled>
                <level>DEFAULT</level>
            </p7>
            <p10045>
                <enabled>false</enabled>
                <level>OFF</level>
            </p10045>
            <p20019>
                <enabled>true</enabled>
                <level>DEFAULT</level>
            </p20019>
            <p40009>
                <enabled>true</enabled>
                <level>DEFAULT</level>
            </p40009>
            <p40012>
                <enabled>true</enabled>
                <level>DEFAULT</level>
            </p40012>
            <p40014>
                <enabled>false</enabled>
                <level>OFF</level>
            </p40014>
            <p40018>
                <enabled>true</enabled>
                <level>DEFAULT</level>
            </p40018>
            <p90019>
                <enabled>true</enabled>
                <level>DEFAULT</level>
            </p90019>
            <p90020>
                <enabled>true</enabled>
                <level>DEFAULT</level>
            </p90020>
            <p0>
                <enabled>false</enabled>
                <level>OFF</level>
            </p0>
            <p30001>
                <enabled>false</enabled>
                <level>OFF</level>
            </p30001>
            <p30002>
                <enabled>false</enabled>
                <level>OFF</level>
            </p30002>
            <p40003>
                <enabled>true</enabled>
                <level>DEFAULT</level>
            </p40003>
            <p40008>
                <enabled>true</enabled>
                <level>DEFAULT</level>
            </p40008>
            <p40028>
                <enabled>false</enabled>
                <level>OFF</level>
            </p40028>
            <p40032>
                <enabled>true</enabled>
            </p40032>
            <p40016>
                <enabled>false</enabled>
                <level>OFF</level>
            </p40016>
            <p40017>
                <enabled>false</enabled>
                <level>OFF</level>
            </p40017>
            <p50000>
                <enabled>true</enabled>
                <level>DEFAULT</level>
            </p50000>
            <p41>
                <enabled>false</enabled>
                <level>OFF</level>
            </p41>
            <p43>
                <enabled>false</enabled>
                <level>OFF</level>
            </p43>
            <p10048>
                <enabled>false</enabled>
                <level>OFF</level>
            </p10048>
            <p10107>
                <enabled>false</enabled>
                <level>OFF</level>
            </p10107>
            <p20012>
                <enabled>false</enabled>
                <level>OFF</level>
            </p20012>
            <p20015>
                <enabled>false</enabled>
                <level>OFF</level>
            </p20015>
            <p20016>
                <enabled>false</enabled>
                <level>OFF</level>
            </p20016>
            <p20017>
                <enabled>false</enabled>
                <level>OFF</level>
            </p20017>
            <p20018>
                <enabled>false</enabled>
                <level>OFF</level>
            </p20018>
            <p40013>
                <enabled>false</enabled>
                <level>OFF</level>
            </p40013>
            <p40019>
                <enabled>false</enabled>
                <level>OFF</level>
            </p40019>
            <p40020>
                <enabled>false</enabled>
                <level>OFF</level>
            </p40020>
            <p40021>
                <enabled>false</enabled>
                <level>OFF</level>
            </p40021>
            <p40022>
                <enabled>false</enabled>
                <level>OFF</level>
            </p40022>
            <p40024>
                <enabled>false</enabled>
                <level>OFF</level>
            </p40024>
            <p40026>
                <enabled>false</enabled>
                <level>OFF</level>
            </p40026>
            <p40027>
                <enabled>false</enabled>
                <level>OFF</level>
            </p40027>
            <p90021>
                <enabled>true</enabled>
                <level>DEFAULT</level>
            </p90021>
            <p90023>
                <enabled>true</enabled>
                <level>DEFAULT</level>
            </p90023>
            <p90024>
                <enabled>false</enabled>
                <level>OFF</level>
            </p90024>
            <p90025>
                <enabled>false</enabled>
                <level>OFF</level>
            </p90025>
            <p90034>
                <enabled>true</enabled>
                <level>DEFAULT</level>
            </p90034>
            <p42>
                <enabled>false</enabled>
                <level>OFF</level>
            </p42>
            <p10051>
                <enabled>false</enabled>
                <level>OFF</level>
            </p10051>
            <p10053>
                <enabled>false</enabled>
                <level>OFF</level>
            </p10053>
            <p10095>
                <enabled>false</enabled>
                <level>OFF</level>
            </p10095>
            <p10106>
                <enabled>false</enabled>
                <level>OFF</level>
            </p10106>
            <p30003>
                <enabled>false</enabled>
                <level>OFF</level>
            </p30003>
            <p40025>
                <enabled>false</enabled>
                <level>OFF</level>
            </p40025>
            <p40029>
                <enabled>false</enabled>
                <level>OFF</level>
            </p40029>
            <p40034>
                <enabled>true</enabled>
            </p40034>
            <p40035>
                <enabled>true</enabled>
                <level>DEFAULT</level>
            </p40035>
            <p90017>
                <enabled>true</enabled>
            </p90017>
            <p90028>
                <enabled>false</enabled>
                <level>OFF</level>
            </p90028>
            <p10047>
                <enabled>false</enabled>
                <level>OFF</level>
            </p10047>
            <p10058>
                <enabled>true</enabled>
                <level>DEFAULT</level>
            </p10058>
            <p10104>
                <enabled>false</enabled>
                <level>OFF</level>
            </p10104>
            <p20014>
                <enabled>false</enabled>
                <level>OFF</level>
            </p20014>
            <p40023>
                <enabled>false</enabled>
                <level>OFF</level>
            </p40023>
            <p90027>
                <enabled>false</enabled>
                <level>OFF</level>
            </p90027>
            <p40015>
                <enabled>false</enabled>
                <level>OFF</level>
            </p40015>
            <p40033>
                <enabled>true</enabled>
                <level>DEFAULT</level>
            </p40033>
            <p60100>
                <enabled>false</enabled>
                <level>OFF</level>
            </p60100>
            <p60101>
                <enabled>false</enabled>
                <level>OFF</level>
            </p60101>
            <p90026>
                <enabled>false</enabled>
                <level>OFF</level>
            </p90026>
            <p90029>
                <enabled>false</enabled>
                <level>OFF</level>
            </p90029>
            <p40038>
                <enabled>false</enabled>
                <level>OFF</level>
            </p40038>
            <p40039>
                <enabled>false</enabled>
                <level>OFF</level>
            </p40039>
            <p40040>
                <enabled>false</enabled>
                <level>OFF</level>
            </p40040>
        </plugins>
    </configuration>
  rapidastconfig.yaml: |
    config:
      configVersion: 4

    application:
      shortName: "tempo"
      url: "https://kubernetes.default.svc"

    general:
      authentication:
        type: "http_header"
        parameters:
          name: "Authorization"
          value: "Bearer ${tempo_token}"
      container:
        type: "none"

    scanners:
      zap:
        apiScan:
          apis:
            apiUrl: "https://kubernetes.default.svc/openapi/v3/apis/tempo.grafana.com/v1alpha1"
        passiveScan:
          disabledRules: "2,10015,10027,10096,10024,10054"
        activeScan:
          policy: "Operator-scan"
        miscOptions:
          enableUI: False
          updateAddons: False
EOF
)

# Create the ConfigMap
echo "$configmap_content" | oc -n rapidast-tempo create -f -

