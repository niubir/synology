# synology

## env
| name | remark |
| - | - |
| FRP_VERSION | [frp version](https://github.com/fatedier/frp/releases) |
| FRP_SERVER | server address |
| FRP_TOKEN | design by yourself |
| FRP_LOCAL_IP | local ip address |

```bash
# example
export FRP_VERSION=0.52.3
export FRP_SERVER=100.100.100.100
export FRP_TOKEN=a9b85204-4359-4941-aaf4-4abf3aaa953e
export FRP_LOCAL_IP=192.168.1.100
wget https://github.com/niubir/synology/blob/05170e1ccaeb7ba2efd055634c2c8c9cf071e2ae/synology/synology.sh
chmod -R 777 synology.sh
./synology.sh
```