- [x] Status:  Ainda em desenvolvimento.
###
### Módulos de Network contendo vpc e todos os seus recursos, módulo de instancias ec2 e módulo de security group com as regras de entrada e saída pré definidas. Em conjunto com os scripts neste repositório.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2-instance"></a> [ec2-instance](#module\_ec2-instance) | ./ec2 | n/a |
| <a name="module_network"></a> [network](#module\_network) | ./network | n/a |
| <a name="module_security-group"></a> [security-group](#module\_security-group) | ./security_group | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr"></a> [cidr](#input\_cidr) | CIDR da VPC | `string` | `"10.10.0.0/16"` | no |
| <a name="input_count_available"></a> [count\_available](#input\_count\_available) | Numero de Zonas de disponibilidade | `number` | `2` | no |
| <a name="input_ec2_count"></a> [ec2\_count](#input\_ec2\_count) | Quantidade de instancias Ec2 | `number` | `1` | no |
| <a name="input_key_pair"></a> [key\_pair](#input\_key\_pair) | Chave na AWS para se conectar via ssh | `string` | `"key pair"` | no |
| <a name="input_nacl"></a> [nacl](#input\_nacl) | Regras de Network Acls AWS | `map(object()` |" "| yes |
| <a name="input_region"></a> [region](#input\_region) | Região na AWS | `string` | `"us-east-1"` | no |
| <a name="input_script"></a> [script](#input\_script) | caminho do script de instalação | `string` | `"script.sh"` | no |
| <a name="input_sg-cidr"></a> [sg-cidr](#input\_sg-cidr) | Mapa de portas de serviços | `map(object)` |" "| yes |
| <a name="input_sg-self"></a> [sg-self](#input\_sg-self) | Mapa de portas para o mesmo security group | `map(object()` |" "| yes |
| <a name="input_tag-sg"></a> [tag-sg](#input\_tag-sg) | Tag Name do security group | `string` | `"Kong-sg"` | no |
| <a name="input_tag_igw"></a> [tag\_igw](#input\_tag\_igw) | Tag Name do internet gateway | `string` | `"igw_terraform"` | no |
| <a name="input_tag_instance"></a> [tag\_instance](#input\_tag\_instance) | Tag Name para a instancia | `string` | `"Kong"` | no |
| <a name="input_tag_rtable"></a> [tag\_rtable](#input\_tag\_rtable) | Tag Name das route tables | `string` | `"rt-terraform"` | no |
| <a name="input_tag_vpc"></a> [tag\_vpc](#input\_tag\_vpc) | Tag Name da VPC | `string` | `"vpc-terraform"` | no |
| <a name="input_type"></a> [type](#input\_type) | Type instance | `string` | `"t2.micro"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2-public_ip"></a> [ec2-public\_ip](#output\_ec2-public\_ip) | Public IP Ec2 |
| <a name="output_ec2_id"></a> [ec2\_id](#output\_ec2\_id) | Id das instancias ec2 |
| <a name="output_private_subnet"></a> [private\_subnet](#output\_private\_subnet) | Subnet private |
| <a name="output_public_subnet"></a> [public\_subnet](#output\_public\_subnet) | Subnet public |
| <a name="output_sg-sgid"></a> [sg-sgid](#output\_sg-sgid) | Security group id |
| <a name="output_vpc"></a> [vpc](#output\_vpc) | Idendificador da VPC |

#
## Objetivo
O objetivo deste repositório é criar uma infraestrutura básica composta por rede, security group e instancias ec2 e instalar o Kong Api Gateway junto com o Konga e banco de dados postgres. Após o término do apply de terraform, o terminal irá receber o output com o endereço ip da instancia.Depois de alguns segundos sera possível acessar a interface web do Konga através do `<endereço ip:1337>`.

#
## Como usar.
  - Para utilizar localmente , baixe o repositório e altere as variáveis de acordo com a necessidade.
  - A variável `key_pair` necessita do nome correto da key pair ja criada na AWS. 
  - A variável `count_available` define o quantidade de zonas de disponibilidade, públicas e privadas que seram criadas nessa Vpc e a  variável `ec2_count` a quantidade de instancias ec2.
  - Certifique-se que possua as credenciais da AWS - **`AWS_ACCESS_KEY_ID`** e **`AWS_SECRET_ACCESS_KEY`**.

#
### Comandos
Para consumir os módulos deste repositório é necessário ter o terraform instalado ou utilizar o container do terraform dentro da pasta do seu projeto da seguinte forma:

* `docker run -it --rm -v $PWD:/app -w /app --entrypoint "" hashicorp/terraform:light sh` 
    
Em seguida exporte as credenciais da AWS:

* `export AWS_ACCESS_KEY_ID=sua_access_key_id`
* `export AWS_SECRET_ACCESS_KEY=sua_secret_access_key`
    
Agora é só executar os comandos do terraform:

* `terraform init` - Comando irá baixar todos os modulos e plugins necessários.
* `terraform fmt` - Para verificar e formatar a identação dos arquivos.
* `terraform validate` - Para verificar e validar se o código esta correto.
* `terraform plan` - Para criar um plano de todos os recursos que serão utilizados.
* `terraform apply` - Para aplicar a criação/alteração dos recursos. 
* `terraform destroy` - Para destruir todos os recursos que foram criados pelo terraform. 