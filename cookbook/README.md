# RestfulSrvr-api-server cookbook

Installs/Configures a RestfulSrvr-api server

## Supported Platforms

  * Redhat
  * CentOS
  * Ubuntu

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>[:RestfulSrvr_api][:repo]</tt></td>
    <td>String</td>
    <td>Github Organization containing the Github release</td>
    <td><tt>"restful-srvr/RestfulSrvr-api"</tt></td>
  </tr>
  <tr>
    <td><tt>[:RestfulSrvr_api][:release]</tt></td>
    <td>String</td>
    <td>Name of the release to deploy</td>
    <td><tt>v{cookbook_version}</tt></td>
  </tr>
  <tr>
    <td><tt>[:RestfulSrvr_api][:token]</tt></td>
    <td>String</td>
    <td>Optional github token (https://developer.github.com/v3/#rate-limiting)</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>[:RestfulSrvr_api][:owner]</tt></td>
    <td>String</td>
    <td>Owner of the deployed application files</td>
    <td><tt>"RestfulSrvr"</tt></td>
  </tr>
  <tr>
    <td><tt>[:RestfulSrvr_api][:group]</tt></td>
    <td>String</td>
    <td>Group of the deployed application files</td>
    <td><tt>"RestfulSrvr"</tt></td>
  </tr>
  <tr>
    <td><tt>[:RestfulSrvr_api][:home]</tt></td>
    <td>String</td>
    <td>Where the application's data is stored</td>
    <td><tt>"/etc/restful-srvr/api-server"</tt></td>
  </tr>
  <tr>
    <td><tt>[:RestfulSrvr_api][:deploy_path]</tt></td>
    <td>String</td>
    <td>Where the application is deployed to</td>
    <td><tt>"/opt/RestfulSrvr-api/#{RestfulSrvr_api.release}"</tt></td>
  </tr>
  <tr>
    <td><tt>[:RestfulSrvr_api][:port]</tt></td>
    <td>Integer</td>
    <td>Application's listen port</td>
    <td><tt>26200</tt></td>
  </tr>
  <tr>
    <td><tt>[:RestfulSrvr_api][:proxy_port]</tt></td>
    <td>Integer</td>
    <td>Application's HTTP Proxy listen port</td>
    <td><tt>80</tt></td>
  </tr>
  <tr>
    <td><tt>[:RestfulSrvr_api][:host]</tt></td>
    <td>String</td>
    <td>Proxy's hostname</td>
    <td><tt>{fqdn}</tt></td>
  </tr>
  <tr>
    <td><tt>[:RestfulSrvr_api][:config_path]</tt></td>
    <td>String</td>
    <td>Path to application's configuration file</td>
    <td><tt>{RestfulSrvr_api.home}/config.json</tt></td>
  </tr>
  <tr>
    <td><tt>[:RestfulSrvr_api][:config]</tt></td>
    <td>Hash</td>
    <td>A hash representing the application's JSON configuration</td>
    <td><tt>`{home_path: {RestfulSrvr_api.home}}`</tt></td>
  </tr>
</table>

## Usage

### RestfulSrvr-api-server::default

Installs the RestfulSrvr API server and HTTP Proxy on your node

### RestfulSrvr-api-server::app

Installs and configures a RestfulSrvr API server on your node

### RestfulSrvr-api-server::http_proxy

Installs and configures an HTTP proxy for the RestfulSrvr API server on your node

## License and Authors

Author:: Jamie Winsor (<jamie@vialstudios.com>)
