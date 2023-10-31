variable "subscriptionID" {
    type = string
    description = "Variable for our resource group"
}

variable "tenantID" {
    type = string
    description = "location of your resource group"
}

 variable "appId" {
   description = "Azure Kubernetes Service Cluster service principal"
 }

 variable "password" {
   description = "Azure Kubernetes Service Cluster password"
 }

variable "tfc_agent_token" {
  description = "Terraform Cloud agent token. (mark as sensitive) (TFC Organization Settings >> Agents)"
}
