class: middle,center
# Container Vulnerability Analysis
## CoreOS Clair & Clair Control (formerly Hyperclair)

.center[![:scale 30%](images/wemanity.png)]

</br></br>
.name[Twitter: [@jgsqware](https://twitter.com/jgsqware) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Github: [github.com/jgsqware](http://www.github.com/jgsqware)]
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

![:scale 70%](images/DevOps-Security.png)


---
class: middle, center
background-image: url(images/containers.jpg)
background-size: repeat

.logo[![:scale 7%](images/wemanity-logo.png)]


.center[![:scale 70%](images/containers-everywhere.jpg)]

---
class: middle, center
.logo[![:scale 7%](images/wemanity-logo.png)]


## Containers, containers everywhere
.center[![:scale 70%](images/containers-schema.png)]

---
class: middle, center
.logo[![:scale 7%](images/wemanity-logo.png)]


## Crappy, crappy containers everywhere
.center[![:scale 70%](images/crappy-containers-schema.png)]


---
class: middle, center
.logo[![:scale 7%](images/wemanity-logo.png)]


## Container-Solution's Docker Security Cheat-sheet

| Types / Solutions                                    | KERNEL EXPLOITS | DDOS | CONTAINER BREAKOUTS | POISONED IMAGES | COMPROMISED SECRETS |
|---------------------------------------------------   |-----------------|------|---------------------|-----------------|---------------------|
| SEGREGATE CONTAINER GROUPS WITH VMs                  |        X        |   X  |          X          |        X        |           X         |
| DEFANG SETUID/SETGID BINARIES                        |        X        |   X  |          X          |        X        |           X         |
| BE AWARE OF CPU SHARES                               |        X        |   X  |          X          |        X        |           X         |
| VERIFY IMAGES                                        |        X        |   X  |          X          |        X        |           X         |
| SET CONTAINER FILE SYSTEM TO READ-ONLY               |        X        |   X  |          X          |        X        |           X         |
| SET A USER                                           |        X        |   X  |          X          |        X        |           X         |
| DO NOT USE ENVIRONMENT VARIABLES TO SHARE SECRETS    |        X        |   X  |          X          |        X        |           X         |
| DO NOT RUN CONTAINERS WITH THE --privileged FLAG     |        X        |   X  |          X          |        X        |           X         |
| TURN OFF INTER-CONTAINER COMMUNICATION               |        X        |   X  |          X          |        X        |           X         |
| SET VOLUMES TO READ-ONLY                             |        X        |   X  |          X          |        X        |           X         |
| SET MEMORY LIMITS                                    |        X        |   X  |          X          |        X        |           X         |
| DO NOT INSTALL UNNECESSARY PACKAGES IN THE CONTAINER |        X        |   X  |          X          |        X        |           X         |


// .center[![:scale 100%](images/docker-security-cheat-sheet.png)]

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

- performed by executing programs on a real or virtual processor
- container must be running

- running millions of containers is **expensive**
- *untrusted* containers is **Unsafe**
- Dynamic analysis tools need **Human** input

---
.logo[![:scale 7%](images/wemanity-logo.png)]


# Static analysis
> .center.quote-big[context: there is millions of containers images]
> .center.quote-big[Over 15 vulnerabilites/day]

- performed without executing programs
- the filesystem of the container image is inspected

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

</br></br></br></br>
- .big[Enable a more **transparent view** of the security of container-based infrastructure.]
- .big[Vulnerability data is **continuously imported**]
- .big[**Notification** on new Vulnerability state with images affected]
- .big[Works with **AppC** & **Docker** images format]

---
.logo[![:scale 7%](images/wemanity-logo.png)]

.center[![:scale 40%](images/Clair_horizontal_color.png)]

</br></br></br></br>

- .big[Static analyzis]
- .big[Do the job only once]
- .big[Suggest & Notify]
- .big[Built as a framework]

---
.logo[![:scale 7%](images/wemanity-logo.png)]

.center[![:scale 40%](images/Clair_horizontal_color.png)]
.center[![Clair](images/framework.png)]

---
.logo[![:scale 7%](images/wemanity-logo.png)]


# Currently supported

</br></br></br>

- .big[Image format: appc, Docker]
- .big[Operating systems: Debian, Ubuntu, CentOS]
    - Detection: package managers (dpkg, rpm)
    - Vulnerability sources: Distribution-specific
- .big[Database: PostgresSQL 9.4+]
- .big[Notification: Webhook]

---
class: middle, center
.logo[![:scale 7%](images/wemanity-logo.png)]

# Can I already used it?
---
.logo[![:scale 7%](images/wemanity-logo.png)]


# Quay.io - online automatic analysis

Quay.io - Private Hosted registry .note[add logo]

- **CoreOS** Family
- Support Clair **by default** for all images
- Powerful views for reports
- Integrate easily with CI and Git repository

---
.logo[![:scale 7%](images/wemanity-logo.png)]


# Online automatic analysis with ![:scale 25%](images/quay-logo.png)


3 steps only

1. Upload your docker image
2. Open security tabs
---
.logo[![:scale 7%](images/wemanity-logo.png)]


# Online automatic analysis with ![:scale 25%](images/quay-logo.png)


3 steps only

1. Upload your docker image
2. Open security tabs
3. Tadaa... 

.center[![:scale 50%](images/magic.gif)]

---
.logo[![:scale 7%](images/wemanity-logo.png)]

# Security analysis report on ![:scale 25%](images/quay-logo.png)

.center[![:scale 100%](images/quay-report.png)]

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


# Clair Control aka clairctl .small[formerly known as Hyperclair]

---
.logo[![:scale 7%](images/wemanity-logo.png)]


# Clair Control aka clairctl

- Lightweight CLI (written in go)
- Bridge between Registries (Docker Hub, Docker Registry) and Clair vulnerability tracker
- Html report generation

---
.logo[![:scale 7%](images/wemanity-logo.png)]


# Clair Control aka clairctl

- Command based on Docker Client Command
  - `clairctl version`
  - `clairctl health`
  - `clairctl pull jgsqware/ubuntu-git`
  - `clairctl push jgsqware/ubuntu-git`
  - `clairctl analyse jgsqware/ubuntu-git`
  - `clairctl report -f [html|json] jgsqware/ubuntu-git`

---
.logo[![:scale 7%](images/wemanity-logo.png)]

# Local Image Analysis with clairctl

.center[![:scale 75%](images/local-pipeline.png)]

---
.logo[![:scale 7%](images/wemanity-logo.png)]

# Clair Control aka clairctl

- Current version: `v0.4.0`
    - Login through different registries
        - Docker Registry on premise
        - Docker Hub
    - Local image analysis
    
- On going
 - Support of Quay.io and Google Cloud Container Registry

---
class: middle,center

# Demo

---
class: middle,center

# Questions ?
