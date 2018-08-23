# ibm-infosvr-samples

Ansible playbooks for loading various sample content to IBM InfoSphere Information Server.

## Requirements

- Ansible v2.4.x
- Root-become-able network access to an IBM Information Server environment
- Inventory group names setup the same as `IBM.infosvr` role
- Following Ansible roles installed:
  - [IBM.infosvr](https://galaxy.ansible.com/IBM/infosvr)
  - [IBM.infosvr-metadata-asset-manager](https://galaxy.ansible.com/IBM/infosvr-metadata-asset-manager)
  - [IBM.infosvr-import-export](https://galaxy.ansible.com/IBM/infosvr-import-export)

# Coco Pharmaceuticals

Includes the following sample content:

- Glossary categories
- Glossary terms
- Term-to-term relationships
- Sample data files
- Sample database
- Sample data within database
- Relationships between terms and file fields
- Relationships between terms and database columns
- Information Analyzer project containing the sample database tables

See `vars/cocopharma.yml` for the default locations and names of the physical assets (database and files).

Running the playbook is as simple as:

```
ansible-playbook [-i <inventory>] cocopharma-load.yml
```

Where the inventory provided should contain the same group names as required by the `IBM.infosvr` role.
