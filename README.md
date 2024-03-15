# Pythonflaskapp

CI process:
configuring AWS CodeBuild to build our Python application based on the specifications we define. CodeBuild will take care of building and packaging our application for deployment.

In the AWS Management Console, navigate to the AWS CodeBuild service.
Click on the "Create build project" button.
Provide a name for your build project.
For the source provider, choose "AWS CodePipeline."
Select the pipeline you created in the previous step.
Configure the build environment, such as the operating system, runtime, and compute resources required for your Python application.
Specify the build commands, such as installing dependencies and running tests in buildspec.yml
Set up the artifacts configuration to generate the build output required for deployment.
Review the build project settings and click on the "Create build project" button to create your AWS CodeBuild project.


CD process:
Configuring code deploy:

1. create application for each microservice in code deploy
2. create Ec2 instance for a platform where we want to deploy our application
3. create tag for EC2 instance which will we used by code deploy to refer to the target group. Note: codedeploy can deploy to single EC2 instance attached to tag or multiple instances attached to tag.
4. Install code deploy agent inside the EC2 instance which links the master and slave:
     ssh to the Ec2 instance, use the below documentation and install it.
   https://docs.aws.amazon.com/codedeploy/latest/userguide/codedeploy-agent-operations-install-ubuntu.html
6. Install docker inside ec2 instance using sudo apt update sudo apt install docker.io
7. Create 2 IAM roles for EC2 and code deploy to communicate with eachother
8. link appropriate IAM role to Ec2 instance
9. restart the code deploy agent service
10. In code deploy console, create deployment group for configuring target group
11. link the code deploy role created
12. Create deployment  in code deploy console, connect to github where appspec.yaml file is located, give commit id
13. Note: appspec.yml file should be under root of the github repository.

Invoking CI and CD using Codepipeline:
Configure code pipeline by refering to both code build and code deploy application. Also connect to github repo, so any changes uodated , code pipeline automatically get triggered and invokes the entire CI/CD process.
