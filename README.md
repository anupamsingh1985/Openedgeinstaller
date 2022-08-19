# Openedgeinstaller
This repo will be used to create Open Edge installer via chef
TODO: Enter the cookbook description here.

This Cookbook is being used to Install OpenEdge.

The OpenEdge installer is placed on a Amazon S3 Bucket.(https://openedge-anupam.s3.us-west-2.amazonaws.com/PROGRESS_OE_12.5.1_LNX_64.tar.gz)

The response.ini file is being delivered via Templates (installOpenedge/templates/) folder.


I have added some attributes to the cookbook so that the Response.ini file can be updates via variables.  The Original Recipe has been modified to working with the Attributes.
