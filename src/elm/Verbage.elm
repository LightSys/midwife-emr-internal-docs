module Verbage exposing (..)

-- LOCAL IMPORTS

import Model exposing (Model, VerbageRecord)


whatIsPage : String
whatIsPage =
    """
## What is Midwife-EMR?



#### it began with a need

Midwife-EMR was born out of the need for an electronic medical records system
to handle midwifery patients in a large charity lying-in maternity clinic in
the Philippines. After nearly 20 years of operation, the clinic was overwhelmed
with paperwork which meant that sometimes records took a while to locate.
Additional reporting requirements of various government agencies also meant the
staff was consumed with many hours of report "generation" by hand, often typing
the same information repeatedly for various reports because there was no
central computer system or software that would generate the reports that they
needed.

<img style="float: left; padding-right: 1em;" src="src/assets/IMG_6744_180x.JPG" >
After researching the various software alternatives available, it was
determined that affordable midwifery software that catered to the needs of
lying-in maternity clinics in the developing world *did not exist*.
Midwife-EMR was "born" of the twin goals of creating a medical records
system that was easy to use and was a high-quality medical records
management system.

#### it continues with a goal

<img style="float: right; padding-left: 1em;" src="src/assets/IMG_6288_180x.JPG" >
After the first phase of Midwife-EMR was finished which covered prenatal care,
Midiwfe-EMR was used in a large maternity clinic as a trial. The clinic used
Midwife-EMR exclusively and performed an average of 1,000 prenatal exams every
month. The clinic had up to 12 staff simultaneously using Midwife-EMR
performing various patient tasks such as recording medical data, patient
searches, checking in and out patients, running reports, etc.

It did not take long to realize that Midwife-EMR needed to be expanded to
encompass the full breadth of midwifery care - not just prenatal but labor,
delivery and postpartum as well. These features are still being developed as of
    October 2016.




    """


learnIntro : String
learnIntro =
    """

**Midwife-EMR** is software that is specifically made for midwifery clinics in
order to help manage patient medical records. Midwife-EMR is designed for the
full breadth of pregnancy care from prenatal through labor/delivery and
postpartum *(note that labor, delivery and post-partum features are still in
development)*.

<img style="float: right" src="src/assets/IMG_20161008_120337_rotated_scaled_200x.jpg" >
Midwife-EMR is free, open-source software that is designed to run on a small
appliance known as an Odroid XU4. The XU4 is inexpensive, powerful, and does
not use much electricity which allows it to operate for relatively long periods
of time on a battery backup system.

But from the perspective of a Midwife-EMR user, Midwife-EMR is simply an
application that is used in a web browser. That means that midwives can use the
application on everything from their laptop or desktop computers, their phones
or their tablets.

    """


featuresIntro : String
featuresIntro =
    """

Midwife-EMR has a number of features that are designed to the
particular needs of midwives.

- **Easy** to use web pages.
- Midwifes can use it on their **desktops, laptops, tablets and phones**.
- **No Internet required** to work.
- **Fast** patient searches on a number of different criteria.
- Quickly **generates reports** as required by the **Department of Health** and **PHIC**.
- **Unlimited** number of patients.
- **Strong security features**.

    """


howIntro : String
howIntro =
    """

Midwives find that **Midwife-EMR is easy to learn and here you can find answers
to many of the questions that you may have as you begin to explore using Midwife-EMR.

** how do I ...?**

- setup my Midwife-EMR appliance for the first time?
- add midwives and staff to Midwife-EMR?
- understand what the different roles are?
- generate a report?
- more ...

    """


trainingIntro : String
trainingIntro =
    """

Does your staff need additional training? Do you need help understanding how to
setup your initial medicines, vaccinations, and other tables? Do you wonder
what is the best way to start using Midwife-EMR in your clinic?

Watch our training videos to find out more about these topics and many more.

    """


