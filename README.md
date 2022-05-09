https://www.youtube.com/watch?v=SLB_c_ayRMo&t=2717s

for terraform cloud
https://learn.hashicorp.com/tutorials/terraform/aws-remote?in=terraform/aws-get-started


workflow: just push or pr to remote master in gh, terraform cloud should detect changes then auto apply.

the other workflow is, just doing terraform apply on local, then it will update terraform cloud, but have to setup cloud to do it this way. cant have github workflow and local cli workflow at the same time.

for the first time auto deploying from gh to tf cloud, have to do it manually.