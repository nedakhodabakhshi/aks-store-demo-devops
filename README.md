# AKS Store Demo DevOps Project

## Project Overview

This project demonstrates the deployment of a microservices-based e-commerce application on Azure Kubernetes Service (AKS).

The platform includes multiple backend and frontend services containerized with Docker and orchestrated using Kubernetes.

## Technologies Used

* Azure Kubernetes Service (AKS)
* Azure Container Registry (ACR)
* Docker
* Kubernetes
* Helm
* Azure DevOps / GitHub Actions
* RabbitMQ
* MongoDB
* Microservices Architecture

## Project Goals

* Build and manage containerized microservices
* Deploy applications to AKS
* Implement CI/CD pipelines
* Use Azure cloud-native services
* Practice production-style Kubernetes deployments

 -->

## Architecture

The application has the following services: 

| Service | Description |
| --- | --- |
| `makeline-service` | This service handles processing orders from the queue and completing them (Golang) |
| `order-service` | This service is used for placing orders (Javascript) |
| `product-service` | This service is used to perform CRUD operations on products (Rust) |
| `store-front` | Web app for customers to place orders (Vue.js) |
| `store-admin` | Web app used by store employees to view orders in queue and manage products (Vue.js) | 
| `virtual-customer` | Simulates order creation on a scheduled basis (Rust) |
| `virtual-worker` | Simulates order completion on a scheduled basis (Rust) |
| `ai-service` | Optional service for adding generative text and graphics creation (Python) |
| `mongodb` | MongoDB instance for persisted data |
| `rabbitmq` | RabbitMQ for an order queue |

![Logical Application Architecture Diagram](assets/demo-arch-with-openai.png)

## Local Development with Docker Compose

The application was first tested locally using Docker Compose.

Docker Compose reads the `docker-compose.yml` file and starts all required services, including frontend, backend microservices, RabbitMQ, and MongoDB.

```bash
docker compose up -d
docker ps

## Terraform Configuration

Infrastructure provisioning is managed using Terraform.

Initial Terraform configuration includes:

- Azure provider configuration
- Azure Resource Group definition
- Reusable variables for AKS and ACR resources

## Infrastructure Provisioning with Terraform

Terraform is used to provision and manage Azure infrastructure for the AKS Store Demo project.

### Resources Managed by Terraform

- Azure Resource Group
- Azure Kubernetes Service (AKS)
- Azure Container Registry (ACR)
- AKS to ACR Role Assignment (AcrPull)

### Terraform Features

- Reusable variables
- Environment-based configuration
- Resource tagging
- Managed Identity integration
- Infrastructure validation with Terraform plan