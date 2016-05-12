class: middle,center
# Container Vulnerability Analysis
## CoreOS Clair & Hyperclair


</br></br>
.name[Twitter: [@jgsqware](https://twitter.com/jgsqware) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Github: [github.com/jgsqware](http://www.github.com/jgsqware)]
</br></br>
.center[![:scale 20%](images/wemanity.png)]

---
class: center, middle
.logo[![:scale 7%](images/wemanity-logo.png)]


##Main concern using container 
##in production/sensitive environment?

---
class: center
.logo[![:scale 7%](images/wemanity-logo.png)]

# SECURITY!

> Container is a security nightmare.

![:scale 65%](images/DevOps-Security.png)

---
class: middle,center

#Context
---
class: middle, center
background-image: url(images/containers.jpg)
background-size: repeat

.logo[![:scale 7%](images/wemanity-logo.png)]


.center[![:scale 70%](images/containers-everywhere.jpg)]

---
class: middle, center
background-color: #64db72
.logo[![:scale 7%](images/wemanity-logo.png)]


## Containers, containers everywhere
.center[![:scale 60%](images/containers-schema.png)]

---
class: middle, center
background-color: #f75b5b

.logo[![:scale 7%](images/wemanity-logo.png)]


## Crappy, crappy containers everywhere
.center[![:scale 60%](images/crappy-containers-schema.png)]


---
class: middle
.logo[![:scale 7%](images/wemanity-logo.png)]


.left-cs[![:scale 120%](images/docker-security-cheat-sheet.png)]

---
class: middle
.logo[![:scale 7%](images/wemanity-logo.png)]


.left-cs[![:scale 120%](images/docker-security-cheat-sheet-bordered.png)]

---
class: middle, center

.logo[![:scale 7%](images/wemanity-logo.png)]
# Vulnerabilities
> .center.quote[A vulnerability is a weakness who allows an attacker to reduce a system's information assurance.]

---
class: middle, center
background-color: black
.logo[![:scale 7%](images/wemanity-logo.png)]


# .note[Heartbleed] ![:scale 7%](images/heartbleed.png)

.white[[CVE-2014-0160](https://access.redhat.com/security/cve/cve-2014-0160): The TLS and DTLS implementations in OpenSSL do not properly handle
Heartbeat Extension packets]

---
class: middle,center
background-color: black
.logo[![:scale 7%](images/wemanity-logo.png)]

# .note[Ghost]  ![:scale 7%](images/ghost.png) 

.white[[CVE-2015-0235](https://access.redhat.com/security/cve/CVE-2015-0235): a buffer overflow bug affecting the gethostbyname() and
gethostbyname2() function calls in the glibc library.]

---
.logo[![:scale 7%](images/wemanity-logo.png)]

# .center[CVE - .subtitle[Common Vulnerabilities and Exposure tracker]]

</br></br></br></br>
.big.center[[Debian Security Bug Tracker](https://security-tracker.debian.org/tracker)]
.big.center[[Ubuntu CVE Tracker](https://launchpad.net/ubuntu-cve-tracker)]
.big.center[[Red Hat Security Data](https://www.redhat.com/security/data/metrics)]

---
class: middle, center
.logo[![:scale 7%](images/wemanity-logo.png)]


# Vulnerability Analysis
## Dynamic vs Static

---
.logo[![:scale 7%](images/wemanity-logo.png)]


# Dynamic analysis
> .center.quote-big[context: there is millions of containers images]

- performed on a **real or virtual** processor
- container must be **running**

-------------------------------------------------------------------------

- running millions of containers is **expensive**
- *untrusted* containers is **Unsafe**
- Dynamic analysis tools need **Human** input

---
.logo[![:scale 7%](images/wemanity-logo.png)]


# Static analysis
> .center.quote-big[context: there is millions of containers images]
> .center.quote-big[Over 15 vulnerabilites/day]

- performed **without executing programs**
- the **filesystem** of the container image is **inspected**

-----------------------------------------------------------------------------

- Static tools like **dpkg** and **rpm** is used to analyze filesystem
- Containers layers are analyzed **only once**

---
class: middle, center
.logo[![:scale 7%](images/wemanity-logo.png)]

# How do you analyse containers?

---
class: middle, center
background-color: white
.logo[![:scale 7%](images/wemanity-logo.png)]

![:scale 40%](images/Clair_horizontal_color.png)


> .quote-big[an open source project for the static analysis of vulnerabilities in **rkt** and **Docker** containers.]
.right.small[[github.com/coreos/clair](http://www.github.com/coreos/clair)]


---
.logo[![:scale 7%](images/wemanity-logo.png)]

.center[![:scale 40%](images/Clair_horizontal_color.png)]

</br></br>
- .big[**transparent** security view]
- .big[Vulnerability data is **continuously imported**]
- .big[**Notification** on new Vulnerability state with images affected]
- .big[**AppC** & **Docker** support]

---
.logo[![:scale 7%](images/wemanity-logo.png)]

.center[![:scale 40%](images/Clair_horizontal_color.png)]

</br>
.center[![Clair](images/framework.png)]

---
.logo[![:scale 7%](images/wemanity-logo.png)]

.center[![:scale 40%](images/Clair_horizontal_color.png)]

</br>
.center[![Clair](images/framework-tracker.png)]

---
.logo[![:scale 7%](images/wemanity-logo.png)]

.center[![:scale 40%](images/Clair_horizontal_color.png)]

</br>
.center[![Clair](images/framework-datastore.png)]

---
.logo[![:scale 7%](images/wemanity-logo.png)]

.center[![:scale 40%](images/Clair_horizontal_color.png)]

</br>
.center[![Clair](images/framework-detector.png)]

---
.logo[![:scale 7%](images/wemanity-logo.png)]

.center[![:scale 40%](images/Clair_horizontal_color.png)]

</br>
.center[![Clair](images/framework-notifier.png)]

---
.logo[![:scale 7%](images/wemanity-logo.png)]

.center[![:scale 40%](images/Clair_horizontal_color.png)]

</br>
.center[![Clair](images/framework-api.png)]

---
.logo[![:scale 7%](images/wemanity-logo.png)]

.center[![:scale 40%](images/Clair_horizontal_color.png)]

</br>
.center[![Clair](images/framework-client.png)]

---
.logo[![:scale 7%](images/wemanity-logo.png)]

.center[![:scale 40%](images/Clair_horizontal_color.png)]

</br></br>

- .big[Static analyzis] .side-note[distribution specific]
- .big[Do the job only once] .side-note[backed by Postgresql]
- .big[Suggest & Notify] .side-note[webhook]
- .big[Built as a framework] .side-note[pluggable]

---
class: middle, center
.logo[![:scale 7%](images/wemanity-logo.png)]

# Can I already used it?
---
.logo[![:scale 7%](images/wemanity-logo.png)]

# Online automatic analysis with ![:scale 25%](images/quay-logo.png)
####Private Hosted registry

</br>
- **CoreOS** Family
- Support Clair **by default** for all images
- Powerful views for reports
- Integrate easily with CI and Git repository

---
.logo[![:scale 7%](images/wemanity-logo.png)]


# Online automatic analysis with ![:scale 25%](images/quay-logo.png)

3 steps only

1. Upload your image
2. Open security tabs
---
.logo[![:scale 7%](images/wemanity-logo.png)]


# Online automatic analysis with ![:scale 25%](images/quay-logo.png)

3 steps only

1. Upload your image
2. Open security tabs
3. Tadaa... 

.img-right[![:scale 150%](images/magic.gif)]

---
.logo[![:scale 7%](images/wemanity-logo.png)]

# Security analysis report on ![:scale 25%](images/quay-logo.png)

.left-cs[![:scale 120%](images/quay-report.png)]

---
class: middle, center
.logo[![:scale 7%](images/wemanity-logo.png)]


# Use Cases

---
class: center, middle
.logo[![:scale 7%](images/wemanity-logo.png)]

# Continuous integration pipeline security 

---
.logo[![:scale 7%](images/wemanity-logo.png)]


# Continuous integration pipeline security 

.center[![:scale 100%](images/CI-pipeline.png)]

---
.logo[![:scale 7%](images/wemanity-logo.png)]


# Continuous integration pipeline security 

.center[![:scale 100%](images/CI-pipeline-resolved.png)]


---
class: center, middle
background-image: url(images/present.jpg)
.logo[![:scale 7%](images/wemanity-logo.png)]
<br><br><br><br><br><br>

#.white-stroke[Shift-Left mindest]
## .white-stroke[Give the tools to your developers]

---
class: center, middle
.logo[![:scale 7%](images/wemanity-logo.png)]


# How do I analyze my local images with Clair?


---
class: middle, center
.logo[![:scale 7%](images/wemanity-logo.png)]


# Hyperclair

---
.logo[![:scale 7%](images/wemanity-logo.png)]


# Hyperclair

- Lightweight CLI (written in go)
- Bridge between Registries (Docker Hub, Docker Registry) and Clair vulnerability tracker
- Html report generation
---
class: middle, center
.logo[![:scale 7%](images/wemanity-logo.png)]


# Why?

---
.logo[![:scale 7%](images/wemanity-logo.png)]


# .center[Why?]
</br></br></br>

- Want to learn **Go**
- Analyze-local-image tool is not **User-Friendly**
- **Registry Authentication** needed
- **Big need** in my current project context


---
.logo[![:scale 7%](images/wemanity-logo.png)]


# Hyperclair

- Command based on Docker Client Command
  - `hyperclair version`
  - `hyperclair health`
  - `hyperclair pull jgsqware/ubuntu-git`
  - `hyperclair push jgsqware/ubuntu-git`
  - `hyperclair analyse jgsqware/ubuntu-git`
  - `hyperclair report -f [html|json] jgsqware/ubuntu-git`

---
.logo[![:scale 7%](images/wemanity-logo.png)]


# Hyperclair - Configuration

- Configuration file:
  
  ```
  clair:
      port: 6060
      healthPort: 6061
      uri: http://clair
      priority: Low
      report:
        path: ./reports
        format: html
  ```
  


---
.logo[![:scale 7%](images/wemanity-logo.png)]


# Hyperclair - Configuration

- Environment variables:

  `HYPERCLAIR_<property>`
  
  eg. `HYPERCLAIR_CLAIR_PORT=6060`

---
.logo[![:scale 7%](images/wemanity-logo.png)]

# Local Image Analysis with hyperclair

.center[![:scale 85%](images/local-pipeline.png)]

---
.logo[![:scale 7%](images/wemanity-logo.png)]

# .name[What's next:] Clair
    
 - MySQL driver for datastore
 - Alpine, Npm,... trackers
 

---
.logo[![:scale 7%](images/wemanity-logo.png)]

# .name[What's next:] Hyperclair

- Current version: `v0.5.0`
    - Login through different registries
        - Docker Registry on premise
        - Docker Hub
    - Local image analysis
    
- Future
 - Will be integrated in Clair repository as **Clairctl** ([PR #164](https://github.com/coreos/clair/pull/164))
 - Support of Quay.io and Google Cloud Container Registry
 - Many more...

---
class: middle,center
.logo[![:scale 7%](images/wemanity-logo.png)]


# Demo

---
class: middle,center
.logo[![:scale 7%](images/wemanity-logo.png)]


# Questions ?
