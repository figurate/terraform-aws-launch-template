from diagrams import Diagram, Cluster, Edge
from diagrams.aws.compute import AutoScaling
from diagrams.aws.network import VPC
from diagrams.onprem.iac import Ansible
from diagrams.programming.language import Bash
from diagrams.onprem.compute import Server

with Diagram("AWS Launch Template", show=False, direction="TB"):

    with Cluster("vpc"):

        launch_template = AutoScaling("launch template")
        VPC("security group(s)") >> launch_template
        [Bash("bash"), Ansible("ansible"), Server("cloud-init")] >> Edge(label="userdata") >> launch_template
