# Azure Container Instance on Private VNET

The repository hosts an example application in the form of [Azure Container Instance](https://docs.microsoft.com/en-us/azure/container-instances/) that can be deployed in a few minutes by Azure Custom Deployment (ARM / BICEP) or Terraform.

## References
  
[Container Instance ARM and BICEP template](https://docs.microsoft.com/en-us/azure/templates/microsoft.containerinstance/containergroups?tabs=json)

[Container Instance Terraform documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_group)

# Deployment Options

## ARM via Azure Portal

0) Prerequisites are an **existing resource group and a vnet** with a subnet having a delegation to container groups.
1) After checking out the repo or just downloading the template and parameters files, set your desired deployment options in **parameters.json**.  
2) go to  
  
![Deploy a custom template in Azure](https://aka.ms/deploytoazurebutton)  (or if on the Azure Portal already, search for "Deploy a custom template" in the search bar)

3) Upload the template file and parameters file, then select desired subscription and location, however the location should match in  parameters.json
4) Deploy and test connectivity

## ARM / BICEP via az cli

```
az deployment group create \
  --name aci-testapp-deployment \
  --resource-group rg-testapps-uk \
  --template-file template.bicep \
  --parameters @parameters.json
```

  ## ARM/BICEP via Powershell

```
  New-AzResourceGroupDeployment -Name aci-testapp-deployment -ResourceGroupName rg-testapps-uk -TemplateFile template.bicep -TemplateParameterFile parameters.json
```

## Terraform

0) The deployment is manual with terraform cli. Subscription ID should be set before deployment for the logged in user.  
1) Set the desired deployment options in a .tfvars file (example provided)
2) Deploy with ```terraform init && terraform apply -var-file=testdeployment.tfvars```
3) Test connectivity