howPageCards : Model -> List VerbageRecord
howPageCards model =
    [ { body = howSetup
      , title = "First time setup?"
      , teaser = """

How to install and setup the Midwife-EMR appliance itself. Follow these
instructions to get started.

        """
      }
    , { body = howRoles
      , title = "What are Midwife-EMR roles?"
      , teaser = """

What do roles mean in Midwife-EMR? Find out so that you can use Midwife-EMR and
take advantage of the various features that it offers.

        """
      }
    ]


howSetup : String
howSetup =
    """

**Note: if you are reading these instructions from the Midwife-EMR appliance
already, you probably have already done this.**

1. Verify that you have all of the pieces of the Midwife-EMR appliance.

- The appliance itself.
- The power adapter for the appliance.
- The wireless USB antenna (optional).
- A ethernet cable if you are going to attach it into your own network (again optional).

**Note: the wireless USB antenna and the ethernet cable connecting to your
router are optional in the sense that you do not need them both. But you do
need at least one of them in order to use the Midwife-EMR application.**

1. Plug either the wireless antenna into one of the USB ports on the appliance
or the ethernet cable into the ethernet port on your appliance.

   - TODO: pictures here

1. Plug the power adapter into A/C power and then into the appliance itself.
There is only one hole in the appliance that this fits into and it is labeled
"5V-4A" underneath the hole.

   - TODO: picture

1. Wait for the appliance to come online, usually in less than one minute.

1. **If using the wireless antenna:** Now using a device that can connect to a
wireless network such as a laptop, tablet or phone, look for the new wireless
network called "Midwife-EMR".

   1. Log into this network with the password "midwifery".

   1. Once you are logged in, use your web browser to go to
   **[https://192.168.222.1](https://192.168.222.1)**.

1. **If using the ethernet cable:** You will need to login to your router in
order to find the IP address that has been assigned to the Midwife-EMR
appliance. The Midwife-EMR appliance will request an IP address from your
router using DHCP. Once you have that address, use your web browser to go to
it.

   - For example, if you router assigned the Midwife-EMR appliance an address
   of **192.168.0.23**, you would type this address into your browser address
   bar: **https://192.168.0.23**

   - Do not forget to type **https**. If you type **http** (without the "s"),
   then you will arrive at the documentation pages (same as you are reading
   now). If you get there, you will find a link to the Midwife-EMR system in
   the upper right hand corner of the page that you can click on to access the
   Midwife-EMR system.

1. Once you have reached the Midwife-EMR system using your web browser, you
will see the login page. For a fresh installation, there already is one user
account in the Midwife-EMR system - the username is "admin" and the password is
"admin". Login using that username and password.

1. Once logged in, immediately change the admin password to something that you
will remember and is secure. Please do not lose the password.

   1. Click on the profile menu in the upper right hand corner of the page.
   1. Enter your new password in both password fields and click "Save" at the bottom.

1. Now setup more user accounts...



    """


