# Architect
Coding Challenge for Architect

Code was developed and tested on windows and chrome. Other platforms and browsers are supported, but are not 

Use the following steps to install the necessary software.
1. Install python 2.7 (32 Bit)
    https://www.python.org/ftp/python/2.7.16/python-2.7.16.msi

2. Install the packages inside packagesToInstall.txt
    pip install -r .\packagesToInstall.txt

3. Download and the Web Drivers (I used this version, but other browsers and versions are implicitly supported)
    Chrome (Version 74): https://chromedriver.storage.googleapis.com/index.html?path=74.0.3729.6/

    Others (Should work in theory, but untested)
    Chrome:	        https://sites.google.com/a/chromium.org/chromedriver/downloads
    Edge:	        https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver/
    Firefox:	    https://github.com/mozilla/geckodriver/releases
    Safari:	        https://webkit.org/blog/6900/webdriver-support-in-safari-10/

4. Install your webdriver using the following instructions (Copied from the offical "Browser drivers" section robotframework SeleniumLibrary, https://github.com/robotframework/SeleniumLibrary)
Browser drivers
---------------

After installing the library, you still need to install browser and
operating system specific browser drivers for all those browsers you
want to use in tests. These are the exact same drivers you need to use with
Selenium also when not using SeleniumLibrary. More information about
drivers can be found from `Selenium documentation`__.

The general approach to install a browser driver is downloading a right
driver, such as ``chromedriver`` for Chrome, and placing it into
a directory that is in PATH__. Drivers for different browsers
can be found via Selenium documentation or by using your favorite
search engine with a search term like ``selenium chrome browser driver``.
New browser driver versions are released to support features in
new browsers, fix bug, or otherwise, and you need to keep an eye on them
to know when to update drivers you use.

Alternatively, you can use a tool called WebdriverManager__ which can
find the latest version or when required, any version of appropriate
webdrivers for you and then download and link/copy it into right
location. Tool can run on all major operating systems and supports
downloading of Chrome, Firefox, Opera & Edge webdrivers.

Here's an example:

.. code:: bash

      pip install webdrivermanager
      webdrivermanager firefox chrome --linkpath /usr/local/bin

__ https://seleniumhq.github.io/selenium/docs/api/py/index.html#drivers
__ https://en.wikipedia.org/wiki/PATH_(variable)
__ https://github.com/omenia/webdrivermanager



To run the code, all you need to do is run the script "SuiteRun.py" with no arguments.
    python .\SuiteRun.py

