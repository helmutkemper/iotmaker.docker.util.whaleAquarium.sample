# iotmaker.docker.util.whaleAquarium.sample

This example creates an image with this repository code and mount a new container changing
server port 3000 to 8080 before start it

```golang
package main

import (
  "github.com/docker/go-connections/nat"
  whaleAquarium "github.com/helmutkemper/iotmaker.docker"
  "github.com/helmutkemper/iotmaker.docker.util.whaleAquarium/factoryContainerFromRemoteServer"
  "github.com/helmutkemper/iotmaker.docker.util.whaleAquarium/factoryWhaleAquarium"
)

func main() {
  currentPort, err := nat.NewPort("tcp", "3000")
  if err != nil {
    panic(err)
  }

  newPort, err := nat.NewPort("tcp", "8080")
  if err != nil {
    panic(err)
  }

  currentPortList  := []nat.Port{
    currentPort,
  }

  newPortList  := []nat.Port{
    newPort,
  }

  err, volumesList := factoryWhaleAquarium.NewVolumeMount(
    []whaleAquarium.Mount{
      {
        MountType:   whaleAquarium.KVolumeMountTypeBind,
        Source:      "./server/static", //relative to this code work folder
        Destination: "/app/static",     //container folder
      },
    },
  )
  if err != nil {
    panic(err)
  }

  err, _, _ = factoryContainerFromRemoteServer.NewContainerFromRemoteServerChangeExposedPortAndVolumes(
    "server:latest",
    "serverLoval",
    "server_network",
    "https://github.com/helmutkemper/iotmaker.docker.util.whaleAquarium.sample.git",
    []string{
      "server:latest",
    },
    currentPortList,
    newPortList,
    volumesList,
    nil,
  )
  if err != nil {
    panic(err)
  }
}
```

This example creates an image with this repository code and mount a new container and start it

```golang
package main

import (
  whaleAquarium "github.com/helmutkemper/iotmaker.docker"
  "github.com/helmutkemper/iotmaker.docker.util.whaleAquarium/factoryContainerFromRemoteServer"
  "github.com/helmutkemper/iotmaker.docker.util.whaleAquarium/factoryWhaleAquarium"
)

func main() {

  // define an external MongoDB config file path
  err, volumesList := factoryWhaleAquarium.NewVolumeMount(
    []whaleAquarium.Mount{
      {
        MountType:   whaleAquarium.KVolumeMountTypeBind,
        Source:      "./server/static", //relative to this code
        Destination: "/app/static",     //container folder
      },
    },
  )
  if err != nil {
    panic(err)
  }

  err, _, _ = factoryContainerFromRemoteServer.NewContainerFromRemoteServerChangeVolumes(
    "server:latest",
    "serverLoval",
    "server_network",
    "https://github.com/helmutkemper/iotmaker.docker.util.whaleAquarium.sample.git",
    []string{
      "server:latest",
    },
    volumesList,
    nil,
  )
  if err != nil {
    panic(err)
  }
}
```