howRoles : String
howRoles =
    """

**What is a role?** The "roles" in Midwife-EMR are like job descriptions.
Midwife-EMR recognizes that many clinics have staff that are midwives and/or
nurses and other staff that are clerks, or guards, etc. The purpose of roles in
Midwife-EMR is to allow some staff full access to medical information, for
example, the supervisor and attending roles. Other staff may have much more
limited access (such as the clerk role). Some roles might only have access to
patient names such as the guard role. Finally, the administrator role cannot
view or change patient information at all, but can configure how Midwife-EMR
operates.

**Are all roles necessary?** Of course, in your clinic your director may decide
to not use all of the roles.  That is fine because roles exist to make the
Midwife-EMR system easier to use and you can use it as seems best for your
clinic. At a minimum, every Midwife-EMR installation will require the use of
    the administrator and supervisor roles.

**What if a person needs more than one role?** Finally, each staff member in
the system can only be assigned one role. In certain cases, for example the
clinic director, there is a need for one person to have access to multiple
roles. In that case, it is as simple as creating a user account for each role.
When needing to use Midwife-EMR in the other role, it is as simple as logging
out and logging in again using the other user account.

**Can more than one person be in the same role?** Yes, that is how Midwife-EMR
is supposed to be used. It is assumed that you will have many users that are
assigned the same role. For example, maybe you have 3 lead midwive supervisors
named "Sari", "Stacy" and "Sue" who would be in the supervisor role. Maybe you
don't have any trainees right now so there is no one in the attending role. But
you do have 2 clerk, "Carrie" and "Cris", and two administrators, "Angelie" and
"Ariel". In other words, there is no limit to the number of users that can be
assigned a role. The only limitation is that any one user account can only be
associated with one role.

So, what are the roles? There are five (5) roles within Midwife-EMR.

**Administrator:** The administrator role is for persons that can set up the
Midwife-EMR system for your clinic. The administrator cannot view or edit
any patient data. Instead, the administrator's role enables that person or
persons to do things like manage users (add, edit, deactivate staff), manage
medications and vaccinations, set the clinic name, address and other
information, etc.

**Supervisor:** The supervisor role is for senior midwives. Any user assigned
the supervisor role can see and change all medical information for any patient.

**Attending:** The attending role is for midwives in training. Any user
assigned the attending role will need to choose a supervisor that she is
reporting to from a list of supervisors whenever she logs into the Midwife-EMR
system. The assumption is that a user in the attending role is being taught and
supervised by a supervisor.

**Clerk:** The clerk role is for staff that are not midwives but are helping
with patient management. The only patient information that a user in the clerk
role can change is recording blood pressure and weight. But there are numerous
other functions that the clerk can perform such as running reports, checking in
and out patients, etc.

**Guard:** The guard role is for staff that are solely responsible for checking
in and out patients. This role is optional in that usually only large clinics
    will find the need for this role. The users that have the guard role do not
    have any access to patient medical information, but they are able to do
    patient searches in order to allow them to check in and check out patients.

**Summary:** The only two roles that are essential are the administrator and
the supervisor roles. Even at that, only the supervisor role will likely be
used every day. The administrator role is only used for the initial system
configuration of Midwife-EMR and on occasion when settings need to be adjusted.

    """



{- To add to the how section:
   - adding users
   - reports
   - Viewing history
   - Checking in/out, how it works, and is optional
   - labor/delivery/post-partum is coming
-}


setupPageCards : List VerbageRecord
setupPageCards =
    [ { body = viewSetupNow
      , title = "Go to Midwife-EMR Now"
      , teaser = """

If you have already installed the CA Certificate (see below), start using **Midwife-EMR** now.

        """
      }
    , { body = viewSetupWhyCA
      , title = "Why use a CA Certificate?"
      , teaser = """

In order to maintain security, before you can use the Midwife-EMR system, you
need to install a CA certificate on each computer, tablet, and phone that will
be using it.

        """
      }
    , { body = viewSetupCAInstructionsChrome
      , title = "Install a CA Certificate in Google Chrome"
      , teaser = """

Find out how to install the CA certificate in your Chrome web browser if you are using a desktop, laptop, or Mac.

        """
      }
    , { body = viewSetupCAInstructionsFirefox
      , title = "Install a CA Certificate in Firefox"
      , teaser = """

Find out how to install the CA certificate in your Firefox web browser if you are using a desktop, laptop, or Mac.

        """
      }
    , { body = viewSetupCAInstructionsChromium
      , title = "Install a CA Certificate in Chromium"
      , teaser = """

Find out how to install the CA certificate in your Chromium (not Chrome) web browser if you are using a desktop, laptop, or Mac.

        """
      }
    , { body = viewSetupCAInstructionsFirefoxAndroid
      , title = "Install a CA Certificate in Firefox on Android"
      , teaser = """

We do not recommend using Firefox on Android. See why below.

        """
      }
    , { body = viewSetupCAInstructionsKindleFire
      , title = "Install a CA Certificate in a Kindle Fire device"
      , teaser = """

Find out how to install the CA certificate in your Kindle Fire.

        """
      }
    , { body = viewSetupCAInstructionsIPadPhone
      , title = "Install a CA Certificate in an Apple device"
      , teaser = """

Find out how to install the CA certificate in your Apple iPhone or iPad.

        """
      }
    ]


