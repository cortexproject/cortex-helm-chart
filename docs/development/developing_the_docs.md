---
layout: page
title: Working with the cortex-helm-chart docs
parent: Development
has_children: false
has_toc: false
---
# Working with the cortex-helm-chart docs
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---
# Setup

The cortex-helm-chart docs uses [jekyll](https://jekyllrb.com/) with the [just-the-docs](https://github.com/pmarsceill/just-the-docs) theme. Unfortunately due to security concerns GitHub doesn't let us preview from pull requests or different branches. However GitHub created [this](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/testing-your-github-pages-site-locally-with-jekyll) guide on how to test your changes locally.

# Preview

After installing ruby and bundle. Simply change into the `/docs` folder of the cortex-helm-chart and run:

```
bundle exec jekyll serve --incremental --livereload
```

For further options you can consult `bundle exec jekyll serve --help`