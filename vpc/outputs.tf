output "vpc_network"{
    value=yandex_vpc_network.network
    description="vpc network"
}
output "vpc_subnet"{
    value=yandex_vpc_subnet.subnet
    description="vpc subnet"
}