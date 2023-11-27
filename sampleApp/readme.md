# Sample Services

This document provides an overview of the sample services included in the project.

## Localhost or Ingress Gateway Address

To access the sample services, you can either use the localhost address or change it to the address of the ingress gateway.

- Localhost: http://localhost/

All URLs are redirected to the Single Page Application (SPA) to resolve static content. For example:

- http://localhost/test/resource

Specific Rules redirect traffic to specific resources, such as:

- http://localhost/sample/api/v3/openapi.json
- http://localhost/whoami

Please note that you may need to modify the URLs based on your specific setup and configuration.