viewSetupNow : String
viewSetupNow =
    """

##### Start Now

Use the link in the top right corner of this page to start using Midwife-EMR now.

    """


viewSetupWhyCA : String
viewSetupWhyCA =
    """

##### Security

Security about medical records is very important and Midwife-EMR
takes security seriously. That is why there are special, extra steps that you
need to take before you can use the Midwife-EMR system. These steps help insure
that the computers, tablets, and phones that you have specifically configured
are able to access the Midwife-EMR system.


##### What do I do?

Any computer, tablet, or phone that needs to log into your Midwife-EMR system
will need to have a CA certificate installed in it first. What is a CA
certificate? It is simply a file - it is not a program or an app - it is just a
file that tells your computer, tablet, or phone the information it needs to
know about the Midwife-EMR system.

What follows are the instructions for your various devices such as computers,
tablets, and phones. There are separate instructions for each - it would be
nice if the way to installing the file was the same for each, but unfortunately
it is not. That is not the fault of Midwife-EMR, that is just the way that the
computers, tablets, and phones were made. Below you will find specific
instructions for each type of device that you have. Please refer to each
section as necessary depending on the type of device. It is likely that you
will have many different types of devices, for example, someone will have a
laptop and someone else will have a phone, etc.

    """


viewSetupCAInstructionsChrome : String
viewSetupCAInstructionsChrome =
    """

```
TODO: Add pictures.
```

###### Google Chrome Web Browser

1. First you need the CA certificate file, which you can download here:
<a href="midwife-emr-ca.crt">Midwife-EMR CA Certificate</a>. Please save this
file where you know you can find it for the steps that follow. (The desktop is
often a good choice.)

1. <img style="float: right" src="src/assets/ChromiumMenu.png" > First, open settings in the Chromium browser which are in the upper right hand corner. Click on the three dots you see. Choose the **Settings** menu item.

1. Scroll to the bottom of the new page shown and click on the **Show advanced
settings...** link.

1. <img style="float: right" src="src/assets/ChromiumManageCertificatesButton.png" > Scroll farther down now
and find the section called **HTTPS/SSL**. Click on the **Manage certificates**
button.

1. This will open a dialog called the **Certificate Manager**. First choose the
fourth tab at the top called **Trusted Root Certificate Authorities** and then
    click the **Import...** button at the bottom. It is important that you
    click the import button on this tab, not on any other tab.

1. You will see the Certificate Import Wizard dialog. Click on the **Next** button.

1. The next page, called the File to Import page, will want you to specify the
CA file to import. Press the **Browse** button and find the CA file that you
saved in step 1. Click the **Open** button once you have found and selected the
file. Back in the File to Import dialog, click on the **Next** button.

1. The radio button should already have "Place all certificates in the
following store" selected and below that it should list the "Trusted Root
Certificate Authorities". If that is the case, click on the **Next** button. If
that is not the case, go back a few steps and make sure that the "Trusted Root
Certificate Authorities" tab is selected.

1. The final page of the wizard should be titled "Completing the Certificate
Import Wizard". Click on the **Finish** button at the bottom.

1. This will bring up a "Security Warning" box. At the bottom it will ask, "Do
you want to install this certificate?" Click on the **Yes** button.

1. It should display a message that the import was successful.

1. Click on the **Close** button on the Certificates dialog and then close the
Settings tab in the browser.


    """


