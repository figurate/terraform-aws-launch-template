from diagrams import Diagram, Cluster
from diagrams.aws.compute import AutoScaling
from diagrams.aws.network import VPC

with Diagram("AWS Launch Template", show=False, direction="TB"):

    with Cluster("vpc"):

        launch_template = AutoScaling("launch template")
        VPC("security group(s)") >> launch_template
