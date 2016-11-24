docker-collectd-statsd
===

Docker container that runs [collectd](https://collectd.org/) to capture system metrics and then sends them to a [statsd](https://github.com/etsy/statsd) listener.

##Configuring Captured Metrics

Metrics are captured via collectd plugins.  To add more plugins or configuring existing plugins modify the [collectd.conf](config/collectd/collectd.conf) file.

Information on the plugins that are available for collectd can be found in the [collectd documentation](https://collectd.org/documentation.shtml).