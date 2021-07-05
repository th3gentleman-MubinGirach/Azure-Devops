# Devops based project
<h1> This project is based on following technologies </h1>
<ul>
<li> Flask </li>
<li> Azure Devops </li>
<li> Kubernetes </li>
<li> Terraform </li>
<li> Containers </li>
</ul>

<h2> The work flow of the project is as follows </h2>
<ol>
<li>TERRAFORM [Provisioning ACR & AKS on Azure cloud] </li>|
                                                           |----> <li> Azure Pipeline [Fetch the repository from Github]</li> -----> <li>Generate yaml file</li> |
                                                                                                                                                                 |
                                                                                                              <li>Build & Push container image to ACR</li> <-----|
                                                                                                                 |    
                                   <li> Deploy container image to AKS [Containing Flask based Web-app]</li><-----|     </ol>
                                   
<b> For Reference Video<a href="https://www.linkedin.com/posts/mubingirach_devops-kubernetes-azure-activity-6817158160659304448-blZt">Click here</a>
