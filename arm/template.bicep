param location string
param containerName string
param imageName string
param numberCpuCores string
param memory string
param subnetIds string
param ports array

resource containerName_resource 'Microsoft.ContainerInstance/containerGroups@2021-09-01' = {
  location: location
  name: containerName
  zones: []
  properties: {
    containers: [
      {
        name: containerName
        properties: {
          image: imageName
          resources: {
            requests: {
              cpu: int(numberCpuCores)
              memoryInGB: json(memory)
            }
          }
          ports: ports
        }
      }
    ]
    restartPolicy: 'OnFailure'
    osType: 'Linux'
    ipAddress: {
      type: 'Private'
      ports: ports
    }
    subnetIds: [
      {
        id: subnetIds
      }
    ]
  }
}
