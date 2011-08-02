#!/bin/sh
#
# $Id: personalize.command 410 2006-12-26 13:26:18Z dhellmann $
#

PROJECT=AstronomyPictureOfTheDay

script_dir=`dirname $0`
workflow=$script_dir/${PROJECT}.workflow

echo
echo "###########################################################################"
echo 
echo "Adjusting USER"
echo " in $workflow"
echo " to $USER"
echo
echo "Press <Return> to continue"
echo "or Ctrl-C to cancel"
echo
echo -n "-->"
read input

# Move the workflow out of the way
mv $workflow/Contents/document.wflow $workflow/Contents/document.wflow.in

# Replace USER with $USER
cat $workflow/Contents/document.wflow.in | sed "s/USER/$USER/g" > $workflow/Contents/document.wflow

# Remove the temporary file
rm -f $workflow/Contents/document.wflow.in

