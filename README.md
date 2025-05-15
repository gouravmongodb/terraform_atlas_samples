This repository provides a collection of Terraform scripts to automate the provisioning and management of MongoDB Atlas resources. It serves as a practical guide for Infrastructure as Code (IaC) enthusiasts aiming to streamline their MongoDB Atlas operations using Terraform.

📁 Repository Structure

The repository is organized into directories, each focusing on specific MongoDB Atlas configurations:

1) configure_atlas_alerts/: Scripts to set up alert configurations in MongoDB Atlas.
2) create_aws_azure_cluster/: Examples demonstrating the creation of clusters in multi-cloud setting of AWS and Azure.
3) create_azure_cluster/: Scripts for provisioning clusters exclusively on Azure.
4) create_new_cluster/: Scripts for provisioning clusters exclusively on AWS.
5) edit_cluster/: Guidelines for modifying existing cluster configurations.
6) import_existing_cluster/: Instructions to import and manage existing clusters within Terraform state.
7) install_terraform.txt: Step-by-step guide to installing Terraform.

🚀 Getting Started

Prerequisites

Ensure the following are set up before proceeding:

- Terraform installed on your machine.
- A MongoDB Atlas account with appropriate permissions.
- MongoDB Atlas API Public and Private Keys.
- Organization ID from MongoDB Atlas.

Installation
- Clone the Repository:
  
  git clone https://github.com/gouravmongodb/terraform_atlas_samples.git
  
  cd terraform_atlas_samples
  
- Navigate to Desired Configuration: Choose the directory that matches your intended setup. For example:

  cd create_new_cluster

- Initialize Terraform:

  terraform init

- Configure Variables:

Update the variables.tf or create a terraform.tfvars file with your specific configurations, such as API keys and project details.

- Plan and Apply:

  terraform plan

  terraform apply

📘 Documentation

For detailed information on MongoDB Atlas Terraform provider and resources, refer to the official documentation.

🤝 Contributing

Contributions are welcome! If you have enhancements or additional configurations to share, feel free to fork the repository and submit a pull request.

📄 License

This project is licensed under the MIT License. See the LICENSE file for details.

By following this guide, users can effectively leverage Terraform to manage MongoDB Atlas resources, ensuring a scalable and maintainable infrastructure setup.