viewSetupCAInstructionsChromium : String
viewSetupCAInstructionsChromium =
    """

###### Chromium Web Browser

1. First you need the CA certificate file, which you can download here:
<a href="midwife-emr-ca.crt">Midwife-EMR CA Certificate</a>. Please save this
file where you know you can find it for the steps that follow. (The desktop is
often a good choice.)

1. <img style="float: right" src="src/assets/ChromiumMenu.png" > First, open settings in the Chromium browser which are in the upper right hand corner. Click on the three dots you see. Choose the **Settings** menu item.

1. Scroll to the bottom of the new page shown and click on the **Show advanced
settings...** link.

1. <img style="float: right" src="src/assets/ChromiumManageCertificatesButton.png" > Scroll farther down now
and find the section called **HTTPS/SSL**. Click on the **Manage certificates**
button.

1. This will open a dialog called the **Certificate Manager**. First choose the
third tab at the top called **Authorities** and then click the **Import...**
button at the bottom. It is important that you click the import button on the
Authorities tab, not on any other tab.

   <img src="src/assets/ChromiumCertificateManager2.png" >

1. Find the CA certificate file that you downloaded in step 1 above. Choose
this file and press the Open button in the file selection dialog.

1. You will see the Certificate Authority dialog next and you need to check the
top checkbox and then click on Ok.

   <img src="src/assets/ChromiumImportDialog2.png" >

1. (Optional) In order to confirm that the certificate was imported into
Chromium, scroll through the list until you find the Midwife-EMR certificate. The
certificates are sorted by name so it should be located somewhere close to the
middle of the list. After you see it, you can click the **Done** button to
close the Certificate Manager dialog.

   <img src="src/assets/ChromiumImportedCert.png" >

Now you are ready to begin using the Midwife-EMR system.

    """


viewSetupCAInstructionsFirefox : String
viewSetupCAInstructionsFirefox =
    """

###### Firefox Web Browser

1. First you need the CA certificate file, which you can download here:
<a href="midwife-emr-ca.crt" rel="nofollow">Midwife-EMR CA Certificate</a>. Please save this
file where you know you can find it for the steps that follow. (The desktop is
often a good choice.)


    """


viewSetupCAInstructionsFirefoxAndroid : String
viewSetupCAInstructionsFirefoxAndroid =
    """

###### Firefox Web Browser in Android

The Android version of Firefox is not recommended for use with the Midwife-EMR
system. This is because currently it does not allow for the management of
custom CA certificates which Midwife-EMR requires.

We recommend that you use the Chrome Web Browser for Android instead.
    """


viewSetupCAInstructionsKindleFire : String
viewSetupCAInstructionsKindleFire =
    """

1. First you need the CA certificate file, which you can download here: <a
href="midwife-emr-ca.der.crt">Midwife-EMR CA Certificate for Fire</a>. This will
by default download the file to your Download directory.

2. You will likely be immediately prompted at the bottom of the screen with an
option to **Open** the file. Press **Open**.

3. (Optional, if needed) If you do not see the prompt in step 2, or miss it, you can
open the Download folder and select the **midwife-emr-ca.der.crt** file in
order to start the installation process. But you may need to install an app
from the App store in order to do this. The ES File Explorer app or one like it
will work.

4. You will see a dialog box titled "Name the certificate". In the
**Certificate name** field, enter a reasonable name for the certificate such as
"Midwife-EMR". The name is for your sake in remembering why this certificate
was installed.

5. The **Credential use** field should already say "VPN and apps", so there is
no need to change it. The certificate will not be used for any VPN usage, but
it will be used for the Midwife-EMR application.

6. Press the **Ok** button in the dialog.

7. You may see an **Attention** dialog box informing you that you need to set a
lock screen PIN or password before you can use credential storage. You will
only see this dialog if you do not have a lock screen PIN or password already
set. Press **Ok** and it will take you to a **Lock Screen Passcode** screen.
Choose to set either a PIN or password according to your preference (you select
one or the other at the top). Then press the **Finish** button.

8. Finally, because you installed this certificate which did not come with the Kindle
Fire, you will need a new warning message when you swipe down from the top of your
Kindle. It will say, "Network may be monitored: By an unknown party". This is because
the Kindle cannot distinguish between a VPN certificate and one that is used for an
application. The Midwife-EMR application does not monitor the network and it does not
operate as a VPN. You can safely ignore this warning.

    """


viewSetupCAInstructionsIPadPhone : String
viewSetupCAInstructionsIPadPhone =
    """

##### Apple iPad and iPhone


    """
