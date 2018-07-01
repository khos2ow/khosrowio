---
draft: false
date: 2018-06-30T21:46:32-04:00
lastmod: 2018-06-30T21:46:32-04:00
title: "Hello World, again"
slug: "hello-world-again"
tags:
categories:
  - general
---

Well, `Hello World` again!

It's been a long time since I've blogged and now it seems to be a good time to start it again. With a little bit of commitment I acutally might do it more often [we'll see about that].

It only seems appropriate to start by talking about how this [site](https://khosrow.io/) came to life. Couple months back I was looking for different [static site generators](https://www.netlify.com/blog/2017/05/25/top-ten-static-site-generators-of-2017/) to choose for my site and I decided to *go* (pun totally intended!) with [Hugo](https://gohugo.io/). The main reason to choose this over others (namely Jekyll) was that it was written in [Golang](https://golang.org/) which I had started to get even more experience with.

Hugo depends on a *theme* which should be present in `themes` folder, so the next step would be to decide that if I wanted to build a theme from scratch or use an existing [one](https://themes.gohugo.io/). I wanted the theme to be very minimal so I chose [Coder](https://themes.gohugo.io/hugo-coder/). Then it came the fun part: I tried it, loved it, forked it, customized it and even [contributed](https://github.com/luizdepra/hugo-coder/) back to it.

"Developer" side of me was totally satisfied at this point, but the "Operations" side of me was screaming in agony for some automation! So I pushed the code to [GitLab](https://gitlab.com/) and started to publish it on [GitLab Pages](https://about.gitlab.com/features/pages/). The next logical step was to get a domain and that's when *[khosrow.io](https://khosrow.io/)* actually came to life, thanks to:

- [Namecheap](https://www.namecheap.com/) for domain registration
- [Let's Encrypt](https://letsencrypt.org/), well of course SSL!
- [DigitalOcean](https://www.digitalocean.com/) for the Droplet!

