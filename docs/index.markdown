---
layout: home
title: Home
nav_order: 1
description: "Horizontally scalable, highly available, multi-tenant, long term Prometheus."
permalink: /
---

# Welcome
<img src="https://cortexmetrics.io/images/cortex-horizontal.svg" alt="Cortex Logo"
     style="display: block; margin-left: auto; magin-right: auto" />
This is the official cortex-helm-chart documentation. Here you can find Guides & Best-Practices on How-To setup cortex.

---
## About the project

Cortex is a horizontally scalable, highly available, multi-tenant, long term Prometheus. The cortex-helm-chart helps the operator with deploying cortex on a Kubernetes cluster.

Follow our socials:
* [Twitter](https://twitter.com/CortexMetrics)

Join us on Slack:
* [Slack](https://cloud-native.slack.com/?redir=%2Fmessages%2Fcortex%2F)

### License

cortex-helm-chart is distributed by an [Apache License 2.0](https://github.com/cortexproject/cortex-helm-chart/blob/master/LICENSE).

### Contributing

When contributing to this repository, please first discuss the change you wish to make via issue before making a change. Read more about becoming a contributor in [our GitHub repo](https://github.com/cortexproject/cortex-helm-chart/blob/master/CONTRIBUTING).

#### Thank you to the contributors of cortex-helm-chart!

<ul class="list-style-none">
{% for contributor in site.github.contributors %}
  <li class="d-inline-block mr-1">
     <a href="{{ contributor.html_url }}"><img src="{{ contributor.avatar_url }}" width="32" height="32" alt="{{ contributor.login }}"/></a>
  </li>
{% endfor %}
</ul>