This Automator workflow downloads the latest image from the Astronomy
Picture of the Day site (http://antwrp.gsfc.nasa.gov/apod/astropix.html) 
and sets it as your desktop background.  It saves old copies of the
images in a folder within ~/Pictures to be used as screen saver
images.  The last step in the workflow is to open the APOD page in
Safari so you can read the description of the picture.

The inspiration for this script came from an article by Andy Ihnatko
(http://www.macobserver.com/columns/ihnatko/2005/20050429automator.shtml).

Installation:

 1. Unpack the ZIP file.
 2. Run the personalize.command script to set the proper names of the
directories within the workflow.
 3. Open the workflow within Automator.
 4. Run it.

To schedule the job to run daily, use Automator to save the workflow
as an application.  Then use iCal to schedule an event to run daily to
open the application.

You will want to periodically clean out the screensaver pictures
folder.

$Id: README.txt 410 2006-12-26 13:26:18Z dhellmann $
